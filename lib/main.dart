// import 'dart:io';
//
// import 'package:untitled/NlpDetectorViews/entity_extraction_view.dart';
// import 'package:untitled/NlpDetectorViews/language_translator_view.dart';
// import 'package:untitled/NlpDetectorViews/smart_reply_view.dart';
//
// import 'NlpDetectorViews/language_identifier_view.dart';
// import 'package:flutter/material.dart';
//
// import 'dart:math';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_error.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:untitled/HomeScreen.dart';
//
// import 'SplashScreen.dart';
//
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google ML Kit Demo App'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//
//                   ExpansionTile(
//                     title: const Text("Natural Language"),
//                     children: [
//                       CustomCard(
//                         'Language Identifier',
//                         LanguageIdentifierView(),
//                         featureCompleted: true,
//                       ),
//                       CustomCard(
//                           'Language Translator', LanguageTranslatorView()),
//                       CustomCard('Entity Extractor', EntityExtractionView()),
//                       CustomCard('Smart Reply', SmartReplyView())
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomCard extends StatelessWidget {
//   final String _label;
//   final Widget _viewPage;
//   final bool featureCompleted;
//
//   const CustomCard(this._label, this._viewPage,
//       {this.featureCompleted = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.only(bottom: 10),
//       child: ListTile(
//         tileColor: Theme.of(context).primaryColor,
//         title: Text(
//           _label,
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         onTap: () {
//           if (Platform.isIOS && !featureCompleted) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: const Text(
//                     'This feature has not been implemented for iOS yet')));
//           } else
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => _viewPage));
//         },
//       ),
//     );
//   }
// }
//




import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as image;
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pill/View/DoctorsScreen.dart';
import 'package:e_pill/View/PrescriptionScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DatabaseUtils/keys.dart';
import 'Model/Client.dart';
import 'SplashScreen.dart';


import 'View/CelebrateScreen.dart';
import 'View/HomeScreen.dart';
import 'View/LoginScreen.dart';
import 'View/SignupScreen.dart';
import 'package:rxdart/rxdart.dart';


// TODO: Add stream controller
 final  messageStreamController = BehaviorSubject<RemoteMessage>();


// TODO: Define the background message handler

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final database = FirebaseFirestore.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? registered = prefs.getString("register");
  print("registered : $registered");
  Widget screen;
  if (!(registered == null || registered == false)) {
    var dataStream = await database.collection(Keys.CLIENT_DB).get();


    var snapshot = dataStream.docs.firstWhere((element) =>
    element.get("token").toString() == registered.toString());
    Client client = Client(name: snapshot.get("name").toString());
    print("Client 3 : ${client.name}");
    screen=HomeScreen();


  }else {
    screen=LoginScreen();

  }

  // TODO: Request permission


  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }


  // TODO: Register with FCM
// It requests a registration token for sending messages to users from your App server or other trusted server environment.
  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }

  // TODO: Set up foreground message handler

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    messageStreamController.sink.add(message);
  });

  // TODO: Set up background message handler


  runApp(MyApp(screen:screen));
}



class MyApp extends StatelessWidget {
  Widget screen;

  MyApp({required this.screen});



  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "sansa",
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(screen: screen,),
      initialRoute: SplashScreen.id,
      routes: {
      //
        LoginScreen.id:(context)=> LoginScreen(),
      //   SplashScreen.id:(context)=>SplashScreen(),
        SignupScreen.id:(context)=> SignupScreen(),
        HomeScreen.id:(context)=> HomeScreen(),
      //   PatientScreen.id:(context)=>PatientScreen(),
      //   LabTestsScreen.id:(context)=>LabTestsScreen(),
      //   NurseScreen.id:(context)=>NurseScreen(),
     CelebrateScreen.id:(context)=>CelebrateScreen(),
        DoctorsScreen.id:(context)=>DoctorsScreen(),
        PrescriptionScreen.id:(context)=>PrescriptionScreen(),

        //   CheckPatientScreen.id:(context)=>CheckPatientScreen(),
       }
      // ,
    );
  }
}

