import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String username;
  final String description;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  Post({
    required this.uid,
    required this.username,
    required this.description,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'description': description,
      'postId': postId,
      'postUrl': postUrl,
      'likes': likes,
      'datePublished': datePublished,
      'profImage': profImage,
    };
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      uid: snapshot['uid'],
      username: snapshot['username'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
      profImage: snapshot['profImage'],
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      uid: json['uid'],
      username: json['username'],
      description: json['description'],
      postId: json['postId'],
      postUrl: json['postUrl'],
      likes: json['likes'],
      datePublished: json['datePublished'],
      profImage: json['profImage'],
    );
  }
}
