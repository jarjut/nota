import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/domain/notes/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(30),
        onTap: () {
          context.push('/note?id=${note.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              Text(
                note.note,
                style: Theme.of(context).textTheme.titleMedium,
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
