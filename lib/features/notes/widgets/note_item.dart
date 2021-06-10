import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../../models/Note.dart';

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
        onTap: () =>
            router.pushNamed('noteRoute', pathParameters: {'id': '${note.id}'}),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              Text(
                '${note.note}',
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
            '${note.title}',
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
