import 'dart:typed_data';

import 'package:appdev51/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = 'some error occured';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v4();
      Post post = Post(
        uid: uid,
        username: username,
        description: description,
        postId: postId,
        datePublished: DateTime.now().toString(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      await _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
