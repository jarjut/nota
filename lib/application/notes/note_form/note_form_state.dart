part of 'note_form_bloc.dart';

@freezed
class NoteFormState with _$NoteFormState {
  const factory NoteFormState({
    required Note note,
    required bool isLoading,
    required bool isNew,
    @Default(false) bool isUpdating,
    @Default(false) bool notFound,
    Either<NoteFailure, Unit>? actionFailureOrSuccess,
  }) = _NoteFormState;

  factory NoteFormState.initial() => NoteFormState(
        note: Note.create(),
        isLoading: true,
        isNew: true,
      );
}
