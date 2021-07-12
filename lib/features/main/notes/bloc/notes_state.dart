part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;

  const NotesLoaded([this.notes = const []]);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'NotesLoaded { notes: $notes }';
}

class NotesNotLoaded extends NotesState {}
