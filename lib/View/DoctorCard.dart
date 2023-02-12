import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  String name;
  String phone;
  DoctorCard({Key? key, required this.name, required this.phone})
      : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Center(
              child: Text(
              widget.name + " : " + widget.phone,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(95.0),
              topRight: Radius.circular(10.0),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ImageIcon(
            AssetImage("assets/img/doctorlogo.png"),
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
