import 'package:e_pill/View/DoctorCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DoctorsScreen extends StatefulWidget {
  static String id="doctorsScreen";
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                            margin: EdgeInsets.all(8),
                            child: Image.asset('assets/img/adoctors.png', fit: BoxFit.contain,))),
                    Expanded(
                        flex:1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Center(
                              child: Text("Available Doctors", style: TextStyle(fontSize: 26),),
                            ),
                            Container(
                                height:20,
                                margin: EdgeInsets.only(left: 8),
                                child: Image.asset('assets/img/doctorlogo.png', fit: BoxFit.contain,))
                          ],
                        )
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                          margin: EdgeInsets.only(top: 8),

                          decoration: const BoxDecoration(
                            color: Colors.white,

                            // border: Border.all(color:Colors.black, width: 2),
                            // borderRadius: BorderRadius.all(Radius.circular(8)),


                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,


                            children: [

                              DoctorCard(name: "ahmed", phone: "01011111111"),
                              DoctorCard(name: "mohamed", phone: "01211111111"),
                              DoctorCard(name: "ehab", phone: "01511111111"),
                              DoctorCard(name: "aya", phone: "01111111111"),
                              DoctorCard(name: "aly", phone: "010011111111"),
                              DoctorCard(name: "nour", phone: "01221111111"),
                              DoctorCard(name: "mahmoud", phone: "01511111111"),
                              DoctorCard(name: "amira", phone: "01151111111"),

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
