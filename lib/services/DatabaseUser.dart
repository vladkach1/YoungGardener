import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:young_gardener/services/plant.dart';
class DatabaseUser {

  final String uid;

  DatabaseUser({ required this.uid });

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('userCollection');

  Future<void> addUserData(String name, List<Plant> pants) async {
    return await userCollection.doc(uid).set({
      'username': name,
      'pants': pants,
    }).onError((e, _) => print("Error writing document1: $e"));
  }
  Future<void> updateUserData(Plant plant) async {
    return await userCollection.doc(uid).set({
    }).onError((e, _) => print("Error writing document1: $e"));
  }
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}