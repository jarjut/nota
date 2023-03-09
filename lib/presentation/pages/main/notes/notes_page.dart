import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';
import 'package:nota/presentation/pages/main/search_app_bar.dart';
import 'package:nota/presentation/pages/main/widgets/list_notes.dart';

enum NotesPageType { general, archive, trash }

class NotesPage extends StatelessWidget {
  const NotesPage({
    super.key,
    this.type = NotesPageType.general,
  });

  final NotesPageType type;

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: const SearchAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/note'),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NotesWatchBloc, NotesWatchState>(
        builder: (context, state) {
          return state.map(
            initial: (_) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loadInProgress: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (state) {
              final notes = state.notes.where((note) {
                switch (type) {
                  case NotesPageType.general:
                    return !note.isArchived && !note.isDeleted;
                  case NotesPageType.archive:
                    return note.isArchived;
                  case NotesPageType.trash:
                    return note.isDeleted;
                }
              }).toList();

              return ListNotes(
                notes: notes,
              );
            },
          );
        },
      ),
    );
  }
}
