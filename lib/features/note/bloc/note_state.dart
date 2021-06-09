part of 'note_bloc.dart';

class NoteState extends Equatable {
  const NoteState(this.note);

  final Note note;

  NoteState.empty() : this(Note());

  @override
  List<Object> get props => [note];
}
