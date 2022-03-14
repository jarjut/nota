import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../../../models/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final router = VRouter.of(context);
    return Card(
      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(30),
        onTap: () {
          if (router.names.first == AppRoute.SearchNotesRoute) {
            router.toNamed(AppRoute.SearchedNoteRoute,
                pathParameters: {'id': '${note.id}'});
          } else {
            router.toNamed(AppRoute.NoteRoute,
                pathParameters: {'id': '${note.id}'});
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              Text(
                note.note,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (note.title != '') {
      return Column(
        children: [
          Text(
            note.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8.0),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
