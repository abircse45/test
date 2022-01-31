import 'package:demo/controller/auth_controller.dart';
import 'package:demo/screen/home_page.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:    Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Advance Pro",
                style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: "Username",
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            Consumer<AuthController>(builder: (_,authLogin,child){
              return   InkWell(
                onTap: (){

                  authLogin.loginData(userNameController.text, passwordController.text,);

                  Navigator.push(context, MaterialPageRoute(builder: (_)=> Homepage()));

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),

                      color: Colors.blue,
                    ),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(15.0),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            })
            ],
          ),
        ),
      ),



    );
  }
}
