part of 'notes_watch_bloc.dart';

@freezed
class NotesWatchState with _$NotesWatchState {
  const factory NotesWatchState.initial() = _Initial;
  const factory NotesWatchState.loadInProgress() = _LoadInProgress;
  const factory NotesWatchState.loaded(IList<Note> notes) = _Loaded;
}
