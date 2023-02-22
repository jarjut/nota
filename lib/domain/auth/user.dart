import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// {@template user}
/// User entity
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
@freezed
class User with _$User {
  /// {@macro user}
  const factory User({
    /// The current user's id.
    required String id,

    /// The current user's email address.
    String? email,

    /// The current user's name (display name).
    String? name,

    /// Url for the current user's photo.
    String? photoUrl,

    /// Returns whether the users email address has been verified.
    @Default(false) bool emailVerified,
  }) = _User;

  const User._();

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  // ignore: prefer_constructors_over_static_methods
  static User fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    return User(
      id: snapshot.id,
      email: data?['email'] as String?,
      name: data?['name'] as String?,
      photoUrl: data?['photo'] as String?,
      emailVerified: data?['emailVerified'] as bool? ?? false,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'email': email,
      'name': name,
      'photo': photoUrl,
      'emailVerified': emailVerified,
    };
  }
}
