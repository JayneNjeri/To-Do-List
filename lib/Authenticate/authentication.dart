// ignore_for_file: unnecessary_null_comparison

import 'package:to_do_list/Authenticate/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //enable communication between firbase and our app
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //The _userFromFirebaseUser method is defined to create a UserModel object from a User object. If the User object is not null, it creates a UserModel object with the uid of the User. If the User object is null, it returns null.
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Sign up using email and password
  //If the user creation is successful, it gets the User object from the UserCredential and passes it to the _userFromFirebaseUser method to create a UserModel object. This UserModel object is then returned.
  Future createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in usin email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //Sign in using google
}
