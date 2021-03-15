import 'dart:convert';

import 'package:dangau_hotel/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token");
  }

  static Future<void> removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }

  static Future<void> setUserData(Guest guest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String guestData = jsonEncode(guest.toJson());
    await prefs.setString("user", guestData);
  }

  static Future<Guest> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString("user");
    Map<String, dynamic> mappedUserData = jsonDecode(userData);
    return Guest.fromJson(mappedUserData);
  }

  static Future<bool> hasUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("user");
  }
}
