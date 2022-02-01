import 'package:demo/api/bas_url.dart';
import 'package:demo/model/login_model.dart';
import 'package:demo/screen/home_page.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier {


  var loader = false;
  late LoginModel loginModel;

  Future<LoginModel?> loginData(
      String userName, String password) async {
    final body = {
      'username':userName,
      'password':password,
      "twoFactorCode": "ddd",

    };

    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.parse("${ApiServices.BASE_URl}Authenticate/login"),
      headers: headers,
      //encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(body),
    );
    print("RESPONSE11 __${response.body}");


      loginModel = loginModelFromJson(response.body);
      print("RESPONSE22 __${response.body}");
      print("RESPONSE 44__${loginModel}");
      if (loginModel.successResonse!.token!= "") {

        loader= true;

        MyPrefs.setAuthCode(loginModel.successResonse!.token!);

      } else {
        loader= false;

        Fluttertoast.showToast(
            msg: "Something went Wrong.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }


    notifyListeners();
  }


}
