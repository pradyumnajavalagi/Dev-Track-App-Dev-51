import 'package:MyUni/screens/announcements.dart';
import 'package:MyUni/screens/chat_screen.dart';
import 'package:MyUni/screens/clubs_page.dart';
import 'package:MyUni/screens/feed_screen.dart';
import 'package:MyUni/screens/feedback.dart';
import 'package:MyUni/screens/intropage.dart';
import 'package:MyUni/screens/map_page.dart';
import 'package:MyUni/screens/mentoring.dart';
import 'package:MyUni/screens/todo_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MyUni/utils/colors.dart';
import '../screens/login_screen.dart';
import '../screens/place_page.dart';
import '../utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

// late final Uri url;
// final Uri _url = Uri.parse('https://revahack.com/');
Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
  // await launch(uri.toString());
}


AppBar navBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.send_rounded),
        color: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen(uid: FirebaseAuth.instance.currentUser!.uid),
            ),
          );
        },
      ),
    ],
    title: Center(
      child: Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
    elevation: 0.0,
  );
}

void main() {
  runApp(MaterialApp(
    home: FeedScreen(),
  ));
}
class NavBar extends StatefulWidget {
  final String uid;
  const NavBar({Key? key, required this.uid}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var userData = {};
  bool isLoading = false;
  void initState() {
    super.initState();
    getData();
  }
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
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: secondaryColor,
            ),
            accountName: Text(userData['username'],style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),),
            accountEmail: Text(userData['email']),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userData['photoUrl']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.school,
                color: tddarkblue,
              ),
              title: Text('Mentoring'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mentoring()),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.group,
                color: tddarkblue,
              ),
              title: Text('Clubs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyClubs()),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.announcement_rounded,
                color: tddarkblue,
              ),
              title: Text('Events'),
              onTap: () {
                _launchUrl(Uri.parse('https://www.reva.edu.in/events'));
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.book,
                color: tddarkblue,
              ),
              title: Text('SLCM🎓'),
              onTap: () {
                _launchUrl(Uri.parse('https://reva-university.my.site.com/StudentPortal/s/login/'));
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.shopping_bag,
              color: tddarkblue,
              ),
              title: Text('Brand Store'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroPage()),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.task,
              color: tddarkblue,),
              title: Text('ToDo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.location_on_rounded,
                color: tddarkblue,
              ),
              title: Text('MyPlaces'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPlace()),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.lightbulb,
                color: tddarkblue,
              ),
              title: Text('feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedBack()),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: Icon(Icons.logout,
                color: tddarkblue,
              ),
              title: Text('Sign out'),
              onTap: () async {
               await FirebaseAuth.instance.signOut();
               if (context.mounted) {
                 Navigator.of(context)
                     .pushReplacement(
                   MaterialPageRoute(
                     builder: (context) =>
                     const LoginScreen(),
                   ),
                 );
               }
                // Navigator.pop(context); // Close the drawer
              },
            ),
          ),
        ],
      ),
    );
  }
}

