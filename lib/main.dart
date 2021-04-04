import 'package:collage_app/controllers/authentication_controller.dart';
import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/views/login_screen.dart';
import 'package:collage_app/views/signUp.dart';
import 'package:collage_app/widgets/bottomNavBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:collage_app/views/spalsh_screen.dart';
import 'package:provider/provider.dart';

import 'views/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
