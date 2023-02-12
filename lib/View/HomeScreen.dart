
import 'dart:io';

import 'package:e_pill/View/DoctorsScreen.dart';
import 'package:e_pill/View/PrescriptionScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../Model/Client.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  static String id='HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Client client=Client();
  String _lastMessage="";

  // _HomeScreenState(){
  //
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\nTitle=${message.notification?.title},'
              '\nBody=${message.notification?.body},'
              '\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }

        print(_lastMessage);

      });
    });
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;


    return buildPage(height : height);
  }




  Widget buildPage({required double height}) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              // padding: EdgeInsets.all(16),
              height: height,

              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Image.asset('assets/img/welcome.png', fit: BoxFit.contain,))
                    ),
                    Expanded(
                        flex:1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                             Center(
                              child: Text(
                                "Welcome " + client.name!
                                , style: const TextStyle(fontSize: 26),),
                            ),
                            Container(
                                height:20,
                                margin: const EdgeInsets.only(left: 8),
                                child: Image.asset('assets/img/pill.png', fit: BoxFit.contain,))
                          ],
                        )
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,


                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                InkWell(
                                  child: SizedBox(

                                    height: 160,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            height: 100,
                                            child: Image.asset('assets/img/pharmacy.png', fit: BoxFit.scaleDown,)),

                                        const Text("Nearby pharmacies",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16),overflow: TextOverflow.clip,),


                              ],
                                    ),

                                  ),
                                    onTap: (){MapsLauncher.launchQuery(
                                        'pharmacy');
                                    if (kDebugMode) {
                                      print("aloo");
                                    }
                                    }
                                ),

                                InkWell(
                                  child: SizedBox(

                                    height: 160,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            height: 100,
                                            child: Image.asset('assets/img/doctors.png', fit: BoxFit.scaleDown,)),

                                        const Text("Doctors",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),


                                      ],
                                    ),

                                  ),

                                  onTap: (){
                                    Navigator.pushNamed(context, DoctorsScreen.id);

                                  },
                                ),
                              ],
                            ),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                InkWell(

                                  child: SizedBox(

                                    height: 160,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            height: 100,
                                            child: Image.asset('assets/img/notifications.png', fit: BoxFit.scaleDown,)),

                                        const Text("Notifcations",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),


                                      ],
                                    ),

                                  ),
                                  onTap: (){MapsLauncher.launchQuery(
                                      'pharmacy');
                                  if (kDebugMode) {
                                    print("aloo");
                                  }
                                  }
                                ),

                                InkWell(
                                  child: SizedBox(

                                    height: 160,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            height: 100,
                                            child: Image.asset('assets/img/pres.png', fit: BoxFit.scaleDown,)),

                                        const Text("Prescriptions",textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),


                                      ],
                                    ),

                                  ),
                                    onTap:(){

                                      Navigator.pushNamed(context, PrescriptionScreen.id);
                                    }


                                ),
                              ],
                            ),

                          ],
                        )
                      ),
                    ),




                  ],
                ),
              ),



            ),
          ),
        ],
      ),
    );
  }
}
