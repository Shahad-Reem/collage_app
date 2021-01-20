import 'package:collage_app/constants/color.dart';
import 'package:collage_app/views/add_Screen.dart';
import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/views/profile_screen.dart';
import 'package:collage_app/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

enum BottomIcons {
  Home,
  Add,
  Settings,
  Person,
}

class _NavBarState extends State<NavBar> {
  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bottomIcons == BottomIcons.Home
              ? Container(
                  child: HomeScreen(),
                )
              : Container(),
          bottomIcons == BottomIcons.Add
              ? Container(
                  child: AddScreen(),
                )
              : Container(),
          bottomIcons == BottomIcons.Settings
              ? Container(
                  child: SettingsScreen(),
                )
              : Container(),
          bottomIcons == BottomIcons.Person
              ? Container(
                  child: ProfileScreen(),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Home;
                      });
                    },
                    child: bottomIcons == BottomIcons.Home
                        ? Container(
                            decoration: BoxDecoration(
                                color: CustomColors.PrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.home),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        : Icon(Icons.home),
                  ),
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Add;
                      });
                    },
                    child: bottomIcons == BottomIcons.Add
                        ? Container(
                            decoration: BoxDecoration(
                                color: CustomColors.PrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Add",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        : Icon(Icons.add),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Settings;
                      });
                    },
                    child: bottomIcons == BottomIcons.Settings
                        ? Container(
                            decoration: BoxDecoration(
                                color: CustomColors.PrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.settings),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        : Icon(Icons.settings),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Person;
                      });
                    },
                    child: bottomIcons == BottomIcons.Person
                        ? Container(
                            decoration: BoxDecoration(
                                color: CustomColors.PrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.person),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        : Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
