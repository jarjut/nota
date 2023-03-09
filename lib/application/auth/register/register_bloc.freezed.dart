// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FullNameChangedCopyWith<$Res> {
  factory _$$_FullNameChangedCopyWith(
          _$_FullNameChanged value, $Res Function(_$_FullNameChanged) then) =
      __$$_FullNameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_FullNameChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_FullNameChanged>
    implements _$$_FullNameChangedCopyWith<$Res> {
  __$$_FullNameChangedCopyWithImpl(
      _$_FullNameChanged _value, $Res Function(_$_FullNameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_FullNameChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FullNameChanged implements _FullNameChanged {
  const _$_FullNameChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.fullNameChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullNameChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullNameChangedCopyWith<_$_FullNameChanged> get copyWith =>
      __$$_FullNameChangedCopyWithImpl<_$_FullNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return fullNameChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return fullNameChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (fullNameChanged != null) {
      return fullNameChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return fullNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return fullNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (fullNameChanged != null) {
      return fullNameChanged(this);
    }
    return orElse();
  }
}

abstract class _FullNameChanged implements RegisterEvent {
  const factory _FullNameChanged(final String value) = _$_FullNameChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_FullNameChangedCopyWith<_$_FullNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmailChangedCopyWith<$Res> {
  factory _$$_EmailChangedCopyWith(
          _$_EmailChanged value, $Res Function(_$_EmailChanged) then) =
      __$$_EmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_EmailChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_EmailChanged>
    implements _$$_EmailChangedCopyWith<$Res> {
  __$$_EmailChangedCopyWithImpl(
      _$_EmailChanged _value, $Res Function(_$_EmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_EmailChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.emailChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      __$$_EmailChangedCopyWithImpl<_$_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return emailChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return emailChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements RegisterEvent {
  const factory _EmailChanged(final String value) = _$_EmailChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_PasswordChanged>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_PasswordChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.passwordChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return passwordChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return passwordChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements RegisterEvent {
  const factory _PasswordChanged(final String value) = _$_PasswordChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$_RegisterWithEmailAndPasswordPressedCopyWith(
          _$_RegisterWithEmailAndPasswordPressed value,
          $Res Function(_$_RegisterWithEmailAndPasswordPressed) then) =
      __$$_RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res,
        _$_RegisterWithEmailAndPasswordPressed>
    implements _$$_RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$_RegisterWithEmailAndPasswordPressedCopyWithImpl(
      _$_RegisterWithEmailAndPasswordPressed _value,
      $Res Function(_$_RegisterWithEmailAndPasswordPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegisterWithEmailAndPasswordPressed
    implements _RegisterWithEmailAndPasswordPressed {
  const _$_RegisterWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'RegisterEvent.registerWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return registerWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return registerWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return registerWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return registerWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithEmailAndPasswordPressed implements RegisterEvent {
  const factory _RegisterWithEmailAndPasswordPressed() =
      _$_RegisterWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class _$$_LoginWithGooglePressedCopyWith<$Res> {
  factory _$$_LoginWithGooglePressedCopyWith(_$_LoginWithGooglePressed value,
          $Res Function(_$_LoginWithGooglePressed) then) =
      __$$_LoginWithGooglePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithGooglePressedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_LoginWithGooglePressed>
    implements _$$_LoginWithGooglePressedCopyWith<$Res> {
  __$$_LoginWithGooglePressedCopyWithImpl(_$_LoginWithGooglePressed _value,
      $Res Function(_$_LoginWithGooglePressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoginWithGooglePressed implements _LoginWithGooglePressed {
  const _$_LoginWithGooglePressed();

  @override
  String toString() {
    return 'RegisterEvent.loginWithGooglePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithGooglePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() registerWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return loginWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? registerWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return loginWithGooglePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? registerWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (loginWithGooglePressed != null) {
      return loginWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_RegisterWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return loginWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return loginWithGooglePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_RegisterWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (loginWithGooglePressed != null) {
      return loginWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithGooglePressed implements RegisterEvent {
  const factory _LoginWithGooglePressed() = _$_LoginWithGooglePressed;
}

/// @nodoc
mixin _$RegisterState {
  FullName get fullName => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {FullName fullName,
      EmailAddress emailAddress,
      Password password,
      bool showErrorMessage,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FullName fullName,
      EmailAddress emailAddress,
      Password password,
      bool showErrorMessage,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailAddress = null,
    Object? password = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_RegisterState(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {required this.fullName,
      required this.emailAddress,
      required this.password,
      required this.showErrorMessage,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final FullName fullName;
  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final bool showErrorMessage;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterState(fullName: $fullName, emailAddress: $emailAddress, password: $password, showErrorMessage: $showErrorMessage, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, emailAddress, password,
      showErrorMessage, isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {required final FullName fullName,
      required final EmailAddress emailAddress,
      required final Password password,
      required final bool showErrorMessage,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_RegisterState;

  @override
  FullName get fullName;
  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  bool get showErrorMessage;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
