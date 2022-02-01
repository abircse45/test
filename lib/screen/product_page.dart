import 'package:demo/screen/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/product_controller.dart';

class ProductPage extends StatefulWidget {
  final String ? searchData;

  const ProductPage({Key? key, this.searchData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {


    final fetchData =  Provider.of<ProductListController>(context,listen: false);
    fetchData.fetchProductList();
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [

        SizedBox(height: 10,),
        Column(
          children: [
            Divider(thickness: 2,),
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

                    if(widget.searchData== "" || widget.searchData==null){
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
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ) : Image.asset("assets/images/noimage.jpg",  height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                "${dataList.name}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8,top: 8),
                                              child: Text(
                                                "${dataList.sku}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 0,top: 5,bottom: 5),

                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8,top: 0),
                                                    child: Text(
                                                      " Available                ${dataList.availableQuantity}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                      if(dataList.name!.toLowerCase().contains(widget.searchData!.toLowerCase())){
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
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ) : Image.asset("assets/images/noimage.jpg",  height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Text(
                                                  "${dataList.name}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8,top: 8),
                                                child: Text(
                                                  "${dataList.sku}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0,top: 5,bottom: 5),

                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8,top: 0),
                                                      child: Text(
                                                        " Available                ${dataList.availableQuantity}",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
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
                    child: CircularProgressIndicator(color: Colors.blue,)
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
