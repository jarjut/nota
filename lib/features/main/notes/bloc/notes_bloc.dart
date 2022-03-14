import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/note.dart';
import '../../../../repositories/notes_repository.dart';

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
    } else if (event is NotesUpdated) {
      yield* _mapNotesUpdateToState(event);
    } else if (event is AddNote) {
      _notesRepository.addNewNote(event.note);
    } else if (event is UpdateNote) {
      final updatedNote =
          event.updatedNote.copyWith(updatedOn: Timestamp.now());
      _notesRepository.updateNote(updatedNote);
    } else if (event is DeleteNote) {
      _notesRepository.deleteNote(event.note);
    } else if (event is ArchiveNote) {
      _notesRepository.archiveNote(event.note);
    } else if (event is TrashNote) {
      _notesRepository.trashNote(event.note);
    } else if (event is UnArchiveNote) {
      _notesRepository.unArchiveNote(event.note);
    } else if (event is RestoreNote) {
      _notesRepository.restoreNote(event.note);
    }
  }

  Stream<NotesState> _mapLoadNotesToState(LoadNotes event) async* {
    _notesSubscription?.cancel();
    _notesSubscription = _notesRepository.allNotes(event.uid).listen(
          (notes) => add(NotesUpdated(notes)),
        );
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
