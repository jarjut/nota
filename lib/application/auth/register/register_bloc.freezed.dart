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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$FullNameChangedImplCopyWith<$Res> {
  factory _$$FullNameChangedImplCopyWith(_$FullNameChangedImpl value,
          $Res Function(_$FullNameChangedImpl) then) =
      __$$FullNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$FullNameChangedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$FullNameChangedImpl>
    implements _$$FullNameChangedImplCopyWith<$Res> {
  __$$FullNameChangedImplCopyWithImpl(
      _$FullNameChangedImpl _value, $Res Function(_$FullNameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$FullNameChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FullNameChangedImpl implements _FullNameChanged {
  const _$FullNameChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.fullNameChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullNameChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullNameChangedImplCopyWith<_$FullNameChangedImpl> get copyWith =>
      __$$FullNameChangedImplCopyWithImpl<_$FullNameChangedImpl>(
          this, _$identity);

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
  const factory _FullNameChanged(final String value) = _$FullNameChangedImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$FullNameChangedImplCopyWith<_$FullNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
          _$EmailChangedImpl value, $Res Function(_$EmailChangedImpl) then) =
      __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
      _$EmailChangedImpl _value, $Res Function(_$EmailChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$EmailChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangedImpl implements _EmailChanged {
  const _$EmailChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.emailChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

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
  const factory _EmailChanged(final String value) = _$EmailChangedImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(_$PasswordChangedImpl value,
          $Res Function(_$PasswordChangedImpl) then) =
      __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$PasswordChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedImpl implements _PasswordChanged {
  const _$PasswordChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RegisterEvent.passwordChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
          this, _$identity);

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
  const factory _PasswordChanged(final String value) = _$PasswordChangedImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterWithEmailAndPasswordPressedImplCopyWith<$Res> {
  factory _$$RegisterWithEmailAndPasswordPressedImplCopyWith(
          _$RegisterWithEmailAndPasswordPressedImpl value,
          $Res Function(_$RegisterWithEmailAndPasswordPressedImpl) then) =
      __$$RegisterWithEmailAndPasswordPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithEmailAndPasswordPressedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res,
        _$RegisterWithEmailAndPasswordPressedImpl>
    implements _$$RegisterWithEmailAndPasswordPressedImplCopyWith<$Res> {
  __$$RegisterWithEmailAndPasswordPressedImplCopyWithImpl(
      _$RegisterWithEmailAndPasswordPressedImpl _value,
      $Res Function(_$RegisterWithEmailAndPasswordPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithEmailAndPasswordPressedImpl
    implements _RegisterWithEmailAndPasswordPressed {
  const _$RegisterWithEmailAndPasswordPressedImpl();

  @override
  String toString() {
    return 'RegisterEvent.registerWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithEmailAndPasswordPressedImpl);
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
      _$RegisterWithEmailAndPasswordPressedImpl;
}

/// @nodoc
abstract class _$$LoginWithGooglePressedImplCopyWith<$Res> {
  factory _$$LoginWithGooglePressedImplCopyWith(
          _$LoginWithGooglePressedImpl value,
          $Res Function(_$LoginWithGooglePressedImpl) then) =
      __$$LoginWithGooglePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithGooglePressedImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$LoginWithGooglePressedImpl>
    implements _$$LoginWithGooglePressedImplCopyWith<$Res> {
  __$$LoginWithGooglePressedImplCopyWithImpl(
      _$LoginWithGooglePressedImpl _value,
      $Res Function(_$LoginWithGooglePressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginWithGooglePressedImpl implements _LoginWithGooglePressed {
  const _$LoginWithGooglePressedImpl();

  @override
  String toString() {
    return 'RegisterEvent.loginWithGooglePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithGooglePressedImpl);
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
  const factory _LoginWithGooglePressed() = _$LoginWithGooglePressedImpl;
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
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
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
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
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
    return _then(_$RegisterStateImpl(
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

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
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
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {required final FullName fullName,
      required final EmailAddress emailAddress,
      required final Password password,
      required final bool showErrorMessage,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$RegisterStateImpl;

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
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
