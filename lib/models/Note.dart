import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String? id;
  final String title;
  final String note;
  final List<dynamic> noteQuillDelta;
  final Timestamp createdOn;
  final Timestamp updatedOn;

  /// User ID
  final String? uid;

  Note({
    this.id,
    this.title = '',
    this.note = '',
    List<dynamic>? noteQuillDelta,
    this.uid,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  })  : createdOn = createdOn ?? Timestamp.now(),
        updatedOn = createdOn ?? Timestamp.now(),
        noteQuillDelta = noteQuillDelta ?? [];

  Note copyWith({
    String? id,
    String? title,
    String? note,
    List<dynamic>? noteQuillDelta,
    String? uid,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      uid: uid ?? this.uid,
      noteQuillDelta: noteQuillDelta ?? this.noteQuillDelta,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  bool get isEmpty => title == '' && note == '';

  static Note fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as dynamic;
    return Note(
      id: snapshot.id,
      title: data['title'],
      note: data['note'],
      noteQuillDelta: data['noteQuillDelta'],
      uid: data['uid'],
      createdOn: data['createdOn'],
      updatedOn: data['updatedOn'],
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'title': title,
      'note': note,
      'noteQuillDelta': noteQuillDelta,
      'uid': uid,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }

  @override
  String toString() => 'Note { title: $title, note: $note }';

  @override
  List<Object?> get props =>
      [id, title, note, noteQuillDelta, uid, createdOn, updatedOn];
}
