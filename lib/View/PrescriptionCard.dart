import 'package:flutter/cupertino.dart';

class PrescriptionCard extends StatefulWidget {
  String name;
  String time;
  String image;
   PrescriptionCard({Key? key, required this.name,required this.time, required this.image}) : super(key: key);

  @override
  State<PrescriptionCard> createState() => _PrescriptionCardState();
}

class _PrescriptionCardState extends State<PrescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,

      child: Column(
        children:[
          Text(widget.name,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16),overflow: TextOverflow.clip,),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 100,
            child: Image.asset(widget.image, fit: BoxFit.scaleDown,)),
          Text("Time : " + widget.time,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16),overflow: TextOverflow.clip,),


        ]

      ),
    );
  }
}
