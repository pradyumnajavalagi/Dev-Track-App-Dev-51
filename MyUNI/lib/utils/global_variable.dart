import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MyUni/screens/add_post_screen.dart';
import 'package:MyUni/screens/feed_screen.dart';
import 'package:MyUni/screens/profile_screen.dart';
import 'package:MyUni/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
