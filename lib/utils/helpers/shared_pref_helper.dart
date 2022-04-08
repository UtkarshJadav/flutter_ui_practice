
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/profile_response.dart';

class SharedPref {
  //Keys
  static String loggedIn = 'isLoggedIn';
  static String sessionId = 'sessionId';
  static String appUDID = 'appUDID';
  static String deviceToken = 'deviceToken';
  static String walkThroughVisited = 'walkThroughVisited';
  static String languageSelected = 'languageSelected';
  static String locationSelected = 'locationSelected';
  static String currUser = 'currUser';
  static String currStore = 'currStore';
  static String currStoreId = 'currStoreId';
  static String token = 'token';
  static String recentSearch = 'recentSearch';
  static String firebaseToken = 'firebaseToken';
  static String lat = 'lat';
  static String long = 'long';

 // For plain-text data
  Future<void> set(String key, dynamic value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    }
  }

  //Method for get from any key
  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) ?? defaultValue;
  }

  //Example for get string
  Future<String> getString(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) as String? ?? '';
  }

  //Example for get bool
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(loggedIn) as bool? ?? false;
  }

  Future<bool> isWalkThroughVisited() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(walkThroughVisited) as bool? ?? false;
  }

  Future<bool> isLanguageSelected() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(languageSelected) as bool? ?? false;
  }



  Future<bool> isLocationSelected() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.get(locationSelected) as bool? ?? false;
  }

  Future<ProfileModel?> getCurrUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String profileData =
        await sharedPreferences.get(currUser) as String? ?? '';
    if (profileData == '') {
      return null;
    }
    return ProfileModel().fromJson(jsonDecode(profileData));
  }

  Future<bool> setUser(String userDetails) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    return await sharedPreferences.setString(currUser,userDetails);
  }

  Future<String> getToken() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    return await sharedPreferences.get(token) as String? ?? '';
  }

  Future<bool> setToken(String authToken) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    return await sharedPreferences.setString(token,authToken);
  }

  // For logging out
  Future<void> deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(loggedIn);
    await prefs.remove(appUDID);
    await prefs.remove(deviceToken);
    await prefs.remove(token);
    await prefs.remove(currUser);
  }
}
