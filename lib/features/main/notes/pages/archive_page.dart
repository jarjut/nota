import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/authentication_repository.dart';
import '../../main_appbar.dart';
import '../../main_wrapper.dart';
import '../bloc/notes_bloc.dart';
import '../widgets/list_notes.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: const MainAppBar(
        title: Text('Archived Notes'),
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            final notes = state.notes
                .where((note) => note.archived && !note.deleted)
                .toList();

            return ListNotes(
              notes: notes,
            );
          } else {
            final uid = RepositoryProvider.of<AuthenticationRepository>(context)
                .currentUser
                .id;
            BlocProvider.of<NotesBloc>(context).add(LoadNotes(uid));

            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
