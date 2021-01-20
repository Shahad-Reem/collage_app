import 'package:collage_app/constants/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
        color: CustomColors.PrimaryColor,
        elevation: 10.0,
        child: Container(
            height: 150.0,
            width: 150.0,
            alignment: Alignment.center,
            child: Text(
              'Welcome to your calender',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            )),
      ),
    ));
  }
}
