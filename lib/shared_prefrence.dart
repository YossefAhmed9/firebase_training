import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPrefrences;

  static init() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveData({required String key, required value}) async {
    if (value is bool) {
      await sharedPrefrences?.setBool(key, value);
      return true;
    }

    if (value is int) {
      await sharedPrefrences?.setInt(key, value);
      return true;
    }

    if (value is double) {
      await sharedPrefrences?.setDouble(key, value);
      return true;
    }

    if (value is String) {
      await sharedPrefrences?.setString(key, value);
      return true;
    }

    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPrefrences?.get(key);
  }
}
