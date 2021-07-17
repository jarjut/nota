import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/repositories/authentication_repository.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../main_wrapper.dart';
import '../bloc/notes_bloc.dart';
import '../widgets/list_notes.dart';
import '../widgets/notes_app_bar.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: const NotesAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.vRouter.toNamed(AppRoute.AddNotesRoute),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            final notes = state.notes
                .where((note) => !note.archived && !note.deleted)
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
