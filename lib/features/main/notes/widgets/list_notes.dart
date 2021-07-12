import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../models/Note.dart';
import 'note_item.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      // TODO: Empty Note View
      return Container();
    } else {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(4),
            sliver: SliverStaggeredGrid.extentBuilder(
              maxCrossAxisExtent: 200,
              itemCount: notes.length,
              itemBuilder: (context, index) => NoteItem(note: notes[index]),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          )
        ],
      );
    }
  }
}
