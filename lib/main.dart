import 'package:appdev51/providers/user_providers.dart';
import 'package:appdev51/screens/login.dart';
import 'package:appdev51/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/colors.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeScreenLayout(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return HomeScreenLayout();
              }
              else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                )
              );
            }
            return const MyLogin();
          },
        ),
        routes: {
          // 'welcome': (context) => WelcomeScreen(),
          'register': (context) => MyRegister(),
          'login': (context) => MyLogin(),
          'home': (context) => HomeScreenLayout(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.send_rounded),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
          title: Center(
            child: const Text(
              "Home",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          elevation: 0.0,
        ),
      ),
    );
  }
}
