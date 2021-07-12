import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/main/main_wrapper.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/app_route.dart';
import '../../../utils/debouncer.dart';
import '../notes/bloc/notes_bloc.dart';
import '../notes/widgets/list_notes.dart';
import 'cubit/search_notes_cubit.dart';

class SearchNotesPage extends StatefulWidget {
  const SearchNotesPage({Key? key}) : super(key: key);

  @override
  _SearchNotesPageState createState() => _SearchNotesPageState();
}

class _SearchNotesPageState extends State<SearchNotesPage> {
  final _searchCubit = SearchNotesCubit();
  final _searchFieldController = TextEditingController();
  final _debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final _notesState = BlocProvider.of<NotesBloc>(context).state;
    if (_notesState is NotesLoaded) {
      return MainWrapper(
        appBar: AppBar(
          title: TextField(
            controller: _searchFieldController,
            autofocus: true,
            onChanged: (value) {
              _debouncer.run(
                  () => _searchCubit.searchNotes(_notesState.notes, value));
            },
            textAlignVertical: TextAlignVertical.top,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 18,
                ),
            decoration: InputDecoration(
              hintText: 'Search notes',
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  _searchFieldController.value = TextEditingValue.empty;
                },
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ),
        drawer: null,
        body: BlocBuilder<SearchNotesCubit, SearchNotesState>(
          bloc: _searchCubit,
          builder: (context, state) {
            if (state is SearchNotesLoaded) {
              if (state.notes.isEmpty) {
                return const Center(
                  child: Text('Notes not found'),
                );
              } else {
                return ListNotes(notes: state.notes);
              }
            } else {
              return const Center(
                child: Text('Search notes'),
              );
            }
          },
        ),
      );
    } else {
      VRouter.of(context).toNamed(AppRoute.NotesRoute);
      return Container();
    }
  }

  @override
  void dispose() {
    _searchCubit.close();
    _searchFieldController.dispose();
    super.dispose();
  }
}
