import 'package:collage_app/provider/task_provider.dart';
import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'controllers/task_controllers.dart';
import 'views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FireastoreController();

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
            if (FirebaseAuth.instance.currentUser?.uid == null) {
              return LoginScreen();
            } else {
              // logged
              return HomeScreen();
            }
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
