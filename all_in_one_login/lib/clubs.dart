import 'package:flutter/material.dart';

class MyClubs extends StatefulWidget {
  const MyClubs({super.key});

  @override
  State<MyClubs> createState() => _MyClubsState();
}

class _MyClubsState extends State<MyClubs> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:[
          Container(
            height: 230,
            decoration:const  BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.indigo
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
                const Positioned(
                    top: 100,
                    left: 20,
                    child: Text('Clubs', style: TextStyle(
                      fontSize: 40, color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w900,
                    ),))
              ],
            ),
          ),
          SizedBox(height: height*0.05),
          Container(
            height: 230,
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
                            image: AssetImage('assets/devtrackreva.png'),
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
          Expanded(child: ListView(
            children: [
              Container(
                margin:const  EdgeInsets.only(bottom: 10,top: 25),
                height: 200,
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius:const BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        topRight: Radius.circular(80.0)),
                    boxShadow: [ BoxShadow(
                        color: Colors.black26.withOpacity(0.5),
                        offset: const Offset(-10.0,0.0,),
                        blurRadius: 20.0,
                        spreadRadius: 4.0
                    )],
                  ),
                  padding:  EdgeInsets.only(left: 32,top: 50,bottom: 50),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('More About Clubs', style:TextStyle(
                          color: Colors.white,fontSize: 18),),
                      SizedBox(height: 20,),
                      Text('Build Your Projects', style:TextStyle(
                          color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400),),

                    ],
                  ),
                ),
              )

            ],))
        ],
      ),

    );
  }
}