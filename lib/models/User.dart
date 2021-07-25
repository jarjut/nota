import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.emailVerified = false,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Returns whether the users email address has been verified.
  final bool emailVerified;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  User copyWith({String? email, String? name, String? photo}) {
    return User(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      emailVerified: emailVerified,
    );
  }

  static User fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as dynamic;
    return User(
      id: snapshot.id,
      email: data['email'],
      name: data['name'],
      photo: data['photo'],
      emailVerified: data['emailVerified'],
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'email': email,
      'name': name,
      'photo': photo,
      'emailVerified': emailVerified,
    };
  }

  @override
  List<Object?> get props => [email, id, name, photo, emailVerified];
}
