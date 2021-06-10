import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../models/Note.dart';
import '../../utils/debouncer.dart';
import 'bloc/notes_bloc.dart';

enum NoteMenuPopUp {
  delete,
}

class NotePage extends StatefulWidget {
  const NotePage({
    Key? key,
  }) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _addNoteFormKey = GlobalKey<FormState>();
  final _titleFieldController = TextEditingController();
  final _noteFieldController = TextEditingController();
  final Debouncer _debounce = Debouncer(milliseconds: 500);
  String? noteId;
  Note? note;

  void formOnChanged(Note note) {
    final newNote = note.copyWith(
      title: _titleFieldController.text,
      note: _noteFieldController.text,
      updatedOn: Timestamp.now(),
    );
    _debounce.run(
        () => BlocProvider.of<NotesBloc>(context).add(UpdateNote(newNote)));
  }

  Future<void> _showDeleteDialog(Note note) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Note'),
            content: const Text('Are you sure you want to delete this note?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<NotesBloc>(context).add(DeleteNote(note));
                  Navigator.pop(context);
                  VRouter.of(context).pop();
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    noteId = VRouter.of(context).pathParameters['id'];

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (NoteMenuPopUp selected) {
              if (selected == NoteMenuPopUp.delete) {
                if (note != null) {
                  _showDeleteDialog(note!);
                }
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<NoteMenuPopUp>>[
              const PopupMenuItem(
                value: NoteMenuPopUp.delete,
                child: Text('Delete Item'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            var note = state.notes.firstWhere((note) => note.id == noteId);
            this.note = note;
            if (_noteFieldController.value == TextEditingValue.empty) {
              _titleFieldController.text = note.title;
              _noteFieldController.text = note.note;
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Form(
                key: _addNoteFormKey,
                onChanged: () => formOnChanged(note),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleFieldController,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                      ),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _noteFieldController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Write your notes here',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _noteFieldController.dispose();
    _debounce.cancel();
    super.dispose();
  }
}
