import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/constants/breakpoints.dart';

import '../../../../models/note.dart';
import 'note_item.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({
    Key? key,
    required this.notes,
    this.emptyIconData = Icons.article,
    this.emptyText = "You don't have any Note",
  }) : super(key: key);

  final List<Note> notes;

  /// Icon for empty note
  final IconData emptyIconData;

  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width <= kMobileBreakpoint;
    if (notes.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              emptyIconData,
              color: Theme.of(context).hintColor.withOpacity(0.1),
              size: 112.0,
            ),
            const SizedBox(height: 12.0),
            AutoSizeText(
              emptyText,
              maxLines: 1,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(isMobile ? 4 : 12),
            sliver: StaggeredGrid.extent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: isMobile ? 0 : 4,
              crossAxisSpacing: isMobile ? 0 : 4,
              children: notes.map((note) => NoteItem(note: note)).toList(),
            ),
          )
        ],
      );
    }
  }
}
