import 'package:firebase_auth/firebase_auth.dart';

/// Class that helps with Firebase auth service
/// @author Manish Poudel
/// @createdAt 9/25/2020
class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  /// Get app user from firebase
  /// @param User from firebase auth
  /// @return User of app
  User _userFromFirebase(User user) {
    return user != null ? user : null;
  }

  /// Listen for the change in auth state
  /// @return User data
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  /// Sign in user with email and Password
  /// @return User stream
  /// @param email and password
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  /// Register user with email and Password
  /// @return User stream
  /// @param email and password
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  /// Sign out user
  /// @return future void value
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
