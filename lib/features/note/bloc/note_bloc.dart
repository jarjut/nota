import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nota/models/Note.dart';
import 'package:nota/repositories/notes_repository.dart';
import 'package:pedantic/pedantic.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({required NotesRepository notesRepository})
      : _notesRepository = notesRepository,
        super(NoteState.empty());

  final NotesRepository _notesRepository;
  StreamSubscription? _noteSubscription;

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is LoadNote) {
      yield* _mapLoadNoteToState(event);
    } else if (event is UpdateNote) {
      yield* _mapUpdateNoteToState(event);
    } else if (event is NoteUpdated) {
      yield* _mapNoteUpdatedToState(event);
    }
  }

  Stream<NoteState> _mapLoadNoteToState(LoadNote event) async* {
    unawaited(_noteSubscription?.cancel());
    _noteSubscription = _notesRepository
        .note(event.id)
        .listen((note) => add(NoteUpdated(note)));
  }

  Stream<NoteState> _mapNoteUpdatedToState(NoteUpdated event) async* {
    yield NoteState(event.note);
  }

  Stream<NoteState> _mapUpdateNoteToState(UpdateNote event) async* {
    await _notesRepository.updateNote(event.updatedNote);
  }

  @override
  Future<void> close() {
    _noteSubscription?.cancel();
    return super.close();
  }
}
