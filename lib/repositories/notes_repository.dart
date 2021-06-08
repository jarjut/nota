import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Note.dart';

abstract class NotesRepository {
  Future<void> addNewNote(Note note);

  Future<void> deleteNote(Note note);

  /// Get User notes
  Stream<List<Note>> notes(String uid);

  Future<void> updateNote(Note note);
}

class FirebaseNotesRepository implements NotesRepository {
  final noteCollection = FirebaseFirestore.instance.collection('notes');

  @override
  Future<void> addNewNote(Note note) async {
    try {
      await noteCollection.add(note.toDocument());
    } catch (e) {
      print('Failed to add note: $e');
    }
  }

  @override
  Future<void> deleteNote(Note note) async {
    try {
      return noteCollection.doc(note.id).delete();
    } catch (e) {
      print('Failed to delete note: $e');
    }
  }

  @override
  Stream<List<Note>> notes(String uid) {
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
      print('Failed to update note: $e');
    }
  }
}
