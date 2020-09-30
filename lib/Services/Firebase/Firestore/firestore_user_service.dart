import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everest/Resources/regex.dart';
import 'package:everest/Resources/regex.dart';
import 'package:everest/Services/Firebase/Firestore/firestore_path_resources.dart';
import 'package:everest/Services/Firebase/user.dart';
import 'package:flutter/cupertino.dart';

/// Class that helps with Firestore service
/// @author Manish Poudel
/// @createdAt 9/26/2020

class FirestoreUserService {
  String uid;
  FirestoreUserService({@required this.uid});

  /// Check if profile exists
  Future<bool> checkIfProfileExists() async {
    final path = FirestorePath.userProfile(uid);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.doc(path).get();
    return documentSnapshot.exists;
  }

  /// Check if username exists
  Future<bool> checkIfUserNameExists(username)
  async {
    final path = FirestorePath.userCollection;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(path).where("username", isEqualTo: username).get();
    print("Doc" + querySnapshot.docs.toString());
    return querySnapshot.docs.length != 0;
  }

  /// Save user
  /// @param User obj
  Future<void> saveUser(User user) {
    final path = FirestorePath.userProfile(uid);
    return FirebaseFirestore.instance.doc(path).set(user.toMap());
  }

  /// Get user stream
  Stream<User> userStream() {
    final path = FirestorePath.userProfile(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => User.fromMap(snapshot.data()));
  }

  /// Get user search stream
  /// @param name
   userSearchStream(String name)
   {

     name ="manish@gmail.com";
  if (RegExp(RegexValidator.email).hasMatch(name)) {
    final reference = FirebaseFirestore.instance.collection(FirestorePath.userCollection)
        .where("emailId", isEqualTo: name).get().then((value){
      print("Data");
      value.docChanges.forEach((element){
        print(element.doc.data().toString());
      });
    });
    return;
  }

    String firstLetter=  name.substring(0,1);
    print(firstLetter);
        print("Top");
        final reference = FirebaseFirestore.instance.collection(FirestorePath.userCollection)
            .where("username", isLessThanOrEqualTo: name)
            .get().then((value){
          print("Data");
          value.docChanges.forEach((element){
            print(element.doc.data().toString());
          });
        });

  final REF = FirebaseFirestore.instance.collection(FirestorePath.userCollection)
      .where("username", isGreaterThanOrEqualTo: name)
      .get().then((value){
    print("Data2");
    value.docChanges.forEach((element){
      print(element.doc.data().toString());
    });
  });
  }

}
