import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/domain/notes/note.dart';
import 'package:nota/domain/notes/note_failure.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  NoteRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get noteCollection =>
      _firestore.collection('notes');

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      await noteCollection.doc(note.id).set(note.toDocument());
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      await noteCollection.doc(note.id).update(note.toDocument());
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> archive(Note note) async {
    try {
      await noteCollection.doc(note.id).update(note.toDocument(archive: true));
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> unarchive(Note note) async {
    try {
      await noteCollection
          .doc(note.id)
          .update(note.copyWith(archivedOn: null).toDocument());
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      await noteCollection.doc(note.id).update(note.toDocument(delete: true));
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> restore(Note note) async {
    try {
      await noteCollection
          .doc(note.id)
          .update(note.copyWith(deletedOn: null).toDocument());
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> deletePermanently(Note note) async {
    try {
      await noteCollection.doc(note.id).delete();
      return right(unit);
    } catch (e) {
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Stream<IList<Note>> watchAll(String uid) {
    final userNoteDoc = noteCollection.where('uid', isEqualTo: uid);
    return userNoteDoc
        .orderBy(
          'createdOn',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      final notes = snapshot.docs.map(Note.fromSnapshot).toIList();
      return notes;
    });
  }
}
