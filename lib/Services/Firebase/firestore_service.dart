import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everest/Services/Firebase/User.dart';
import 'package:everest/Services/Firebase/firestore_path_resources.dart';
import 'package:flutter/cupertino.dart';

/// Class that helps with Firestore service
/// @author Manish Poudel
/// @createdAt 9/26/2020

class FirestoreService {
  String uid;
  FirestoreService({@required this.uid});

  /// Check if profile exists
  Future<bool> checkIfProfileExists() async {
    final path = FirestorePath.userProfile(uid);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.doc(path).get();
    return documentSnapshot.exists;
  }

  /// Save user
  /// @param User obj
  Future<void> saveUser(User user) {
    final path = FirestorePath.userProfile(uid);
    return FirebaseFirestore.instance.doc(path).set(user.toMap());
  }

  /// Get user streAM
  Stream<User> userStream() {
    final path = FirestorePath.userProfile(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => User.fromMap(snapshot.data()));
  }
}
