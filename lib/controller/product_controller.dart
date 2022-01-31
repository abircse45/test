import 'package:demo/api/bas_url.dart';
import 'package:demo/model/product_list_model.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListController extends ChangeNotifier {
  var productListController = ProductListModel();

  String? token;

  Future<ProductListModel?> fetchProductList() async {
    MyPrefs.getAuthCode().then((value) {
      token = value;
      print("TOKEN __$value");
    });

    var response = await http.get(
      Uri.parse(
        "${ApiServices.BASE_URl}products",
      ),
        headers: {
        'Authorization': 'Bearer' + token.toString(),
          "Content-Type": "application/json",
        }
    );
    if (response.statusCode == 200) {
      productListController = productListModelFromJson(response.body);

      print("Response ___${productListController}");
      print("Response ___${response.body}");
      notifyListeners();
    } else {
      return null;
    }
    notifyListeners();
    return productListController;
  }

}
