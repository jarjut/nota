// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';

class DummyDocumentSnapshot implements DocumentSnapshot<Map<String, dynamic>> {
  DummyDocumentSnapshot(this._id, this._data);

  final String _id;
  final Map<String, dynamic> _data;

  @override
  Map<String, dynamic>? data() {
    return _data;
  }

  @override
  bool get exists => throw UnimplementedError();

  @override
  dynamic get(Object field) {
    throw UnimplementedError();
  }

  @override
  String get id => _id;

  @override
  SnapshotMetadata get metadata => throw UnimplementedError();

  @override
  DocumentReference<Map<String, dynamic>> get reference =>
      throw UnimplementedError();

  @override
  dynamic operator [](Object field) {
    throw UnimplementedError();
  }
}
