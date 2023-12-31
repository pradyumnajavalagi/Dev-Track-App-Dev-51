import 'package:MyUni/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUni/providers/user_provider.dart';
import 'package:MyUni/responsive/mobile_screen_layout.dart';
import 'package:MyUni/responsive/responsive_layout.dart';
import 'package:MyUni/responsive/web_screen_layout.dart';
import 'package:MyUni/screens/login_screen.dart';
import 'package:MyUni/utils/colors.dart';
import 'package:provider/provider.dart';

import 'models/shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCRoLjrf9H_2nWU90wvDHA5cWOilPm-wOc",
        appId: "1:60502507103:web:6815d04cb7ea8721f025ea",
        messagingSenderId: "585119731880",
        projectId: "myuni-1b35c",
        storageBucket: 'myuni-1b35c.appspot.com'
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(ChangeNotifierProvider(create: (context)=>Shop(),
    child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyUni',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return  ResponsiveLayout(
                  mobileScreenLayout: SplashScreen(),
                  webScreenLayout: const WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SplashScreen2();
          },
        ),
      ),
    );
  }
}
class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // Simulate a 1-second delay, then navigate to the main screen
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png')
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}