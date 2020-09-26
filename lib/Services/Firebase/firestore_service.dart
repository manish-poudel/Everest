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
  Future<Map<String, dynamic>> getProfileMap() async {
    final path = FirestorePath.userProfile(uid);
    print(path);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.doc(path).get();
    if (!documentSnapshot.exists) {
      return null;
    }
    return documentSnapshot.data();
  }
}
