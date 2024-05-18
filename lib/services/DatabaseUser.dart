import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseUser {

  final String uid;

  DatabaseUser({ required this.uid });

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('userCollection');

  Future<void> addUserData(String name) async {
    return await userCollection.doc(uid).set({
      'username': name,
    }).onError((e, _) => print("Error writing document1: $e"));
  }
  
  Future<void> updateUserData(String field, dynamic value) async {
  return await userCollection.doc(uid).update({
    field: value,
  }).onError((e, _) => print("Error updating document: $e"));
}
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}