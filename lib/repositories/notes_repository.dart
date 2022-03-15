import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note.dart';

abstract class NotesRepository {
  /// Create new [Note]
  Future<void> addNewNote(Note note);

  /// Delete note permanently
  Future<void> deleteNote(Note note);

  /// Stream List of User [Note]
  Stream<List<Note>> notes(String uid);

  /// Stream List of User archived [Note]
  Stream<List<Note>> archivedNotes(String uid);

  /// Stream List of User deleted [Note]
  Stream<List<Note>> trashedNotes(String uid);

  /// Stream List of All User [Note] including archived and deleted [Note]
  Stream<List<Note>> allNotes(String uid);

  /// Stream [Note]
  Stream<Note> streamNote(String id);

  /// Return [Note]
  Future<Note> getNote(String id);

  /// Update [Note] Document
  Future<void> updateNote(Note note);

  Future<void> archiveNote(Note note);

  Future<void> unArchiveNote(Note note);

  /// Delete note to trash
  Future<void> trashNote(Note note);

  /// Restore note from trash
  Future<void> restoreNote(Note note);
}

class FirebaseNotesRepository implements NotesRepository {
  final noteCollection = FirebaseFirestore.instance.collection('notes');

  @override
  Future<void> addNewNote(Note note) async {
    try {
      await noteCollection.add(note.toDocument());
    } catch (e) {
      log('Failed to add note', error: e);
    }
  }

  @override
  Future<void> deleteNote(Note note) async {
    try {
      return noteCollection.doc(note.id).delete();
    } catch (e) {
      log('Failed to delete note', error: e);
    }
  }

  @override
  Stream<List<Note>> notes(String uid) {
    return noteCollection
        .where('uid', isEqualTo: uid)
        .where('archived', isEqualTo: false)
        .where('deleted', isEqualTo: false)
        .orderBy(
          'createdOn',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();
    });
  }

  @override
  Stream<List<Note>> archivedNotes(String uid) {
    return noteCollection
        .where('uid', isEqualTo: uid)
        .where('archived', isEqualTo: true)
        .where('deleted', isEqualTo: false)
        .orderBy(
          'archivedOn',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();
    });
  }

  @override
  Stream<List<Note>> trashedNotes(String uid) {
    return noteCollection
        .where('uid', isEqualTo: uid)
        .where('deleted', isEqualTo: true)
        .orderBy(
          'deletedOn',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();
    });
  }

  @override
  Stream<List<Note>> allNotes(String uid) {
    return noteCollection
        .where('uid', isEqualTo: uid)
        .orderBy(
          'createdOn',
          descending: true,
        )
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> updateNote(Note note) async {
    try {
      return noteCollection.doc(note.id).update(note.toDocument());
    } catch (e) {
      log('Failed to update note', error: e);
    }
  }

  @override
  Stream<Note> streamNote(String id) {
    return noteCollection.doc(id).snapshots().map((snapshot) => Note.fromSnapshot(snapshot));
  }

  @override
  Future<Note> getNote(String id) {
    return noteCollection.doc(id).get().then((snapshot) => Note.fromSnapshot(snapshot));
  }

  @override
  Future<void> archiveNote(Note note) async {
    final updateNote = note.copyWith(
      archived: true,
      archivedOn: Timestamp.now(),
    );
    this.updateNote(updateNote);
  }

  @override
  Future<void> unArchiveNote(Note note) async {
    final updateNote = note.copyWith(
      archived: false,
      archivedOn: null,
    );
    this.updateNote(updateNote);
  }

  @override
  Future<void> trashNote(Note note) async {
    final updateNote = note.copyWith(
      deleted: true,
      deletedOn: Timestamp.now(),
    );
    this.updateNote(updateNote);
  }

  @override
  Future<void> restoreNote(Note note) async {
    final updateNote = note.copyWith(
      deleted: false,
      deletedOn: null,
    );
    this.updateNote(updateNote);
  }
}
