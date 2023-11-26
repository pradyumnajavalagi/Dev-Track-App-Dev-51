import 'dart:typed_data';
import 'dart:ui';
import 'package:appdev51/models/user.dart';
import 'package:appdev51/resources/firestore_methods.dart';
import 'package:appdev51/utils/colors.dart';
import 'package:appdev51/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_providers.dart';

// import 'cu';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
      String uid,
      String username,
      String profImage,
      ) async {
    try {
      if (_file != null) {
        String res = await FirestoreMethods().uploadPost(
          _descriptionController.text,
          _file!,
          uid,
          username,
          profImage,
        );
        if (res == 'success') {
          showSnackBar('Posted!', context);
        } else {
          showSnackBar(res, context);
        }
      } else {
        showSnackBar('Please select an image first.', context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create a Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectImage(context),
                icon: const Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_rounded),
                color: Colors.black,
              ),
              title: const Text(
                'New post',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: ()=>postImage(
                      user!.uid,
                      user.username,
                      user.photoUrl,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor),
                    ),
                    child: const Text(
                      'post',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://64.media.tumblr.com/04e9d05382743bcae8647c26e63f0fc2/b91c19a5e4c2943b-16/s1280x1920/bddf53bfc36d98666332619ecd72418cc529e5da.jpg',
                        ),
                        minRadius: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Write the capton...',
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                        ),
                      ),
                      SizedBox(
                          height: 45,
                          width: 45,
                          child: AspectRatio(
                            aspectRatio: 457 / 481,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                ),
                              ),
                            ),
                          )),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
