import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/views/login_screen.dart';
import 'package:collage_app/views/signUp.dart';
import 'package:collage_app/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:collage_app/views/spalsh_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "/login": (BuildContext context) => LoginScreen(),
          "/home": (BuildContext context) => HomeScreen(),
          "/signUp": (BuildContext context) => SignUp(),
          "/navBar": (_) => NavBar(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
