import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Card(
            color: Colors.yellow,
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
