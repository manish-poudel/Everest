/// Get firestore path
/// @author Manish Poudel
/// @createdAT 9/27/2020
class FirestorePath {
  static String userCollection = 'users';
  static String userProfile(String uid) => 'users/$uid';
}
