import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collage_app/controllers/authentication_controller.dart';
import 'package:collage_app/services/AuthResultStatus.dart';
import 'package:collage_app/theme/color.dart';
import 'package:collage_app/views/login_screen.dart';
import 'package:collage_app/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _onPressed() {
    firestoreInstance
        .collection("user")
        .add({"name": nameController.text, "email": emailController.text}).then(
            (value) {
      print(value.get());
    });
  }

  _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  }

  createAccount() async {
    final status = await FirebaseHelper().createAccount(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    if (status == AuthResultStatus.successful) {
      _onPressed();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => NavBar()), (r) => false);
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      _showAlertDialog(errorMsg);
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/Booklover-standing.png",
                  height: size.height * 0.35,
                ),
                SizedBox(
                  height: 20,
                ),
/*               Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: CustomColors.kLightYellow,
                      borderRadius: BorderRadius.circular(29)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: CustomColors.kGreen,
                      ),
                      hintText: "Name",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }

                      return null;
                    },
                  ),
                ), */
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: CustomColors.kGreen,
                      borderRadius: BorderRadius.circular(29)),
                  child: TextFormField(
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: CustomColors.kGreen,
                      ),
                      hintText: "Email",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: CustomColors.kGreen,
                      borderRadius: BorderRadius.circular(29)),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Text is empty';
                      }
                      if (val.length < 6) {
                        return "minimum 6 numbers";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: CustomColors.kGreen,
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 9),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: CustomColors.kGreen,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40)),
                        onPressed: () {},
                        child: Text("SignUp",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(
                        color: CustomColors.kLightYellow,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "login",
                        style: TextStyle(
                            color: CustomColors.kLightGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
