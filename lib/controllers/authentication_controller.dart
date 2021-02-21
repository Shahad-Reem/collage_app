import 'dart:ffi';

import 'package:collage_app/services/AuthResultStatus.dart';
import 'package:collage_app/views/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final _auth = FirebaseAuth.instance;
  AuthResultStatus _status;

  Future<AuthResultStatus> login({email, password}) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }

    return _status;
  }

  Future<AuthResultStatus> createAccount(
      {String name, String email, String password}) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }

/* Future<String> getCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      //if a current user exists , then
      return user.uid;
    } else {
      return null;
    }
  }
}*/

  // Log out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
