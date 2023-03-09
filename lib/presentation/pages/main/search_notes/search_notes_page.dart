import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/application/notes/search_notes/search_notes_bloc.dart';
import 'package:nota/core/constants/constants.dart';
import 'package:nota/core/utils/mediaquery_util.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/l10n/l10n.dart';
import 'package:nota/presentation/pages/main/main_wrapper.dart';
import 'package:nota/presentation/pages/main/widgets/list_notes.dart';

class SearchNotesPage extends StatelessWidget {
  const SearchNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchNotesBloc>(),
      child: const SearchNotesBody(),
    );
  }
}

class SearchNotesBody extends StatefulWidget {
  const SearchNotesBody({super.key});

  @override
  State<SearchNotesBody> createState() => _SearchNotesBodyState();
}

class _SearchNotesBodyState extends State<SearchNotesBody> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);
    return BlocBuilder<NotesWatchBloc, NotesWatchState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return MainWrapper(
              appBar: Builder(
                builder: (context) {
                  if (mediaQuery.isDesktop()) {
                    return AppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: kDesktopToolbarHeight,
                      title: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            width: 230,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 36,
                                  child:
                                      Image.asset('assets/icons/nota-icon.png'),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  context.l10n.searchNotesPageTitle,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: kDesktopToolbarHeight - 12.0,
                              child: TextField(
                                controller: _searchController,
                                autofocus: true,
                                onChanged: (value) {
                                  context.read<SearchNotesBloc>().add(
                                        SearchNotesEvent.search(
                                          state.notes,
                                          value,
                                        ),
                                      );
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 18,
                                    ),
                                decoration: InputDecoration(
                                  hintText: context.l10n.searchNotesBarHint,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 12,
                                      left: 9,
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _searchController.value =
                                          TextEditingValue.empty;
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
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      title: TextField(
                        controller: _searchController,
                        autofocus: true,
                        onChanged: (value) {
                          context.read<SearchNotesBloc>().add(
                                SearchNotesEvent.search(
                                  state.notes,
                                  value,
                                ),
                              );
                        },
                        textAlignVertical: TextAlignVertical.top,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                            ),
                        decoration: InputDecoration(
                          hintText: context.l10n.searchNotesBarHint,
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _searchController.value = TextEditingValue.empty;
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
              showDrawer:
                  MediaQuery.of(context).size.width > kDesktopBreakpoint,
              body: BlocBuilder<SearchNotesBloc, SearchNotesState>(
                builder: (context, state) {
                  return state.map(
                    initial: (_) {
                      return Center(
                        child:
                            Text(context.l10n.searchNotesPageInitialEmptyText),
                      );
                    },
                    loaded: (state) {
                      if (state.notes.isEmpty) {
                        return Center(
                          child: Text(context.l10n.searchNotesPageNotFoundText),
                        );
                      } else {
                        return ListNotes(notes: state.notes.toList());
                      }
                    },
                  );
                },
              ),
            );
          },
          orElse: () {
            context.go('/');
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
