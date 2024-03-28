import 'dart:async';
import 'User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserYG? _userFromFirebaseUser(User? user){
    return user !=null ? UserYG(uid: user.uid) : null;
  }

  Stream<UserYG?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }

  Future sing() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
        print(e.toString());
        return null;
    }
  }
}