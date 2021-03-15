import 'package:shared_preferences/shared_preferences.dart';

class AppDataPreferences {
  static Future<bool> getFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLaunch = prefs.getBool("first_launch");
    return firstLaunch;
  }

  static Future<void> setFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("first_launch", true);
  }

  static Future<void> removeFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("first_launch");
  }
}
