/// Provides regex validation expression
///@author www.fluttericon.com
///@createdAt 9/25/2020

class RegexValidator {
  static final String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static final String name = r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]';
  static final String username = r'^[a-z0-9_.]{5,30}$';
}
