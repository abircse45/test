import 'package:demo/controller/product_controller.dart';
import 'package:demo/model/product_list_model.dart';
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
  String? token;
  String? searchData;
  

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductListController>(context, listen: false)
        .fetchProductList();



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
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchData = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search Product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Consumer<ProductListController>(builder: (_, data, child) {
              return data.productListController.payload != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: data.productListController.payload!.length,
                      itemBuilder: (_, index) {
                        var dataList =
                            data.productListController.payload![index];

                        if(searchData== "" || searchData==null){
                          return  InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsPage(
                                name: dataList.name,
                                image: dataList.imageUrl,
                                sku: dataList.sku,
                              )));
                            },
                            child: Card(
                              elevation: 1,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                       dataList.imageUrl!=null ?   Image.network(
                                            "${dataList.imageUrl}",
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ) : Image.asset("assets/images/noimage.jpg",  height: 80,
                                         width: 80,
                                         fit: BoxFit.cover,),
                                          Column(
                                            children: [
                                              Text(
                                                "${dataList.name}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${dataList.sku}",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${dataList.upc.toString()}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${dataList.availableQuantity}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }else {
                          if(dataList.name!.toLowerCase().contains(searchData!.toLowerCase())){
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailsPage(
                                  name: dataList.name,
                                  image: dataList.imageUrl,
                                  sku: dataList.sku,
                                )));
                              },
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                              "${dataList.imageUrl}",
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${dataList.name}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${dataList.sku}",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${dataList.upc.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${dataList.availableQuantity}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }

                        return Container();

                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 228.0),
                      child: Center(
                        child: Text(
                          "No Product Found",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
