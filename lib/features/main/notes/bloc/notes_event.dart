part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NotesEvent {
  final String uid;

  const LoadNotes(this.uid);

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
  String toString() => 'DeleteNotePermanent { Note: $note }';
}

class ArchiveNote extends NotesEvent {
  final Note note;

  const ArchiveNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'ArchiveNote { Note: $note }';
}

class UnArchiveNote extends NotesEvent {
  final Note note;

  const UnArchiveNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'UnArchiveNote { Note: $note }';
}

class TrashNote extends NotesEvent {
  final Note note;

  const TrashNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'DeleteNote { Note: $note }';
}

class RestoreNote extends NotesEvent {
  final Note note;

  const RestoreNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'RestoreDeletedNote { Note: $note }';
}

class NotesUpdated extends NotesEvent {
  final List<Note> notes;

  const NotesUpdated(this.notes);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'Notes Updated';
}
