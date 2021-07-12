part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NotesEvent {
  final String uid;

  LoadNotes(this.uid);

  @override
  List<Object> get props => [uid];

  @override
  String toString() => 'LoadNote { Uid: $uid }';
}

class AddNote extends NotesEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'AddNote { Note: $note }';
}

class UpdateNote extends NotesEvent {
  final Note updatedNote;

  const UpdateNote(this.updatedNote);

  @override
  List<Object> get props => [updatedNote];

  @override
  String toString() => 'UpdateNote { updatedNote: $updatedNote }';
}

class DeleteNote extends NotesEvent {
  final Note note;

  const DeleteNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'DeleteNote { Note: $note }';
}

class NotesUpdated extends NotesEvent {
  final List<Note> notes;

  const NotesUpdated(this.notes);

  @override
  List<Object> get props => [notes];
}
