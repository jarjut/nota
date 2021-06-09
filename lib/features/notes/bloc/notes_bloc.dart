import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/Note.dart';
import '../../../repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({required NotesRepository notesRepository})
      : _notesRepository = notesRepository,
        super(NotesLoading());

  final NotesRepository _notesRepository;
  StreamSubscription? _notesSubscription;

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if (event is LoadNotes) {
      yield* _mapLoadNotesToState(event);
    } else if (event is AddNote) {
      yield* _mapAddNoteToState(event);
    } else if (event is UpdateNote) {
      yield* _mapUpdateNoteToState(event);
    } else if (event is DeleteNote) {
      yield* _mapDeleteNoteToState(event);
    } else if (event is NotesUpdated) {
      yield* _mapNotesUpdateToState(event);
    }
  }

  Stream<NotesState> _mapLoadNotesToState(LoadNotes event) async* {
    _notesSubscription?.cancel();
    _notesSubscription = _notesRepository.notes(event.uid).listen(
          (notes) => add(NotesUpdated(notes)),
        );
  }

  Stream<NotesState> _mapAddNoteToState(AddNote event) async* {
    _notesRepository.addNewNote(event.note);
  }

  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {
    _notesRepository.updateNote(event.updatedNote);
  }

  Stream<NotesState> _mapDeleteNoteToState(DeleteNote event) async* {
    _notesRepository.deleteNote(event.note);
  }

  Stream<NotesState> _mapNotesUpdateToState(NotesUpdated event) async* {
    yield NotesLoaded(event.notes);
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
