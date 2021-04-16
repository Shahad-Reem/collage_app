import 'package:collage_app/theme/color.dart';
import 'package:collage_app/controllers/authentication_controller.dart';
import 'package:collage_app/services/AuthResultStatus.dart';
import 'package:flutter/material.dart';

import '../controllers/authentication_controller.dart';
import '../widgets/bottomNavBar.dart';
import 'signUp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

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

    _login() async {
      {
        setState(() {
          isLoading = true;
        });
        final status = await FirebaseHelper().login(
            email: emailController.text, password: passwordController.text);
        setState(() {
          isLoading = false;
        });
        if (status == AuthResultStatus.successful) {
          // Navigate to success screen

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => NavBar()), (r) => false);
        } else {
          final errorMsg =
              AuthExceptionHandler.generateExceptionMessage(status);
          _showAlertDialog(errorMsg);
        }
      }
    }

    final emailField = TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Text is empty';
        }

        return null;
      },
      controller: emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Text is empty';
        }
        if (val.length < 6) {
          return "minimum 6 numbers";
        }
        return null;
      },
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: CustomColors.PrimaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _login();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/Calendar-cuate.png",
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 45.0),
                            emailField,
                            SizedBox(height: 25.0),
                            passwordField,
                            SizedBox(
                              height: 35.0,
                            ),
                            loginButon,
                            SizedBox(
                              height: 15.0,
                            ),
                            //Text Widget to navigate user
                            GestureDetector(
                              child: Text('SignUp'),
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                    (r) => false);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
