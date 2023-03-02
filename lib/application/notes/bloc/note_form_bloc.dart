import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/domain/notes/note.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc({
    required this.notesBloc,
    required this.noteRepository,
    this.noteId,
  }) : super(NoteFormState.initial()) {
    _notesBlocSubscription = notesBloc.stream.listen((state) {
      state.maybeMap(
        loaded: (state) {
          if (noteId != null) {
            try {
              final note = state.notes.firstWhere((note) => note.id == noteId);
              add(_Loaded(note));
            } catch (_) {
              add(const _NotFound());
            }
          }
        },
        orElse: () {},
      );
    });

    on<_Start>((event, emit) {
      if (noteId == null) {
        emit(state.copyWith(isLoading: false));
      } else {
        notesBloc.state.maybeMap(
          loaded: (state) {
            try {
              final note = state.notes.firstWhere((note) => note.id == noteId);
              add(_Loaded(note));
            } catch (_) {
              add(const _NotFound());
            }
          },
          orElse: () {},
        );
      }
    });

    on<_Loaded>((event, emit) {
      emit(
        state.copyWith(
          note: event.note,
          isNew: false,
          isLoading: false,
        ),
      );
    });

    on<_NotFound>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          notFound: true,
        ),
      );
    });

    on<_TitleChanged>((event, emit) {
      emit(
        state.copyWith(
          note: state.note.copyWith(title: event.title),
        ),
      );
    });

    on<_BodyChanged>((event, emit) {
      emit(
        state.copyWith(
          note: state.note.copyWith(note: event.body),
        ),
      );
    });
  }

  final String? noteId;
  final NotesWatchBloc notesBloc;
  final INoteRepository noteRepository;
  late final StreamSubscription<NotesWatchState> _notesBlocSubscription;

  @override
  Future<void> close() {
    _notesBlocSubscription.cancel();
    return super.close();
  }
}
