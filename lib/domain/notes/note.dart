import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'note.freezed.dart';

/// {@template note}
/// Note entity
/// {@endtemplate}
@freezed
class Note with _$Note {
  /// {@macro note}
  const factory Note({
    @Default('') String id,
    @Default('') String title,
    @Default('') String note,
    required String uid,
    required Timestamp createdOn,
    required Timestamp updatedOn,
    Timestamp? archivedOn,
    Timestamp? deletedOn,
  }) = _Note;

  const Note._();

  /// Create a new note.
  factory Note.create({
    String? uid,
    String? title,
    String? note,
  }) =>
      Note(
        id: const Uuid().v4(),
        uid: uid ?? '',
        title: title ?? '',
        note: note ?? '',
        createdOn: Timestamp.now(),
        updatedOn: Timestamp.now(),
      );

  /// Return true if the note is archived.
  bool get isArchived => archivedOn != null;

  /// Return true if the note is deleted (onTrash).
  bool get isDeleted => deletedOn != null;

  // ignore: prefer_constructors_over_static_methods
  static Note fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    return Note(
      id: snapshot.id,
      title: data?['title'] as String? ?? '',
      note: data?['note'] as String? ?? '',
      uid: data?['uid'] as String,
      createdOn: data?['createdOn'] as Timestamp,
      updatedOn: data?['updatedOn'] as Timestamp,
      archivedOn: data?['archivedOn'] as Timestamp?,
      deletedOn: data?['deletedOn'] as Timestamp?,
    );
  }

  /// Convert a [Note] into a [Map] that can be sent to Firestore.
  ///
  /// set [create], [archive] or [delete] to true to update date
  /// to server timestamp.
  Map<String, Object?> toDocument({
    bool create = false,
    bool archive = false,
    bool delete = false,
  }) {
    return {
      'title': title,
      'note': note,
      'uid': uid,
      'createdOn': create ? FieldValue.serverTimestamp() : createdOn,
      'updatedOn': FieldValue.serverTimestamp(),
      'archivedOn': archive ? FieldValue.serverTimestamp() : archivedOn,
      'deletedOn': delete ? FieldValue.serverTimestamp() : deletedOn,
    };
  }
}
