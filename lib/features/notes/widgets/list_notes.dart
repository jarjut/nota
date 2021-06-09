import 'package:flutter/material.dart';

import '../../../models/Note.dart';
import 'note_item.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Container();
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return NoteItem(
            note: note,
          );
        },
      );
    }
  }
}
