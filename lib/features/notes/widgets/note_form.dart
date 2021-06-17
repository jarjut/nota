import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'app_quill_toolbar.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({
    Key? key,
    required TextEditingController titleFieldController,
    required QuillController noteQuillController,
  })  : _titleFieldController = titleFieldController,
        _noteQuillController = noteQuillController,
        super(key: key);

  final TextEditingController _titleFieldController;
  final QuillController _noteQuillController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                  child: Container(
                    child: QuillEditor(
                        controller: _noteQuillController,
                        placeholder: 'Write your notes here',
                        scrollController: ScrollController(),
                        scrollable: true,
                        focusNode: FocusNode(),
                        autoFocus: true,
                        readOnly: false,
                        expands: false,
                        padding: EdgeInsets.zero),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AppQuillToolbar(controller: _noteQuillController),
        ),
      ],
    );
  }
}
