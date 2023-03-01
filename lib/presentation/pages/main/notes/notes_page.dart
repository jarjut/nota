import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/notes/bloc/notes_watch_bloc.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';
import 'package:nota/presentation/pages/main/search_app_bar.dart';
import 'package:nota/presentation/pages/main/widgets/list_notes.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: const SearchAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, // TODO: Add new note
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
              final notes = state.notes
                  .where((note) => !note.isArchived && !note.isDeleted)
                  .toList();

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
