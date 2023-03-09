import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/core/utils/event_transformer.dart';
import 'package:nota/domain/notes/note.dart';

part 'search_notes_event.dart';
part 'search_notes_state.dart';
part 'search_notes_bloc.freezed.dart';

@injectable
class SearchNotesBloc extends Bloc<SearchNotesEvent, SearchNotesState> {
  SearchNotesBloc() : super(const _Initial()) {
    on<_Search>(
      (event, emit) {
        final notes = event.notes;
        final searchQuery = event.searchQuery.toLowerCase();
        final searchedNotes = notes
            .where(
              (note) =>
                  note.title.toLowerCase().contains(searchQuery) ||
                  note.note.toLowerCase().contains(searchQuery),
            )
            .toIList();
        emit(_Loaded(searchedNotes));
      },
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }
}
