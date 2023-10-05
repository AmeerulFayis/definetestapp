import 'package:shared_preferences/shared_preferences.dart';

class AppSp{
  //is Logged
  Future<bool> setIsLogged(bool login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isLogged", login);
  }

  Future<bool> getIsLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogged") ?? false;
  }

  //uid
  Future<bool> setUid(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("uid", uid);
  }

  Future<String> getUid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("uid") ?? "";
  }
  //email
  Future<bool> setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", email);
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email") ?? "";
  }
}