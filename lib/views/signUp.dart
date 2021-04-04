import 'package:collage_app/controllers/authentication_controller.dart';
import 'package:collage_app/services/AuthResultStatus.dart';
import 'package:collage_app/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'fires';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      firestoreInstance.collection("user").add({
        "name": nameController.text,
        "email": emailController.text
      }).then((value) {
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

    final nameField = TextFormField(
      controller: nameController,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Text is empty';
        }

        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextFormField(
      controller: emailController,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Text is empty';
        }

        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
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
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          createAccount();
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                  ),
                  nameField,
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
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
