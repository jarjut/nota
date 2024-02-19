// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Note {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  Timestamp get createdOn => throw _privateConstructorUsedError;
  Timestamp get updatedOn => throw _privateConstructorUsedError;
  Timestamp? get archivedOn => throw _privateConstructorUsedError;
  Timestamp? get deletedOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {String id,
      String title,
      String note,
      String uid,
      Timestamp createdOn,
      Timestamp updatedOn,
      Timestamp? archivedOn,
      Timestamp? deletedOn});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? note = null,
    Object? uid = null,
    Object? createdOn = null,
    Object? updatedOn = null,
    Object? archivedOn = freezed,
    Object? deletedOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      archivedOn: freezed == archivedOn
          ? _value.archivedOn
          : archivedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deletedOn: freezed == deletedOn
          ? _value.deletedOn
          : deletedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String note,
      String uid,
      Timestamp createdOn,
      Timestamp updatedOn,
      Timestamp? archivedOn,
      Timestamp? deletedOn});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? note = null,
    Object? uid = null,
    Object? createdOn = null,
    Object? updatedOn = null,
    Object? archivedOn = freezed,
    Object? deletedOn = freezed,
  }) {
    return _then(_$NoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      archivedOn: freezed == archivedOn
          ? _value.archivedOn
          : archivedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deletedOn: freezed == deletedOn
          ? _value.deletedOn
          : deletedOn // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc

class _$NoteImpl extends _Note {
  const _$NoteImpl(
      {this.id = '',
      this.title = '',
      this.note = '',
      required this.uid,
      required this.createdOn,
      required this.updatedOn,
      this.archivedOn,
      this.deletedOn})
      : super._();

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String note;
  @override
  final String uid;
  @override
  final Timestamp createdOn;
  @override
  final Timestamp updatedOn;
  @override
  final Timestamp? archivedOn;
  @override
  final Timestamp? deletedOn;

  @override
  String toString() {
    return 'Note(id: $id, title: $title, note: $note, uid: $uid, createdOn: $createdOn, updatedOn: $updatedOn, archivedOn: $archivedOn, deletedOn: $deletedOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn) &&
            (identical(other.archivedOn, archivedOn) ||
                other.archivedOn == archivedOn) &&
            (identical(other.deletedOn, deletedOn) ||
                other.deletedOn == deletedOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, note, uid, createdOn,
      updatedOn, archivedOn, deletedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);
}

abstract class _Note extends Note {
  const factory _Note(
      {final String id,
      final String title,
      final String note,
      required final String uid,
      required final Timestamp createdOn,
      required final Timestamp updatedOn,
      final Timestamp? archivedOn,
      final Timestamp? deletedOn}) = _$NoteImpl;
  const _Note._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get note;
  @override
  String get uid;
  @override
  Timestamp get createdOn;
  @override
  Timestamp get updatedOn;
  @override
  Timestamp? get archivedOn;
  @override
  Timestamp? get deletedOn;
  @override
  @JsonKey(ignore: true)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
