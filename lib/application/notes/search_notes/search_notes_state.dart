part of 'search_notes_bloc.dart';

@freezed
class SearchNotesState with _$SearchNotesState {
  const factory SearchNotesState.initial() = _Initial;
  const factory SearchNotesState.loaded(IList<Note> notes) = _Loaded;
}
