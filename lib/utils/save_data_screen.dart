import 'package:demo/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyPrefs extends ChangeNotifier {

  SharedPreferences? preferences;

  static Future<void> setAuthCode(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constance.authCode, authcode);

  }

  static Future<String> getAuthCode() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(Constance.authCode) ?? "";

  }




}
