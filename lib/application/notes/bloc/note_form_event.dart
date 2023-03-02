part of 'note_form_bloc.dart';

@freezed
class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.start() = _Start;
  const factory NoteFormEvent.loaded(Note note) = _Loaded;
  const factory NoteFormEvent.notFound() = _NotFound;
  const factory NoteFormEvent.titleChanged(String title) = _TitleChanged;
  const factory NoteFormEvent.bodyChanged(String body) = _BodyChanged;
}
