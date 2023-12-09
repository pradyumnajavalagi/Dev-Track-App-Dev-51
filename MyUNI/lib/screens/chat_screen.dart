import 'package:MyUni/utils/colors.dart';
import 'package:MyUni/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/utils.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";
  final String uid;
  const ChatScreen({Key? key, required this.uid}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  late String messageText;
  var userData = {};
  bool isLoading = false;
  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getData();
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection("messages").get();
  //   for(var message in messages.docs){
  //     print(message.data());
  //   }
  // }

  void messagesStream() async {
    await for (var snapshots in _firestore.collection("messages").snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data());
      }
    }
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.close),
        //     onPressed: () {
        //       _auth.signOut();
        //       Navigator.pop(context);
        //       //Implement logout functionality
        //     },
        //   ),
        // ],
        title: Text('⚡️Chat',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: secondaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      //Implement send functionality.
                      _firestore.collection("messages").add({
                        "text": messageText,
                        "sender": loggedInUser.email,
                        "timestamp": FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatefulWidget {
  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection("messages").orderBy("timestamp").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: secondaryColor,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser.email;
          final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              isMe: currentUser == messageSender);
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  MessageBubble({required this.text, required this.sender, required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))
                : BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
            color: isMe ? secondaryColor : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
