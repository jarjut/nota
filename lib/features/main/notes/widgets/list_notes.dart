import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/constants/breakpoints.dart';

import '../../../../models/Note.dart';
import 'note_item.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width <= kMobileBreakpoint;
    if (notes.isEmpty) {
      // TODO: Empty Note View
      return const Center(
        child: Text('Empty Notes'),
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(isMobile ? 4 : 12),
            sliver: SliverStaggeredGrid.extentBuilder(
              maxCrossAxisExtent: 300,
              itemCount: notes.length,
              itemBuilder: (context, index) => NoteItem(note: notes[index]),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              mainAxisSpacing: isMobile ? 0 : 4,
              crossAxisSpacing: isMobile ? 0 : 4,
            ),
          )
        ],
      );
    }
  }
}
