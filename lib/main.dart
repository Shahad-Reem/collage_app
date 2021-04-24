import 'package:collage_app/provider/task_provider.dart';
import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/task_controllers.dart';
import 'views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print('Init Firebase'));
  // intialize firebase this why insted of FutureBuilder so I can make the multiProvider a parent widget

  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final fireastoreController = FireastoreController();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        //    StreamProvider(create: (context)=> firestoreService.getProducts()),
      ],
      child: MaterialApp(
        home: checkIfLoggedIn(),
      ),
    );
    // Show error message if initialization failed
  }

  // made this a function instead of using it with FutureBuilder.
  checkIfLoggedIn() {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return LoginScreen();
    } else {
      // logged
      return HomeScreen();
    }
  }
}
