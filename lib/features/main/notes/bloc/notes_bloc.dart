import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/note.dart';
import '../../../../repositories/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _notesRepository;
  StreamSubscription? _notesSubscription;

  NotesBloc({required NotesRepository notesRepository})
      : _notesRepository = notesRepository,
        super(NotesLoading()) {
    on<LoadNotes>(((event, emit) {
      _notesSubscription?.cancel();
      _notesSubscription = _notesRepository.allNotes(event.uid).listen(
            (notes) => add(NotesUpdated(notes)),
          );
    }));
    on<NotesUpdated>(((event, emit) {
      emit(NotesLoaded(event.notes));
    }));

    on<AddNote>(((event, emit) {
      _notesRepository.addNewNote(event.note);
    }));
    on<UpdateNote>(((event, emit) {
      final updatedNote = event.updatedNote.copyWith(updatedOn: Timestamp.now());
      _notesRepository.updateNote(updatedNote);
    }));
    on<DeleteNote>(((event, emit) {
      _notesRepository.deleteNote(event.note);
    }));
    on<ArchiveNote>(((event, emit) {
      _notesRepository.archiveNote(event.note);
    }));
    on<TrashNote>(((event, emit) {
      _notesRepository.trashNote(event.note);
    }));
    on<UnArchiveNote>(((event, emit) {
      _notesRepository.unArchiveNote(event.note);
    }));
    on<RestoreNote>(((event, emit) {
      _notesRepository.restoreNote(event.note);
    }));
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
