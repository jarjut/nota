part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class LoadNote extends NoteEvent {
  final String id;

  LoadNote(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateNote extends NoteEvent {
  final Note updatedNote;

  UpdateNote(this.updatedNote);

  @override
  List<Object> get props => [updatedNote];
}

class DeleteNote extends NoteEvent {
  final Note note;

  DeleteNote(this.note);

  @override
  List<Object> get props => [note];
}

class NoteUpdated extends NoteEvent {
  final Note note;

  NoteUpdated(this.note);

  @override
  List<Object> get props => [note];
}
