import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/app_route.dart';
import '../../../constants/constants.dart';
import '../../../utils/debouncer.dart';
import '../../../utils/mediaquery_util.dart';
import '../main_wrapper.dart';
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
    final mediaQuery = MediaQueryUtil(context);
    final _notesState = BlocProvider.of<NotesBloc>(context).state;
    if (_notesState is NotesLoaded) {
      return VWidgetGuard(
        onPop: (vRedirector) async {
          if (vRedirector.historyCanBack()) {
            vRedirector.historyBack();
          } else {
            vRedirector.pop();
          }
        },
        child: MainWrapper(
          appBar: Builder(
            builder: (context) {
              if (mediaQuery.isDesktop()) {
                return AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: kDesktopToolbarHeight,
                  title: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        width: 230.0,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 36.0,
                              child: Image.asset('assets/icons/nota-icon.png'),
                            ),
                            const SizedBox(width: 12.0),
                            Text(
                              'Search',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: kDesktopToolbarHeight - 12.0,
                          child: TextField(
                            controller: _searchFieldController,
                            autofocus: true,
                            onChanged: (value) {
                              _debouncer.run(() => _searchCubit.searchNotes(_notesState.notes, value));
                            },
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 18,
                                ),
                            decoration: InputDecoration(
                              hintText: 'Search notes',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  right: 12.0,
                                  left: 9.0,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Theme.of(context).textTheme.bodyText1!.color,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.15),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide.none,
                              ),
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
                      ),
                    ],
                  ),
                );
              } else {
                return AppBar(
                  leading: IconButton(
                    onPressed: () => VRouter.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: TextField(
                    controller: _searchFieldController,
                    autofocus: true,
                    onChanged: (value) {
                      _debouncer.run(() => _searchCubit.searchNotes(_notesState.notes, value));
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
                );
              }
            },
          ),
          drawer: MediaQuery.of(context).size.width > kDesktopBreakpoint,
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
