import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/bloc/authentication_bloc.dart';
import '../../../../models/note.dart';
import '../../main_appbar.dart';
import '../../main_wrapper.dart';
import '../bloc/notes_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _addNoteFormKey = GlobalKey<FormState>();
  final _titleFieldController = TextEditingController();
  final _noteFieldController = TextEditingController();
  final _noteQuillController = QuillController.basic();

  @override
  void dispose() {
    super.dispose();
    _titleFieldController.dispose();
    _noteQuillController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _user = BlocProvider.of<AuthenticationBloc>(context).state.user;

    void safeNote() {
      final note = Note(
        title: _titleFieldController.text,
        note: _noteFieldController.text,
        uid: _user.id,
      );
      if (!note.isEmpty) {
        BlocProvider.of<NotesBloc>(context).add(
          AddNote(note),
        );
      }
    }

    return VWidgetGuard(
      beforeLeave: (vRedirector, _) async {
        safeNote();
      },
      child: MainWrapper(
        appBar: MainAppBar(
          leading: IconButton(
            onPressed: () => VRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () => VRouter.of(context).pop(),
              icon: const Icon(Icons.done),
            ),
          ],
        ),
        drawer: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _addNoteFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _titleFieldController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      QuillEditor(
                        controller: _noteQuillController,
                        scrollController: ScrollController(),
                        scrollable: true,
                        focusNode: FocusNode(),
                        autoFocus: true,
                        readOnly: false,
                        expands: false,
                        padding: EdgeInsets.zero,
                        placeholder: 'Write your notes here',
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: QuillToolbar.basic(
                    multiRowsDisplay: false,
                    showCameraButton: false,
                    showVideoButton: false,
                    showCodeBlock: false,
                    controller: _noteQuillController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
