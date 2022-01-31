import 'package:demo/api/bas_url.dart';
import 'package:demo/model/login_model.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class AuthController extends ChangeNotifier {


  var loader = false;

  Future<LoginModel?> loginData(
      String userName, String password) async {
    LoginModel? loginModel;
    final response = await http.post(
      Uri.parse("${ApiServices.BASE_URl}Authenticate/login"),
      body: {
        "username": userName,
        "password": password,
        "twoFactorCode": "ddd",
      },
      headers: {
        "Content-Type" : "application/json"
      },
    );
    print("RESPONSE11 __${response.body}");


      loginModel = loginModelFromJson(response.body);
      print("RESPONSE22 __${response.body}");
      print("RESPONSE 44__${loginModel}");
      if (loginModel.successResonse?.token!= null) {


        MyPrefs.setAuthCode(loginModel.successResonse!.token!);
        notifyListeners();



      } else {
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
