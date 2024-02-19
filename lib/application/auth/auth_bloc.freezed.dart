// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) userChanged,
    required TResult Function() logoutRequested,
    required TResult Function() userReloadRequested,
    required TResult Function() sendEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? userChanged,
    TResult? Function()? logoutRequested,
    TResult? Function()? userReloadRequested,
    TResult? Function()? sendEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? userChanged,
    TResult Function()? logoutRequested,
    TResult Function()? userReloadRequested,
    TResult Function()? sendEmailVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserChanged value) userChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_UserReloadRequested value) userReloadRequested,
    required TResult Function(_SendEmailVerification value)
        sendEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserChanged value)? userChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_UserReloadRequested value)? userReloadRequested,
    TResult? Function(_SendEmailVerification value)? sendEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserChanged value)? userChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_UserReloadRequested value)? userReloadRequested,
    TResult Function(_SendEmailVerification value)? sendEmailVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserChangedImplCopyWith<$Res> {
  factory _$$UserChangedImplCopyWith(
          _$UserChangedImpl value, $Res Function(_$UserChangedImpl) then) =
      __$$UserChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UserChangedImpl>
    implements _$$UserChangedImplCopyWith<$Res> {
  __$$UserChangedImplCopyWithImpl(
      _$UserChangedImpl _value, $Res Function(_$UserChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserChangedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserChangedImpl implements _UserChanged {
  const _$UserChangedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthEvent.userChanged(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChangedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChangedImplCopyWith<_$UserChangedImpl> get copyWith =>
      __$$UserChangedImplCopyWithImpl<_$UserChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) userChanged,
    required TResult Function() logoutRequested,
    required TResult Function() userReloadRequested,
    required TResult Function() sendEmailVerification,
  }) {
    return userChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? userChanged,
    TResult? Function()? logoutRequested,
    TResult? Function()? userReloadRequested,
    TResult? Function()? sendEmailVerification,
  }) {
    return userChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? userChanged,
    TResult Function()? logoutRequested,
    TResult Function()? userReloadRequested,
    TResult Function()? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserChanged value) userChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_UserReloadRequested value) userReloadRequested,
    required TResult Function(_SendEmailVerification value)
        sendEmailVerification,
  }) {
    return userChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserChanged value)? userChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_UserReloadRequested value)? userReloadRequested,
    TResult? Function(_SendEmailVerification value)? sendEmailVerification,
  }) {
    return userChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserChanged value)? userChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_UserReloadRequested value)? userReloadRequested,
    TResult Function(_SendEmailVerification value)? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (userChanged != null) {
      return userChanged(this);
    }
    return orElse();
  }
}

abstract class _UserChanged implements AuthEvent {
  const factory _UserChanged(final User user) = _$UserChangedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$UserChangedImplCopyWith<_$UserChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(_$LogoutRequestedImpl value,
          $Res Function(_$LogoutRequestedImpl) then) =
      __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
      _$LogoutRequestedImpl _value, $Res Function(_$LogoutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutRequestedImpl implements _LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) userChanged,
    required TResult Function() logoutRequested,
    required TResult Function() userReloadRequested,
    required TResult Function() sendEmailVerification,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? userChanged,
    TResult? Function()? logoutRequested,
    TResult? Function()? userReloadRequested,
    TResult? Function()? sendEmailVerification,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? userChanged,
    TResult Function()? logoutRequested,
    TResult Function()? userReloadRequested,
    TResult Function()? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserChanged value) userChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_UserReloadRequested value) userReloadRequested,
    required TResult Function(_SendEmailVerification value)
        sendEmailVerification,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserChanged value)? userChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_UserReloadRequested value)? userReloadRequested,
    TResult? Function(_SendEmailVerification value)? sendEmailVerification,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserChanged value)? userChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_UserReloadRequested value)? userReloadRequested,
    TResult Function(_SendEmailVerification value)? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AuthEvent {
  const factory _LogoutRequested() = _$LogoutRequestedImpl;
}

