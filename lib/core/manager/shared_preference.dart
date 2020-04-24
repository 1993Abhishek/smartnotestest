import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference
{
  Future<bool> saveTokenPreference({@required String key, @required String accessToken}) async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString(key, accessToken);
    return preferences.commit();
  }

  Future<String> getTokenPreferenced(String key) async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    String token= preferences.getString(key);
    return token;
  }

}