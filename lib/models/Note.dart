import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String? id;
  final String title;
  final String note;
  final Timestamp createdOn;
  final Timestamp updatedOn;

  /// User ID
  final String? uid;

  Note({
    this.id,
    this.title = '',
    this.note = '',
    this.uid,
    createdOn,
    updatedOn,
  })  : createdOn = createdOn ?? Timestamp.now(),
        updatedOn = createdOn ?? Timestamp.now();

  Note copyWith({
    String? id,
    String? title,
    String? note,
    String? uid,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      uid: uid ?? this.uid,
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
      uid: data['uid'],
      createdOn: data['createdOn'],
      updatedOn: data['updatedOn'],
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'title': title,
      'note': note,
      'uid': uid,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }

  @override
  String toString() => 'Note { id: $id, title: $title}';

  @override
  List<Object?> get props => [id, title, note, uid, createdOn, updatedOn];
}
