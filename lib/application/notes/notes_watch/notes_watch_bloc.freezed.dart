// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_watch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotesWatchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) watchStart,
    required TResult Function(IList<Note> notes) notesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? watchStart,
    TResult? Function(IList<Note> notes)? notesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? watchStart,
    TResult Function(IList<Note> notes)? notesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchStart value) watchStart,
    required TResult Function(_NotesReceived value) notesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchStart value)? watchStart,
    TResult? Function(_NotesReceived value)? notesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchStart value)? watchStart,
    TResult Function(_NotesReceived value)? notesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesWatchEventCopyWith<$Res> {
  factory $NotesWatchEventCopyWith(
          NotesWatchEvent value, $Res Function(NotesWatchEvent) then) =
      _$NotesWatchEventCopyWithImpl<$Res, NotesWatchEvent>;
}

/// @nodoc
class _$NotesWatchEventCopyWithImpl<$Res, $Val extends NotesWatchEvent>
    implements $NotesWatchEventCopyWith<$Res> {
  _$NotesWatchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WatchStartImplCopyWith<$Res> {
  factory _$$WatchStartImplCopyWith(
          _$WatchStartImpl value, $Res Function(_$WatchStartImpl) then) =
      __$$WatchStartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$WatchStartImplCopyWithImpl<$Res>
    extends _$NotesWatchEventCopyWithImpl<$Res, _$WatchStartImpl>
    implements _$$WatchStartImplCopyWith<$Res> {
  __$$WatchStartImplCopyWithImpl(
      _$WatchStartImpl _value, $Res Function(_$WatchStartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$WatchStartImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchStartImpl implements _WatchStart {
  const _$WatchStartImpl(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'NotesWatchEvent.watchStart(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchStartImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchStartImplCopyWith<_$WatchStartImpl> get copyWith =>
      __$$WatchStartImplCopyWithImpl<_$WatchStartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) watchStart,
    required TResult Function(IList<Note> notes) notesReceived,
  }) {
    return watchStart(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? watchStart,
    TResult? Function(IList<Note> notes)? notesReceived,
  }) {
    return watchStart?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? watchStart,
    TResult Function(IList<Note> notes)? notesReceived,
    required TResult orElse(),
  }) {
    if (watchStart != null) {
      return watchStart(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchStart value) watchStart,
    required TResult Function(_NotesReceived value) notesReceived,
  }) {
    return watchStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchStart value)? watchStart,
    TResult? Function(_NotesReceived value)? notesReceived,
  }) {
    return watchStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchStart value)? watchStart,
    TResult Function(_NotesReceived value)? notesReceived,
    required TResult orElse(),
  }) {
    if (watchStart != null) {
      return watchStart(this);
    }
    return orElse();
  }
}

abstract class _WatchStart implements NotesWatchEvent {
  const factory _WatchStart(final String uid) = _$WatchStartImpl;

  String get uid;
  @JsonKey(ignore: true)
  _$$WatchStartImplCopyWith<_$WatchStartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotesReceivedImplCopyWith<$Res> {
  factory _$$NotesReceivedImplCopyWith(
          _$NotesReceivedImpl value, $Res Function(_$NotesReceivedImpl) then) =
      __$$NotesReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IList<Note> notes});
}

/// @nodoc
class __$$NotesReceivedImplCopyWithImpl<$Res>
    extends _$NotesWatchEventCopyWithImpl<$Res, _$NotesReceivedImpl>
    implements _$$NotesReceivedImplCopyWith<$Res> {
  __$$NotesReceivedImplCopyWithImpl(
      _$NotesReceivedImpl _value, $Res Function(_$NotesReceivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$NotesReceivedImpl(
      null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as IList<Note>,
    ));
  }
}

/// @nodoc

class _$NotesReceivedImpl implements _NotesReceived {
  const _$NotesReceivedImpl(this.notes);

  @override
  final IList<Note> notes;

  @override
  String toString() {
    return 'NotesWatchEvent.notesReceived(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotesReceivedImpl &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesReceivedImplCopyWith<_$NotesReceivedImpl> get copyWith =>
      __$$NotesReceivedImplCopyWithImpl<_$NotesReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) watchStart,
    required TResult Function(IList<Note> notes) notesReceived,
  }) {
    return notesReceived(notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? watchStart,
    TResult? Function(IList<Note> notes)? notesReceived,
  }) {
    return notesReceived?.call(notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? watchStart,
    TResult Function(IList<Note> notes)? notesReceived,
    required TResult orElse(),
  }) {
    if (notesReceived != null) {
      return notesReceived(notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchStart value) watchStart,
    required TResult Function(_NotesReceived value) notesReceived,
  }) {
    return notesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchStart value)? watchStart,
    TResult? Function(_NotesReceived value)? notesReceived,
  }) {
    return notesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchStart value)? watchStart,
    TResult Function(_NotesReceived value)? notesReceived,
    required TResult orElse(),
  }) {
    if (notesReceived != null) {
      return notesReceived(this);
    }
    return orElse();
  }
}

abstract class _NotesReceived implements NotesWatchEvent {
  const factory _NotesReceived(final IList<Note> notes) = _$NotesReceivedImpl;

  IList<Note> get notes;
  @JsonKey(ignore: true)
  _$$NotesReceivedImplCopyWith<_$NotesReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotesWatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(IList<Note> notes) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(IList<Note> notes)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(IList<Note> notes)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesWatchStateCopyWith<$Res> {
  factory $NotesWatchStateCopyWith(
          NotesWatchState value, $Res Function(NotesWatchState) then) =
      _$NotesWatchStateCopyWithImpl<$Res, NotesWatchState>;
}

/// @nodoc
class _$NotesWatchStateCopyWithImpl<$Res, $Val extends NotesWatchState>
    implements $NotesWatchStateCopyWith<$Res> {
  _$NotesWatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotesWatchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotesWatchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(IList<Note> notes) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(IList<Note> notes)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(IList<Note> notes)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotesWatchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$NotesWatchStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'NotesWatchState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(IList<Note> notes) loaded,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(IList<Note> notes)? loaded,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(IList<Note> notes)? loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements NotesWatchState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IList<Note> notes});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NotesWatchStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$LoadedImpl(
      null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as IList<Note>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.notes);

  @override
  final IList<Note> notes;

  @override
  String toString() {
    return 'NotesWatchState.loaded(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(IList<Note> notes) loaded,
  }) {
    return loaded(notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(IList<Note> notes)? loaded,
  }) {
    return loaded?.call(notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(IList<Note> notes)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NotesWatchState {
  const factory _Loaded(final IList<Note> notes) = _$LoadedImpl;

  IList<Note> get notes;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
