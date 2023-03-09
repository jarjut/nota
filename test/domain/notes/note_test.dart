import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nota/domain/notes/note.dart';

import '../../dummy/notes_dummy.dart';

void main() {
  group('Note Entity', () {
    test('Note.create()', () {
      final note = Note.create(
        uid: 'uid',
        title: 'title',
        note: 'note',
      );
      expect(note.title, 'title');
    });
    test('isArchived', () {
      final note = Note(
        uid: 'uid',
        createdOn: Timestamp.now(),
        updatedOn: Timestamp.now(),
        archivedOn: Timestamp.now(),
      );
      expect(note.isArchived, true);
    });

    test('isDeleted', () {
      final note = Note(
        uid: 'uid',
        createdOn: Timestamp.now(),
        updatedOn: Timestamp.now(),
        deletedOn: Timestamp.now(),
      );
      expect(note.isDeleted, true);
    });

    test('fromSnapshot', () {
      final note = dummyNote;
      final noteSnapshot = dummyNoteSnapshot;
      expect(Note.fromSnapshot(noteSnapshot), note);
    });

    test('toDocument', () {
      final updatedOn = Timestamp.now();
      final createdOn = Timestamp.now();
      final noteJson = {
        'title': '',
        'note': '',
        'uid': 'uid',
        'createdOn': createdOn,
        'updatedOn': FieldValue.serverTimestamp(),
        'archivedOn': null,
        'deletedOn': null,
      };
      final note = Note(uid: 'uid', createdOn: createdOn, updatedOn: updatedOn);
      expect(note.toDocument(), noteJson);
    });
  });
}
