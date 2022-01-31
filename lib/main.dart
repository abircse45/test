import 'package:demo/controller/product_controller.dart';
import 'package:demo/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_)=> AuthController()),
        ChangeNotifierProvider<ProductListController>(create: (_)=> ProductListController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  LoginScreen(),
      ),

    );
  }
}
