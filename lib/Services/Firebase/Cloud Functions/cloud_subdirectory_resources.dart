/// Get firestore path
/// @author Manish Poudel
/// @createdAT 9/27/2020
class APISubDirectory {
  static String searchAllUser(String value, String id1, String id2) =>  '/search/user?text=$value&param1=$id1&param2=$id2';
  static String searchByUsername(String value) => '/search/username?text=$value';
  static String searchByName(String value) =>  '/search/name?text=$value';
}
