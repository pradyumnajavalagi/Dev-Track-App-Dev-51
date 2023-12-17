import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MyUni/resources/auth_methods.dart';
import 'package:MyUni/responsive/mobile_screen_layout.dart';
import 'package:MyUni/responsive/responsive_layout.dart';
import 'package:MyUni/responsive/web_screen_layout.dart';
import 'package:MyUni/screens/signup_screen.dart';
import 'package:MyUni/utils/colors.dart';
import 'package:MyUni/utils/global_variable.dart';
import 'package:MyUni/utils/utils.dart';
import 'package:MyUni/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isObscure = true;
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
            ),
            (route) => false);

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // alignment: Alignment.bottomCenter,
      // color: ,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img.png'), fit: BoxFit.cover)),
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
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            height: 70,
                            child: Image.asset('assets/logo.png')),
                        Container(
                          height: 50,
                          width: 200,
                          child: Center(
                            child: Image.asset(
                              'assets/MyUni.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 50),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Welcome Back !',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 39,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 35),
                    //   child: Text('Login To Continue' , style: TextStyle(color: Colors.grey[700] , fontSize: 20),
                    //   ),
                    // ),

                    Container(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     // IconButton(onPressed: () { },
                          //     //   icon:  Image.asset("assets/googlelogo.png",width: 30,height: 30),),
                          //     // child: Tab(icon:)),
                          //   ],
                          // ),
                          // const Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('Or continue with email',
                          //       style:TextStyle( color: Colors.grey,fontSize: 20 , fontWeight: FontWeight.w400) ,),
                          //
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 50,
                          // ),

                          const Row(
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
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
                              Text(
                                'Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          TextField(
                            obscureText: _isObscure,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey,
                              hintText: 'Password@123',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                child: _isObscure
                                    ? const Icon(Icons.visibility_off_sharp)
                                    : const Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.deepPurpleAccent),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          InkWell(
                            onTap: loginUser,
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                color: secondaryColor,
                              ),
                              child: !_isLoading
                                  ? const Text(
                                      'Log in',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.width / 3.1),
                            child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen(),
                                      ),
                                    ),
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    elevation: 0.0,
                                    minimumSize: const Size.fromHeight(60),
                                    side: const BorderSide(
                                        color: Colors.grey, width: 1),
                                    backgroundColor: Colors.white70),
                                child: const Text(
                                  'Create an account',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                          ),
                        ], //children
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
