import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../../../constants/constants.dart';
import '../../../../repositories/authentication_repository.dart';
import '../../main_appbar.dart';
import '../../main_wrapper.dart';
import '../bloc/notes_bloc.dart';
import '../widgets/list_notes.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > kDesktopBreakpoint;
    return MainWrapper(
      appBar: MainAppBar(
        title: const Text('Trash Notes'),
        actions: isDesktop
            ? null
            : [
                IconButton(
                  onPressed: () => VRouter.of(context).toNamed(AppRoute.SearchNotesRoute),
                  icon: const Icon(Icons.search),
                ),
              ],
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            final notes = state.notes.where((note) => note.deleted).toList();

            return ListNotes(
              notes: notes,
              emptyIconData: Icons.delete,
              emptyText: 'No notes in Trash',
            );
          } else {
            final uid = RepositoryProvider.of<AuthenticationRepository>(context).currentUser.id;
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
