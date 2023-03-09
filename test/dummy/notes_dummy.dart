import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nota/domain/notes/note.dart';

import '../helpers/helpers.dart';

final Note dummyNote = Note(
  id: 'id',
  uid: 'uid',
  title: 'title',
  note: 'note',
  createdOn: Timestamp(1654679303, 590000000),
  updatedOn: Timestamp(1654679303, 590000000),
);

final Map<String, dynamic> dummyNoteSnapshotData = {
  'uid': 'uid',
  'title': 'title',
  'note': 'note',
  'createdOn': Timestamp(1654679303, 590000000),
  'updatedOn': Timestamp(1654679303, 590000000),
  'archivedOn': null,
  'deletedOn': null,
};

final dummyNoteSnapshot = MockQueryDocumentSnapshotWithData(
  id: 'id',
  data: dummyNoteSnapshotData,
);
