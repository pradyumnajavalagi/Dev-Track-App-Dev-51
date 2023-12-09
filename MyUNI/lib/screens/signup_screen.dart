import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:MyUni/resources/auth_methods.dart';
import 'package:MyUni/responsive/mobile_screen_layout.dart';
import 'package:MyUni/responsive/responsive_layout.dart';
import 'package:MyUni/responsive/web_screen_layout.dart';
import 'package:MyUni/screens/login_screen.dart';
import 'package:MyUni/utils/colors.dart';
import 'package:MyUni/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    // Set loading to true
    setState(() {
      _isLoading = true;
    });

    // Set a default image if the user doesn't upload a profile pic
    Uint8List defaultImage = await getDefaultProfileImage();
    Uint8List profileImage = _image ?? defaultImage;

    // Signup user using our AuthMethods
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: profileImage,
    );

    // If string returned is success, the user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });

      // Navigate to the home screen
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      // Show the error
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  Future<Uint8List> getDefaultProfileImage() async {
    // You can replace this with the default image you want to use
    // For example, you can load it from an asset or network
    // In this example, I'm using a placeholder image as a Uint8List
    // Modify this part based on your requirements
    // You can use AssetImage, NetworkImage, or any other method to load the default image
    ByteData data = await rootBundle.load('assets/default_profile_pic.png');
    return data.buffer.asUint8List();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    // Set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 70,
                              child: Image.asset('assets/logo.png'),
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 30),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Welcome !',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 39,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Stack(
                          children: [
                            _image != null
                                ? CircleAvatar(
                              radius: 40,
                              backgroundImage: MemoryImage(_image!),
                              backgroundColor: Colors.red,
                            )
                                : const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  'assets/default_profile_pic.jpg'),
                              backgroundColor: Colors.grey,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 45,
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(Icons.add_a_photo),
                              ),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: const Icon(Icons.done),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Row(
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: 'user@mail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: const Icon(Icons.done),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: 'Password@123',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon:
                            const Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Row(
                          children: [
                            Text(
                              'Bio',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _bioController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: 'Flutter Dev',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: const Icon(Icons.abc_rounded),
                          ),
                        ),
                        const SizedBox(height: 50),
                        InkWell(
                          onTap: signUpUser,
                          child: Container(
                            width: double.infinity,
                            height: 60,
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
                              'Sign up',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                                : const CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width / 7.9),
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              elevation: 0.0,
                              minimumSize: const Size.fromHeight(60),
                              side: BorderSide(color: Colors.grey, width: 1),
                              backgroundColor: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
