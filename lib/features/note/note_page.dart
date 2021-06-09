import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../models/Note.dart';
import '../../repositories/notes_repository.dart';
import 'bloc/note_bloc.dart';

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
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final noteBloc = NoteBloc(
      notesRepository: RepositoryProvider.of<FirebaseNotesRepository>(context),
    );
    final noteId = VRouter.of(context).pathParameters['id'];
    noteBloc.add(LoadNote(noteId.toString()));

    void formOnChanged(Note note) {
      final newNote = note.copyWith(
        title: _titleFieldController.text,
        note: _noteFieldController.text,
      );
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (newNote.id != null) {
          noteBloc.add(UpdateNote(newNote));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: BlocConsumer<NoteBloc, NoteState>(
          bloc: noteBloc,
          listener: (context, state) {
            _titleFieldController.value =
                TextEditingValue(text: state.note.title);
            _noteFieldController.value =
                TextEditingValue(text: state.note.note);
          },
          builder: (context, state) {
            return Form(
              key: _addNoteFormKey,
              onChanged: () => formOnChanged(state.note),
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
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _noteFieldController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
