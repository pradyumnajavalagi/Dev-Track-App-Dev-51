import 'package:appdev51/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
  // await launch(uri.toString());
}

class MyPlace extends StatefulWidget {
  const MyPlace({Key? key}) : super(key: key);

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:[
          //-------------------HEADING-----------------------
          Container(
            height: 230,
            decoration: const BoxDecoration(
                borderRadius:  BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Color.fromRGBO(102, 107, 237, 1),
                boxShadow:  [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-10.0,10.0),
                      blurRadius: 20.0,
                      spreadRadius: 4.0

                  )
                ]
            ),
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 80,
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.white,

                      ),

                    )
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(left: 50),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: secondaryColor,
                        ),
                      ),
                      Text('Places', style: TextStyle(
                        fontSize: 40, color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w900,
                      ),),
                    ],
                  ),),
              ],
            ),
          ),
          SizedBox(height: height*0.05),
          //-------------------PLACE DIVISIONS---------------

          Expanded(
              child:MediaQuery.removePadding(context: context,
                  removeTop: true,
                  child: ListView(
                      children: [
                        Container(
                          height: 230,
                          child: GestureDetector(
                            onTap: (){
                              // launchUrl(url);
                              _launchUrl(Uri.parse('https://maps.app.goo.gl/sV44MGtVesDLsvWQ9'));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    left: 20,
                                    child: Material(

                                      child: Container(
                                        height: 180,
                                        width: width*0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(0.0),
                                          boxShadow:const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-10.0,10.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0
                                            )
                                          ],
                                        ),
                                      ),

                                    )),
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/img.png'),
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                                Positioned(
                                    top: 45,
                                    left: 200,
                                    child: Container(
                                      height: 150,
                                      width: 180,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Amulya",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Resturant",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Bellahali",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),)

                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 230,
                          child: GestureDetector(
                            onTap: (){
                              // launchUrl(url);
                              _launchUrl(Uri.parse('https://maps.app.goo.gl/CyLTThMcCYFcPhkZ8'));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    left: 20,
                                    child: Material(

                                      child: Container(
                                        height: 180,
                                        width: width*0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(0.0),
                                          boxShadow:const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-10.0,10.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0
                                            )
                                          ],
                                        ),
                                      ),

                                    )),
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/img_1.png'),
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                                Positioned(
                                    top: 45,
                                    left: 200,
                                    child: Container(
                                      height: 150,
                                      width: 180,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Church Street",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Food and Nightlife",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Central banglore",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),)

                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 230,
                          child: GestureDetector(
                            onTap: (){
                              // launchUrl(url);
                              _launchUrl(Uri.parse('https://maps.app.goo.gl/h3anPXeD24G5cHeG9'));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    left: 20,
                                    child: Material(

                                      child: Container(
                                        height: 180,
                                        width: width*0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(0.0),
                                          boxShadow:const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-10.0,10.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0
                                            )
                                          ],
                                        ),
                                      ),

                                    )),
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/img_2.png'),
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                                Positioned(
                                    top: 45,
                                    left: 200,
                                    child: Container(
                                      height: 150,
                                      width: 180,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Lake",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Tourist Place",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("kattigenahalli",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),)

                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 230,
                          child: GestureDetector(
                            onTap: (){
                              // launchUrl(url);
                              _launchUrl(Uri.parse('https://maps.app.goo.gl/DrSjXbzc93sjngpHA'));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    left: 20,
                                    child: Material(

                                      child: Container(
                                        height: 180,
                                        width: width*0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(0.0),
                                          boxShadow:const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-10.0,10.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0
                                            )
                                          ],
                                        ),
                                      ),

                                    )),
                                Positioned(
                                  top: 0,
                                  left: 30,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/img_3.png'),
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                                Positioned(
                                    top: 45,
                                    left: 200,
                                    child: Container(
                                      height: 150,
                                      width: 180,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("GoKarting",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Games and adventure",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Huskur",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),)

                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),

                      ]
                  )
              )
          ),

        ],
      ),
    );
  }
}