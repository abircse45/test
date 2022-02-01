import 'package:demo/api/bas_url.dart';
import 'package:demo/model/product_list_model.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListController with ChangeNotifier {
  var productListController = ProductListModel();

  String? token;

  Future<ProductListModel?> fetchProductList() async {
  await  MyPrefs.getAuthCode().then((value) {
      token = value;
      print("TOKEN __$value");
      notifyListeners();
    });
    Map<String, String> headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    var response = await http.get(
      Uri.parse(
        "${ApiServices.BASE_URl}products",
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      notifyListeners();

      productListController = productListModelFromJson(response.body);
    } else {
      return null;
    }
notifyListeners();
    return productListController;
  }
}
