// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFormEventCopyWith<$Res> {
  factory $NoteFormEventCopyWith(
          NoteFormEvent value, $Res Function(NoteFormEvent) then) =
      _$NoteFormEventCopyWithImpl<$Res, NoteFormEvent>;
}

/// @nodoc
class _$NoteFormEventCopyWithImpl<$Res, $Val extends NoteFormEvent>
    implements $NoteFormEventCopyWith<$Res> {
  _$NoteFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartCopyWith<$Res> {
  factory _$$_StartCopyWith(_$_Start value, $Res Function(_$_Start) then) =
      __$$_StartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res, _$_Start>
    implements _$$_StartCopyWith<$Res> {
  __$$_StartCopyWithImpl(_$_Start _value, $Res Function(_$_Start) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Start implements _Start {
  const _$_Start();

  @override
  String toString() {
    return 'NoteFormEvent.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements NoteFormEvent {
  const factory _Start() = _$_Start;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Note note});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
  }) {
    return _then(_$_Loaded(
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.note);

  @override
  final Note note;

  @override
  String toString() {
    return 'NoteFormEvent.loaded(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) {
    return loaded(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) {
    return loaded?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NoteFormEvent {
  const factory _Loaded(final Note note) = _$_Loaded;

  Note get note;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotFoundCopyWith<$Res> {
  factory _$$_NotFoundCopyWith(
          _$_NotFound value, $Res Function(_$_NotFound) then) =
      __$$_NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotFoundCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res, _$_NotFound>
    implements _$$_NotFoundCopyWith<$Res> {
  __$$_NotFoundCopyWithImpl(
      _$_NotFound _value, $Res Function(_$_NotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound();

  @override
  String toString() {
    return 'NoteFormEvent.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements NoteFormEvent {
  const factory _NotFound() = _$_NotFound;
}

/// @nodoc
abstract class _$$_TitleChangedCopyWith<$Res> {
  factory _$$_TitleChangedCopyWith(
          _$_TitleChanged value, $Res Function(_$_TitleChanged) then) =
      __$$_TitleChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_TitleChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res, _$_TitleChanged>
    implements _$$_TitleChangedCopyWith<$Res> {
  __$$_TitleChangedCopyWithImpl(
      _$_TitleChanged _value, $Res Function(_$_TitleChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_TitleChanged(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TitleChanged implements _TitleChanged {
  const _$_TitleChanged(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'NoteFormEvent.titleChanged(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TitleChanged &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TitleChangedCopyWith<_$_TitleChanged> get copyWith =>
      __$$_TitleChangedCopyWithImpl<_$_TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) {
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) {
    return titleChanged?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class _TitleChanged implements NoteFormEvent {
  const factory _TitleChanged(final String title) = _$_TitleChanged;

  String get title;
  @JsonKey(ignore: true)
  _$$_TitleChangedCopyWith<_$_TitleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BodyChangedCopyWith<$Res> {
  factory _$$_BodyChangedCopyWith(
          _$_BodyChanged value, $Res Function(_$_BodyChanged) then) =
      __$$_BodyChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String body});
}

/// @nodoc
class __$$_BodyChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res, _$_BodyChanged>
    implements _$$_BodyChangedCopyWith<$Res> {
  __$$_BodyChangedCopyWithImpl(
      _$_BodyChanged _value, $Res Function(_$_BodyChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$_BodyChanged(
      null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BodyChanged implements _BodyChanged {
  const _$_BodyChanged(this.body);

  @override
  final String body;

  @override
  String toString() {
    return 'NoteFormEvent.bodyChanged(body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BodyChanged &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BodyChangedCopyWith<_$_BodyChanged> get copyWith =>
      __$$_BodyChangedCopyWithImpl<_$_BodyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Note note) loaded,
    required TResult Function() notFound,
    required TResult Function(String title) titleChanged,
    required TResult Function(String body) bodyChanged,
  }) {
    return bodyChanged(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Note note)? loaded,
    TResult? Function()? notFound,
    TResult? Function(String title)? titleChanged,
    TResult? Function(String body)? bodyChanged,
  }) {
    return bodyChanged?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Note note)? loaded,
    TResult Function()? notFound,
    TResult Function(String title)? titleChanged,
    TResult Function(String body)? bodyChanged,
    required TResult orElse(),
  }) {
    if (bodyChanged != null) {
      return bodyChanged(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_TitleChanged value) titleChanged,
    required TResult Function(_BodyChanged value) bodyChanged,
  }) {
    return bodyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_TitleChanged value)? titleChanged,
    TResult? Function(_BodyChanged value)? bodyChanged,
  }) {
    return bodyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_TitleChanged value)? titleChanged,
    TResult Function(_BodyChanged value)? bodyChanged,
    required TResult orElse(),
  }) {
    if (bodyChanged != null) {
      return bodyChanged(this);
    }
    return orElse();
  }
}

abstract class _BodyChanged implements NoteFormEvent {
  const factory _BodyChanged(final String body) = _$_BodyChanged;

  String get body;
  @JsonKey(ignore: true)
  _$$_BodyChangedCopyWith<_$_BodyChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NoteFormState {
  Note get note => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;
  bool get notFound => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteFormStateCopyWith<NoteFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFormStateCopyWith<$Res> {
  factory $NoteFormStateCopyWith(
          NoteFormState value, $Res Function(NoteFormState) then) =
      _$NoteFormStateCopyWithImpl<$Res, NoteFormState>;
  @useResult
  $Res call({Note note, bool isLoading, bool isNew, bool notFound});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$NoteFormStateCopyWithImpl<$Res, $Val extends NoteFormState>
    implements $NoteFormStateCopyWith<$Res> {
  _$NoteFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? isLoading = null,
    Object? isNew = null,
    Object? notFound = null,
  }) {
    return _then(_value.copyWith(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      notFound: null == notFound
          ? _value.notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NoteFormStateCopyWith<$Res>
    implements $NoteFormStateCopyWith<$Res> {
  factory _$$_NoteFormStateCopyWith(
          _$_NoteFormState value, $Res Function(_$_NoteFormState) then) =
      __$$_NoteFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Note note, bool isLoading, bool isNew, bool notFound});

  @override
  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$_NoteFormStateCopyWithImpl<$Res>
    extends _$NoteFormStateCopyWithImpl<$Res, _$_NoteFormState>
    implements _$$_NoteFormStateCopyWith<$Res> {
  __$$_NoteFormStateCopyWithImpl(
      _$_NoteFormState _value, $Res Function(_$_NoteFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? isLoading = null,
    Object? isNew = null,
    Object? notFound = null,
  }) {
    return _then(_$_NoteFormState(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      notFound: null == notFound
          ? _value.notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteFormState implements _NoteFormState {
  const _$_NoteFormState(
      {required this.note,
      required this.isLoading,
      required this.isNew,
      this.notFound = false});

  @override
  final Note note;
  @override
  final bool isLoading;
  @override
  final bool isNew;
  @override
  @JsonKey()
  final bool notFound;

  @override
  String toString() {
    return 'NoteFormState(note: $note, isLoading: $isLoading, isNew: $isNew, notFound: $notFound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteFormState &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.notFound, notFound) ||
                other.notFound == notFound));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, note, isLoading, isNew, notFound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteFormStateCopyWith<_$_NoteFormState> get copyWith =>
      __$$_NoteFormStateCopyWithImpl<_$_NoteFormState>(this, _$identity);
}

abstract class _NoteFormState implements NoteFormState {
  const factory _NoteFormState(
      {required final Note note,
      required final bool isLoading,
      required final bool isNew,
      final bool notFound}) = _$_NoteFormState;

  @override
  Note get note;
  @override
  bool get isLoading;
  @override
  bool get isNew;
  @override
  bool get notFound;
  @override
  @JsonKey(ignore: true)
  _$$_NoteFormStateCopyWith<_$_NoteFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
