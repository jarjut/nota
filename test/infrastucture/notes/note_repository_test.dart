// ignore_for_file: inference_failure_on_function_invocation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nota/domain/notes/note_failure.dart';
import 'package:nota/infrastructure/notes/note_repository.dart';

import '../../dummy/notes_dummy.dart';
import '../../helpers/helpers.dart';

void main() {
  group('NoteRepository', () {
    late FirebaseFirestore mockFirestore;
    late NoteRepository noteRepository;
    late CollectionReference<Map<String, dynamic>> mockCollectionReference;
    late DocumentReference<Map<String, dynamic>> mockDocumentReference;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      noteRepository = NoteRepository(mockFirestore);
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();

      when(() => mockFirestore.collection(any()))
          .thenReturn(mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);
    });

    group('create', () {
      test('succeds', () async {
        when(() => mockCollectionReference.add(any()))
            .thenAnswer((_) async => mockDocumentReference);

        final result = await noteRepository.create(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockCollectionReference.add(any())).thenThrow(Exception());

        final result = await noteRepository.create(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('update', () {
      test('succeds', () async {
        when(() => mockDocumentReference.update(any()))
            .thenAnswer((_) async {});
        final result = await noteRepository.update(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.update(any())).thenThrow(Exception());
        final result = await noteRepository.update(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('archive', () {
      test('succeds', () async {
        when(() => mockDocumentReference.update(any()))
            .thenAnswer((_) async {});
        final result = await noteRepository.archive(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.update(any())).thenThrow(Exception());
        final result = await noteRepository.archive(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('unarchive', () {
      test('succeds', () async {
        when(() => mockDocumentReference.update(any()))
            .thenAnswer((_) async {});
        final result = await noteRepository.unarchive(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.update(any())).thenThrow(Exception());
        final result = await noteRepository.unarchive(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('delete', () {
      test('succeds', () async {
        when(() => mockDocumentReference.update(any()))
            .thenAnswer((_) async {});
        final result = await noteRepository.delete(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.update(any())).thenThrow(Exception());
        final result = await noteRepository.delete(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('restore', () {
      test('succeds', () async {
        when(() => mockDocumentReference.update(any()))
            .thenAnswer((_) async {});
        final result = await noteRepository.restore(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.update(any())).thenThrow(Exception());
        final result = await noteRepository.restore(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('deletePermanently', () {
      test('succeds', () async {
        when(() => mockDocumentReference.delete()).thenAnswer((_) async {});
        final result = await noteRepository.deletePermanently(dummyNote);

        expect(result, right(unit));
      });

      test('return NoteFailure on unexpected error', () async {
        when(() => mockDocumentReference.delete()).thenThrow(Exception());
        final result = await noteRepository.deletePermanently(dummyNote);

        expect(result, left(const NoteFailure.unexpected()));
      });
    });

    group('watchAll', () {
      final mockWhereQuery = MockQuery();
      final mockOrderQuery = MockQuery();
      final mockSnapshots = MockQuerySnapshot();
      setUp(() {
        when(
          () => mockCollectionReference.where(
            any(),
            isEqualTo: any(named: 'isEqualTo'),
          ),
        ).thenReturn(mockWhereQuery);
        when(
          () => mockWhereQuery.orderBy(
            any(),
            descending: any(named: 'descending'),
          ),
        ).thenReturn(mockOrderQuery);

        when(() => mockSnapshots.docs).thenReturn(
          [dummyNoteSnapshot],
        );
      });

      test('succeds', () async {
        when(mockOrderQuery.snapshots).thenAnswer(
          (_) => Stream.value(
            mockSnapshots,
          ),
        );

        final notesStream = noteRepository.watchAll('uid');
        await expectLater(
          notesStream,
          emitsInOrder([
            IList([dummyNote])
          ]),
        );
      });
    });
  });
}
