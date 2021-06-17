import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as flutter_quill;
import 'package:vrouter/vrouter.dart';

import '../../models/Note.dart';
import 'bloc/notes_bloc.dart';
import 'widgets/note_form.dart';

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
  late TextEditingController _titleFieldController;
  late flutter_quill.QuillController _noteQuillController;
  bool controllerInitialized = false;
  String? noteId;
  Note? note;

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

    void safeNote() {
      var note = this.note!.copyWith(
            title: _titleFieldController.text,
            note: _noteQuillController.document.toPlainText().trim(),
            noteQuillDelta: _noteQuillController.document.toDelta().toJson(),
          );
      if (!note.isEmpty) {
        this.note = note;
        BlocProvider.of<NotesBloc>(context).add(
          UpdateNote(note),
        );
      }
    }

    return VWidgetGuard(
      onPop: (vRedirector) async {
        safeNote();
      },
      child: Scaffold(
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
        body: BlocListener<NotesBloc, NotesState>(
          listener: (context, state) {
            if (state is NotesLoaded) {
              if (!state.notes.contains(note)) {
                Navigator.pop(context);
              }
            }
          },
          child: BlocBuilder<NotesBloc, NotesState>(
            builder: (context, state) {
              if (state is NotesLoaded) {
                var note = state.notes.firstWhere((note) => note.id == noteId,
                    orElse: () => Note());
                this.note = note;

                if (!controllerInitialized) {
                  controllerInitialized = true;
                  _titleFieldController =
                      TextEditingController(text: note.title);
                  _noteQuillController = flutter_quill.QuillController(
                    document:
                        flutter_quill.Document.fromJson(note.noteQuillDelta),
                    selection: const TextSelection.collapsed(offset: 0),
                  );
                }

                return NoteForm(
                  titleFieldController: _titleFieldController,
                  noteQuillController: _noteQuillController,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _noteQuillController.dispose();
    super.dispose();
  }
}
