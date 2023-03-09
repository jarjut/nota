// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? loginWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$LoginEventCopyWithImpl<$Res, _$_EmailChanged>
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
    return 'LoginEvent.emailChanged(value: $value)';
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
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return emailChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? loginWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return emailChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
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
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements LoginEvent {
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
    extends _$LoginEventCopyWithImpl<$Res, _$_PasswordChanged>
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
    return 'LoginEvent.passwordChanged(value: $value)';
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
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return passwordChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? loginWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return passwordChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
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
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements LoginEvent {
  const factory _PasswordChanged(final String value) = _$_PasswordChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$_LoginWithEmailAndPasswordPressedCopyWith(
          _$_LoginWithEmailAndPasswordPressed value,
          $Res Function(_$_LoginWithEmailAndPasswordPressed) then) =
      __$$_LoginWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_LoginWithEmailAndPasswordPressed>
    implements _$$_LoginWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$_LoginWithEmailAndPasswordPressedCopyWithImpl(
      _$_LoginWithEmailAndPasswordPressed _value,
      $Res Function(_$_LoginWithEmailAndPasswordPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoginWithEmailAndPasswordPressed
    implements _LoginWithEmailAndPasswordPressed {
  const _$_LoginWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'LoginEvent.loginWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return loginWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? loginWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return loginWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndPasswordPressed != null) {
      return loginWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return loginWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return loginWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndPasswordPressed != null) {
      return loginWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithEmailAndPasswordPressed implements LoginEvent {
  const factory _LoginWithEmailAndPasswordPressed() =
      _$_LoginWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class _$$_LoginWithGooglePressedCopyWith<$Res> {
  factory _$$_LoginWithGooglePressedCopyWith(_$_LoginWithGooglePressed value,
          $Res Function(_$_LoginWithGooglePressed) then) =
      __$$_LoginWithGooglePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithGooglePressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_LoginWithGooglePressed>
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
    return 'LoginEvent.loginWithGooglePressed()';
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
    required TResult Function(String value) emailChanged,
    required TResult Function(String value) passwordChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithGooglePressed,
  }) {
    return loginWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? emailChanged,
    TResult? Function(String value)? passwordChanged,
    TResult? Function()? loginWithEmailAndPasswordPressed,
    TResult? Function()? loginWithGooglePressed,
  }) {
    return loginWithGooglePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? emailChanged,
    TResult Function(String value)? passwordChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
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
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithGooglePressed value)
        loginWithGooglePressed,
  }) {
    return loginWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult? Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
  }) {
    return loginWithGooglePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithGooglePressed value)? loginWithGooglePressed,
    required TResult orElse(),
  }) {
    if (loginWithGooglePressed != null) {
      return loginWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithGooglePressed implements LoginEvent {
  const factory _LoginWithGooglePressed() = _$_LoginWithGooglePressed;
}

/// @nodoc
mixin _$LoginState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessage,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessage,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_LoginState(
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

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {required this.emailAddress,
      required this.password,
      required this.showErrorMessage,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

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
    return 'LoginState(emailAddress: $emailAddress, password: $password, showErrorMessage: $showErrorMessage, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
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
  int get hashCode => Object.hash(runtimeType, emailAddress, password,
      showErrorMessage, isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final EmailAddress emailAddress,
      required final Password password,
      required final bool showErrorMessage,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_LoginState;

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
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
