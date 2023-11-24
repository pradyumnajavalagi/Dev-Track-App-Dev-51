import 'package:flutter/material.dart';


class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/whitepage.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        body: Stack(
          children: [
            Container(
              padding:const EdgeInsets.only(left: 35,top: 100),
              child: const Text('Welcome  ' , style: TextStyle(color: Colors.black , fontSize: 39),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35,top: 180),
              child: Text('Login To Continue' , style: TextStyle(color: Colors.grey[700] , fontSize: 20),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                padding:const EdgeInsets.only(top:220,right: 35,left: 35),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tab(icon: Image.asset("assets/googlelogo.png",width: 30,height: 30)),
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
                      height: 30,
                    ),

                    const Row(
                      children: [
                        Text('Name',
                          style:TextStyle( color: Colors.black,fontSize: 27 , fontWeight: FontWeight.w700) ,),

                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: 'Enter Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))
                    ),),

                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        Text('Email',
                          style:TextStyle( color: Colors.black,fontSize: 27 , fontWeight: FontWeight.w700) ,),

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
                      height: 20,
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

                    ElevatedButton(onPressed:(){},
                        style: ElevatedButton.styleFrom( shape:const StadiumBorder(),
                            elevation: 0.0, minimumSize:const Size.fromHeight(60),
                            side: const BorderSide(color:Colors.grey,width: 1),backgroundColor: Colors.indigoAccent),
                        child: const Text('Create ',
                          style: TextStyle(color: Colors.black , fontSize: 25),)
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                          style:TextStyle( color: Colors.grey,fontSize: 20 , fontWeight: FontWeight.w400) ,),

                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'login');
                        }, child: const Text('Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.deepPurpleAccent),)),
                      ],
                    ),
                     ],//children
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

