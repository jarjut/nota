part of 'notes_watch_bloc.dart';

@freezed
class NotesWatchEvent with _$NotesWatchEvent {
  const factory NotesWatchEvent.watchStart(String uid) = _WatchStart;
  const factory NotesWatchEvent.notesReceived(IList<Note> notes) =
      _NotesReceived;
}
