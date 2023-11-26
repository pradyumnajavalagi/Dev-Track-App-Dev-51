import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String bio;
  final List<String> followers;
  final List<String> following;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot['uid'],
      username: snapshot['username'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      followers: List<String>.from(snapshot['followers']),
      following: List<String>.from(snapshot['following']),
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      followers: List<String>.from(json['followers']),
      following: List<String>.from(json['following']),
    );
  }
}
