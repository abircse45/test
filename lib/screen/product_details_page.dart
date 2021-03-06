
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {

  final String ? name;
  final String ? image;
  final String ? sku;

  const ProductDetailsPage({Key? key, this.name, this.image, this.sku}) : super(key: key);



  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("${widget.name}",style: TextStyle(fontSize: 17,color: Colors.black),),



      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  Image.network("${widget.image}",height: 200,width: double.infinity,fit: BoxFit.cover,),
            widget.image!=null ?   Image.network(
              "${widget.image}",
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ) : Image.asset("assets/images/noimage.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("${widget.name}",style: TextStyle(fontSize: 17,color: Colors.black),),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("${widget.sku}",style: TextStyle(fontSize: 17,color: Colors.black),),
            ),



          ],
        ),
      ),
    );
  }
}
