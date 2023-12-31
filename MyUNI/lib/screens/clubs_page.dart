import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// late final Uri url;
// final Uri _url = Uri.parse('https://revahack.com/');
Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
  // await launch(uri.toString());
}

class MyClubs extends StatefulWidget {
  const MyClubs();

  @override
  State<MyClubs> createState() => _MyClubsState();
}

class _MyClubsState extends State<MyClubs> {

  // launchUrl(String url) async {
  //   if (await canLaunch(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }



  @override
  // late Uri _url;
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
                        Text('Clubs', style: TextStyle(
                          fontSize: 40, color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.w900,
                        ),),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: height*0.05),
          //-------------------CLUBS DIVISIONS---------------

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
                              _launchUrl(Uri.parse('https://devtrack.club/'));
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
                                            image: AssetImage('assets/devtrack.png'),
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
                                          Text("Dev/Track",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Technical Club",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Learn and Develop",style: TextStyle(fontSize: 20,
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
                              _launchUrl(Uri.parse('https://revaglug.com/'));
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
                                            image: AssetImage('assets/glug.jpg'),
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
                                          Text("G&R",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Glug & Robotics Club",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Hustle",style: TextStyle(fontSize: 20,
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
                              _launchUrl(Uri.parse('https://revahack.com/'));
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
                                            image: AssetImage('assets/revahack.png'),
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
                                          Text("Reva Hack",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("The Hack Is Back",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Hackathons",style: TextStyle(fontSize: 20,
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
                              _launchUrl(Uri.parse('https://revanest.com/'));
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
                                            image: AssetImage('assets/revanest.png'),
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
                                          Text("Reva Nest",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Technology Business Incubator",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Grow Your Ideas",style: TextStyle(fontSize: 20,
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
                              _launchUrl(Uri.parse('https://www.instagram.com/facit.reva/'));
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
                                            image: AssetImage('assets/facit.png'),
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
                                          Text("FACIT",style: TextStyle(fontSize: 25,
                                              color: Colors.black, fontWeight: FontWeight.bold
                                          ),),
                                          Text("Cultural Club",style: TextStyle(fontSize: 20,
                                              color: Colors.black, fontWeight: FontWeight.w500
                                          ),),
                                          Divider(color: Colors.black),
                                          Text("Learn...",style: TextStyle(fontSize: 20,
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

  // void launchURL(String url) {
  //   print('Launching URL: $url');
//   // }
//   Future<void> _launchUrl(Uri url) async {
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }

}

