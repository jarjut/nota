part of 'search_notes_bloc.dart';

@freezed
class SearchNotesEvent with _$SearchNotesEvent {
  const factory SearchNotesEvent.search(IList<Note> notes, String searchQuery) =
      _Search;
}
