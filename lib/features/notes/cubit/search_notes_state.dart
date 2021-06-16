part of 'search_notes_cubit.dart';

abstract class SearchNotesState extends Equatable {
  const SearchNotesState();

  @override
  List<Object> get props => [];
}

class SearchNotesInitial extends SearchNotesState {}

class SearchNotesLoaded extends SearchNotesState {
  final List<Note> notes;

  const SearchNotesLoaded(this.notes);

  @override
  List<Object> get props => [notes];
}
