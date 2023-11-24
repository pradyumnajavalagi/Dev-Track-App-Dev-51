import 'package:appdev51/utils/colors.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 600,
        // alignment: Alignment.bottomCenter,
        // color: ,
        decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA0L3JtNDM1LTI2LWtycHU2cnZlLmpwZw.jpg'),fit: BoxFit.cover)),
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

                              ElevatedButton(onPressed:(){
                                Navigator.pushNamed(context, 'home');
                              }, child: Text('Login',
                                style:TextStyle(color: Colors.white , fontSize: 20),),
                                  style: ElevatedButton.styleFrom( shape: const StadiumBorder(),
                                      elevation:0.0, minimumSize: const Size.fromHeight(60), backgroundColor: secondaryColor),
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
