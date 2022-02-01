import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:demo/component/instock_page.dart';
import 'package:demo/component/out_of_stock.dart';
import 'package:demo/controller/product_controller.dart';
import 'package:demo/model/product_list_model.dart';
import 'package:demo/screen/product_page.dart';
import 'package:demo/screen/product_details_page.dart';
import 'package:demo/utils/save_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  void initState() {

    super.initState();
  }
  String? searchData;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Product",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_open),
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle_outline),
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.refresh),
                  iconSize: 25,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body:
      Column(
        children: [
          SizedBox(height: 10.0,),

          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 28),
            child: Container(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchData = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search Product",
                    contentPadding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
              ),
            ),
          ),
SizedBox(height: 10.0,),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar:  AppBar(
                  toolbarHeight: 10,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  bottom: ButtonsTabBar(
                 //   center: true,
                    buttonMargin: EdgeInsets.only(left: 20),
                    contentPadding: EdgeInsets.only(left: 15,right: 15),
                    radius: 10.0,
                    backgroundColor: Colors.blue,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: "All",

                      ),
                      Tab(
                        text: "In Stock",

                      ),
                      Tab(
                        text: "Out Of Stock",
                      ),

                    ],
                  ),
                ),
                body: TabBarView(children: [
                  ProductPage(searchData: searchData,),
                  InStockPage(searchData: searchData,),
                  OutOfStockPage(searchData: searchData,),

                ]),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
