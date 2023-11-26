// import 'dart:html';
import 'dart:typed_data';
import 'package:appdev51/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:appdev51/models/user.dart'as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User>getUserDetails()async{
    User? currentUser = _auth.currentUser;
    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser!.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    // required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          uid: cred.user!.uid,
          username: username,
          email: email,
          photoUrl: photoUrl,
          bio: '',
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = "sucess";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
