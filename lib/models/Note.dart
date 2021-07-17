import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String? id;
  final String title;
  final String note;
  final Timestamp createdOn;
  final Timestamp updatedOn;
  final bool archived;
  final Timestamp? archivedOn;
  final bool deleted;
  final Timestamp? deletedOn;

  /// User ID
  final String? uid;

  Note({
    this.id,
    this.title = '',
    this.note = '',
    this.uid,
    createdOn,
    updatedOn,
    this.archivedOn,
    this.archived = false,
    this.deleted = false,
    this.deletedOn,
  })  : createdOn = createdOn ?? Timestamp.now(),
        updatedOn = createdOn ?? Timestamp.now();

  Note copyWith({
    String? id,
    String? title,
    String? note,
    String? uid,
    Timestamp? createdOn,
    Timestamp? updatedOn,
    bool? archived,
    Timestamp? archivedOn,
    bool? deleted,
    Timestamp? deletedOn,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      uid: uid ?? this.uid,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      archived: archived ?? this.archived,
      archivedOn: archivedOn ?? this.archivedOn,
      deleted: deleted ?? this.deleted,
      deletedOn: deletedOn ?? this.deletedOn,
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
      archived: data['archived'],
      archivedOn: data['archivedOn'],
      deleted: data['deleted'],
      deletedOn: data['deletedOn'],
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'title': title,
      'note': note,
      'uid': uid,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
      'archived': archived,
      'archivedOn': archivedOn,
      'deleted': deleted,
      'deletedOn': deletedOn,
    };
  }

  @override
  String toString() => 'Note { id: $id, title: $title, note: $note}}';

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        uid,
        createdOn,
        updatedOn,
        archived,
        archivedOn,
        deleted,
        deletedOn,
      ];
}
