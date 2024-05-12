import 'dart:async';
import 'DatabaseUser.dart';
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

  Future register(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseUser(uid: user!.uid).addUserData(username,[]);
      return _userFromFirebaseUser(user);
    }
    catch(e){
        print(e.toString());
        return null;
    }
  }
  Future sign(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
  try {
  return await _auth.signOut();
  }
  catch(e){
  print(e.toString());
  return null;
  }
}
}