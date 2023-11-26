import 'package:appdev51/utils/colors.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';
  String username = '';

  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 600,
        // alignment: Alignment.bottomCenter,
        // color: ,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img.png'),fit: BoxFit.cover)),
          // color: Colors.transparent ,
           child: Scaffold(
             backgroundColor: Colors.transparent,
             body: SingleChildScrollView(
               child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    // alignment: Alignment.bottomCenter,
                    // height: 900,
                    // color: Colors.white,
                    child: Column(

                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 35,top: 50),
                          child: Container(
                            alignment: Alignment.topLeft,

                            child: const Text('Welcome Back !' , style: TextStyle(color: Colors.black , fontSize: 39,fontWeight: FontWeight.bold),
                ),
        ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text('Login To Continue' , style: TextStyle(color: Colors.grey[700] , fontSize: 20),
                          ),
                        ),

                        Container(
                          padding:const EdgeInsets.only(right: 35,left: 35),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed: () { },
                                    icon:  Image.asset("assets/googlelogo.png",width: 30,height: 30),),
                                  // child: Tab(icon:)),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Or continue with email',
                                    style:TextStyle( color: Colors.grey,fontSize: 20 , fontWeight: FontWeight.w400) ,),

                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),

                              const Row(
                                children: [
                                  Text('Email',
                                    style:TextStyle( color: Colors.black,fontSize: 22 , fontWeight: FontWeight.w700) ,),

                                ],
                              ),
                              TextField(
                                onChanged: (value){
                                  email = value;
                                },
                                // controller: _emailController,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: 'user@mail.com',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    suffixIcon: const Icon(Icons.done)),
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                              const Row(
                                children: [
                                  Text('Password',
                                    style:TextStyle( color: Colors.black,fontSize: 27 , fontWeight: FontWeight.w700) ,),

                                ],
                              ),
                              TextField(
                                obscureText: true,
                                onChanged: (value){
                                  password = value;
                                },
                                // controller: _passwordController,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    hintText: 'Password@123',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    suffixIcon: const Icon(Icons.remove_red_eye_sharp)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){}, child: const Text('Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.deepPurpleAccent) ,))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  bool isConnected = await checkConnectivity();

                                  if (!isConnected) {
                                    // Display a pop-up or show a snackbar indicating no network connection.
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('No Network'),
                                          content: Text('Please check your internet connection.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }

                                  setState(() {
                                    showSpinner = true;
                                  });

                                  try {
                                    final user = await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                    Navigator.pushNamed(context, 'home');
                                    // await _firestore.collection('users').doc(_auth.currentUser?.uid).set({
                                    //   'username': username,
                                    //   'uid': _auth.currentUser?.uid,
                                    //   'email': email,
                                    //   'followers': [],
                                    //   'following': [],
                                    //   // 'files' : ,
                                    // });
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                  //Go to login screen.
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  elevation: 0.0,
                                  minimumSize: const Size.fromHeight(60),
                                  backgroundColor: secondaryColor,
                                ),
                                child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.width/3.1),
                                child: ElevatedButton(onPressed:(){
                                  Navigator.pushNamed(context, 'register');},
                                    child: Text('Create an account',
                                      style: TextStyle(color: Colors.black , fontSize: 20),),
                                    style: ElevatedButton.styleFrom( shape:const StadiumBorder(),
                                        elevation: 0.0, minimumSize:const Size.fromHeight(60),
                                        side: BorderSide(color:Colors.grey,width: 1), backgroundColor: Colors.white70)
                                ),
                              ),
                            ],//children
                          ),
                        )
                      ],
                    ),
                  ),

          ],
        ),
             ),
           ),

      );
  }
}
