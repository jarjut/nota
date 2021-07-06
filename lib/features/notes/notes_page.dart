import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../app/app_route.dart';
import '../../widgets/app_drawer.dart';
import 'bloc/notes_bloc.dart';
import 'widgets/list_notes.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () => context.vRouter.toNamed(AppRoute.SearchNotesRoute),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).hintColor.withAlpha(80),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Builder(
                  builder: (context) {
                    return SizedBox(
                      height: 30,
                      width: 30,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Search notes',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 18, color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.vRouter.toNamed(AppRoute.AddNotesRoute),
        child: const Icon(Icons.add),
      ),
    );
  }
}
