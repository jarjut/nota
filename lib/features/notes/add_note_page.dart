import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:vrouter/vrouter.dart';

import '../../app/bloc/authentication_bloc.dart';
import '../../models/Note.dart';
import 'bloc/notes_bloc.dart';
import 'widgets/note_form.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _titleFieldController = TextEditingController();
  final _noteQuillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    final _user = BlocProvider.of<AuthenticationBloc>(context).state.user;

    void safeNote() {
      final note = Note(
        title: _titleFieldController.text,
        note: _noteQuillController.document.toPlainText().trim(),
        noteQuillDelta: _noteQuillController.document.toDelta().toJson(),
        uid: _user.id,
      );
      if (!note.isEmpty) {
        BlocProvider.of<NotesBloc>(context).add(
          AddNote(note),
        );
      }
    }

    return VWidgetGuard(
      onPop: (vRedirector) async {
        safeNote();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: NoteForm(
          titleFieldController: _titleFieldController,
          noteQuillController: _noteQuillController,
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
