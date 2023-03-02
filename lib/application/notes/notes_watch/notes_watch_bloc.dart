import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/domain/notes/note.dart';

part 'notes_watch_event.dart';
part 'notes_watch_state.dart';
part 'notes_watch_bloc.freezed.dart';

@singleton
class NotesWatchBloc extends Bloc<NotesWatchEvent, NotesWatchState> {
  NotesWatchBloc(this._noteRepository) : super(const _Initial()) {
    on<_WatchStart>((event, emit) async {
      emit(const _LoadInProgress());
      await _noteStreamSubscription?.cancel();
      _noteStreamSubscription = _noteRepository.watchAll(event.uid).listen(
            (notes) => add(_NotesReceived(notes)),
          );
    });

    on<_NotesReceived>((event, emit) {
      emit(_Loaded(event.notes));
    });
  }

  final INoteRepository _noteRepository;
  StreamSubscription<IList<Note>>? _noteStreamSubscription;

  @override
  Future<void> close() {
    _noteStreamSubscription?.cancel();
    return super.close();
  }
}
