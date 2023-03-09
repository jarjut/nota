import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nota/domain/notes/note.dart';
import 'package:nota/domain/notes/note_failure.dart';

abstract class INoteRepository {
  /// Create a new note.
  Future<Either<NoteFailure, Unit>> create(Note note);

  /// Update a note.
  Future<Either<NoteFailure, Unit>> update(Note note);

  /// Archive a note.
  Future<Either<NoteFailure, Unit>> archive(Note note);

  /// Unarchive a note.
  Future<Either<NoteFailure, Unit>> unarchive(Note note);

  /// Delete a note (to trash).
  Future<Either<NoteFailure, Unit>> delete(Note note);

  /// Restore a note from trash.
  Future<Either<NoteFailure, Unit>> restore(Note note);

  /// Delete a note permanently.
  Future<Either<NoteFailure, Unit>> deletePermanently(Note note);

  /// Watch all notes.
  Stream<IList<Note>> watchAll(String uid);
}
