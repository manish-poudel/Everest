import 'package:cloud_firestore/cloud_firestore.dart';
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

  /// Search user by username
  searchUser({@required String text, int limit = 5, @required String searchBy, String searchAfter})
  async {
    Map<String,User> userMap = Map();
   Query query;
    if(searchAfter == null)
      {
        query = FirebaseFirestore.instance.collection(FirestorePath.userCollection).orderBy(searchBy)
            .where(searchBy, isGreaterThanOrEqualTo: text.toLowerCase()).limit(limit);
     }
    else{
      query = FirebaseFirestore.instance.collection(FirestorePath.userCollection).orderBy(searchBy)
          .where(searchBy, isGreaterThanOrEqualTo: text.toLowerCase()).startAfter([searchAfter]).limit(limit);
    }
    QuerySnapshot querySnapshot =  await query.get();
    querySnapshot.docs.forEach((element) {
      User user = User.fromMap(element.data());
      userMap.putIfAbsent(user.id, () => user);
    });
    return userMap;
  }

  searchUserByEmail(email)
  async {
    Map<String,User> userMap = Map();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('emailId', isEqualTo: email).get();;
    querySnapshot.docs.forEach((element) {
      User user = User.fromMap(element.data());
      userMap.putIfAbsent(user.id, () => user);
    });
    return userMap;
  }

  createDummyTestUser()
  async {
    var name = ['Alex Bird', 'Aaliyah Cat', 'Aaraon Dog', 'Angelina Dog', 'Alex Pig', 'Ava Fire', 'Andrew Walla', 'Anthony Gonzales', 'Ariana Grande','Andrew Zicka',
                'Brooke Smith' , 'Bobby Neupane','Bella Cat', 'Ben ten', 'Bethany Mori' , 'Beatrice Moora'
      ];
    var username = ['alex11', 'aaliyah_11', 'angisawesome', 'alex234', 'ava123', 'andrewfire_11', 'anthony','ariana', 'andrew'
      ,'brooke_2100', 'bobby_11' ,'bella_1222', 'ben_is_what', 'bethanyisgood' ,'beatrices' ,'baook'
    ];

    for(int i = 0 ; i < name.length; i++ )
      {
        String id = FirebaseFirestore.instance.collection('users').doc().id;
        await FirebaseFirestore.instance.collection('users').doc(id).set(User(
          id:id,
          name: name[i],
          username: username[i],
          profileImageUrl: "",
          profileCreatedAt: DateTime.now(),
          gender: 'Male',
          emailId: 'josh@gmail.com',
          lastUpdated: {
            'username': DateTime.now(),
            'name':DateTime.now()
          }
        ).toMap());
      }
  }
}
