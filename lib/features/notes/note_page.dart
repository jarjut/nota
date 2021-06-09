import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../models/Note.dart';
import '../../utils/debouncer.dart';
import 'bloc/notes_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    final noteId = VRouter.of(context).pathParameters['id'];

    void formOnChanged(Note note) {
      final newNote = note.copyWith(
        title: _titleFieldController.text,
        note: _noteFieldController.text,
      );
      _debounce.run(
          () => BlocProvider.of<NotesBloc>(context).add(UpdateNote(newNote)));
    }

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            var note = state.notes.firstWhere((note) => note.id == noteId);
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