/// @nodoc
abstract class _$$UserReloadRequestedImplCopyWith<$Res> {
  factory _$$UserReloadRequestedImplCopyWith(_$UserReloadRequestedImpl value,
          $Res Function(_$UserReloadRequestedImpl) then) =
      __$$UserReloadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserReloadRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UserReloadRequestedImpl>
    implements _$$UserReloadRequestedImplCopyWith<$Res> {
  __$$UserReloadRequestedImplCopyWithImpl(_$UserReloadRequestedImpl _value,
      $Res Function(_$UserReloadRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserReloadRequestedImpl implements _UserReloadRequested {
  const _$UserReloadRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.userReloadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReloadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) userChanged,
    required TResult Function() logoutRequested,
    required TResult Function() userReloadRequested,
    required TResult Function() sendEmailVerification,
  }) {
    return userReloadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? userChanged,
    TResult? Function()? logoutRequested,
    TResult? Function()? userReloadRequested,
    TResult? Function()? sendEmailVerification,
  }) {
    return userReloadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? userChanged,
    TResult Function()? logoutRequested,
    TResult Function()? userReloadRequested,
    TResult Function()? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (userReloadRequested != null) {
      return userReloadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserChanged value) userChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_UserReloadRequested value) userReloadRequested,
    required TResult Function(_SendEmailVerification value)
        sendEmailVerification,
  }) {
    return userReloadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserChanged value)? userChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_UserReloadRequested value)? userReloadRequested,
    TResult? Function(_SendEmailVerification value)? sendEmailVerification,
  }) {
    return userReloadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserChanged value)? userChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_UserReloadRequested value)? userReloadRequested,
    TResult Function(_SendEmailVerification value)? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (userReloadRequested != null) {
      return userReloadRequested(this);
    }
    return orElse();
  }
}

abstract class _UserReloadRequested implements AuthEvent {
  const factory _UserReloadRequested() = _$UserReloadRequestedImpl;
}

/// @nodoc
abstract class _$$SendEmailVerificationImplCopyWith<$Res> {
  factory _$$SendEmailVerificationImplCopyWith(
          _$SendEmailVerificationImpl value,
          $Res Function(_$SendEmailVerificationImpl) then) =
      __$$SendEmailVerificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailVerificationImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendEmailVerificationImpl>
    implements _$$SendEmailVerificationImplCopyWith<$Res> {
  __$$SendEmailVerificationImplCopyWithImpl(_$SendEmailVerificationImpl _value,
      $Res Function(_$SendEmailVerificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendEmailVerificationImpl implements _SendEmailVerification {
  const _$SendEmailVerificationImpl();

  @override
  String toString() {
    return 'AuthEvent.sendEmailVerification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailVerificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) userChanged,
    required TResult Function() logoutRequested,
    required TResult Function() userReloadRequested,
    required TResult Function() sendEmailVerification,
  }) {
    return sendEmailVerification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? userChanged,
    TResult? Function()? logoutRequested,
    TResult? Function()? userReloadRequested,
    TResult? Function()? sendEmailVerification,
  }) {
    return sendEmailVerification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? userChanged,
    TResult Function()? logoutRequested,
    TResult Function()? userReloadRequested,
    TResult Function()? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (sendEmailVerification != null) {
      return sendEmailVerification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserChanged value) userChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_UserReloadRequested value) userReloadRequested,
    required TResult Function(_SendEmailVerification value)
        sendEmailVerification,
  }) {
    return sendEmailVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserChanged value)? userChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_UserReloadRequested value)? userReloadRequested,
    TResult? Function(_SendEmailVerification value)? sendEmailVerification,
  }) {
    return sendEmailVerification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserChanged value)? userChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_UserReloadRequested value)? userReloadRequested,
    TResult Function(_SendEmailVerification value)? sendEmailVerification,
    required TResult orElse(),
  }) {
    if (sendEmailVerification != null) {
      return sendEmailVerification(this);
    }
    return orElse();
  }
}

abstract class _SendEmailVerification implements AuthEvent {
  const factory _SendEmailVerification() = _$SendEmailVerificationImpl;
}

/// @nodoc
mixin _$AuthState {
  AuthenticationStatus get status => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthenticationStatus status, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthenticationStatus status, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl({required this.status, this.user = User.empty})
      : super._();

  @override
  final AuthenticationStatus status;
  @override
  @JsonKey()
  final User user;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {required final AuthenticationStatus status,
      final User user}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  AuthenticationStatus get status;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
