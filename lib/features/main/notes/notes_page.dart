import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/app_route.dart';
import '../main_wrapper.dart';
import 'bloc/notes_bloc.dart';
import 'widgets/list_notes.dart';
import 'widgets/notes_app_bar.dart';

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
            return ListNotes(
              notes: state.notes,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
