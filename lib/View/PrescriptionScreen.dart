import 'package:e_pill/View/PrescriptionCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  static String id="presScreen";
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
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
                            child: Image.asset('assets/img/presdoctor.png', fit: BoxFit.contain,))),
                    Expanded(
                        flex:1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Center(
                              child: Text("Your prescriptions", style: TextStyle(fontSize: 26),),
                            ),
                            Container(
                                height:20,
                                margin: EdgeInsets.only(left: 8),
                                child: Image.asset('assets/img/prescription.png', fit: BoxFit.contain,))
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

                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,


                              children: [

                                PrescriptionCard(name: "Brufen",time: '12:00',image: 'assets/img/brufen.jpg',),
                                PrescriptionCard(name: "Paracetamol",time: '01:00',image: 'assets/img/paracetamol.jpg'),
                                PrescriptionCard(name: "Davalindi",time: '13:00',image: 'assets/img/davalindi.jpg'),
                                PrescriptionCard(name: "Nexium",time: '15:00',image: 'assets/img/nexium.jpg',),
                                // PrescriptionCard(name: "Brufen",time: '02:00',),


                              ],
                            ),
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
