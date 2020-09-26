import 'package:everest/Services/Firebase/User.dart' as app_user;
import 'package:firebase_auth/firebase_auth.dart'  as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Class that helps with Firebase auth service
/// @author Manish Poudel
/// @createdAt 9/25/2020
class FirebaseAuthService {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  /// Get app user from firebase
  /// @param User from firebase auth
  /// @return User of app
  app_user.User _userFromFirebase(firebase_auth.User user)
  {
    return user.uid != null ? app_user.User(id:  user.uid):null;
  }

  /// Listen for the change in auth state
  /// @return User data
  Stream<app_user.User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  /// Sign in user with email and Password
  /// @return User stream
  /// @param email and password
  Future<app_user.User> signInWithEmailAndPassword(String email, String password)
  async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  /// Register user with email and Password
  /// @return User stream
  /// @param email and password
  Future<app_user.User> registerWithEmailAndPassword(String email, String password)
  async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  /// Sign out user
  /// @return future void value
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}