import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product_details_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ProductDetailsModel? productDetailsModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 100), (){
      this.getApi();
    });
  }

  void getApi() async{
    ProgressHud.showLoading(text: "Loading...");
    var url = Uri.parse('http://3.1.180.10/api/product-core/suzuki-gsx-r150-fi-dual-channel-abs-yvj2/0/');
    Response response = await get(url);
    ProgressHud.dismiss();
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        productDetailsModel = ProductDetailsModel.fromJSON(data);
      });
    }
    else {
      Alert(
        context: context,
        title: "Error!",
        desc: "Error in fetching product details from api!",
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black

        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 01.0, right: 190.0, top: 20.0, bottom: 20.0),
          child: Text("Product Details",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              )
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: productDetailsModel == null ? Center(child: Text("Data is not loaded correctly."),) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: productDetailsModel?.image ?? "",
            height: 482.0,
            placeholder: (context, url) => Image.asset("assets/images/bike.png"),),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(productDetailsModel?.product_name ?? "",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20.0,),
                Text("BDT " + (productDetailsModel?.product_price ?? 0).toString(),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red,
                    )
                ),
                SizedBox(width: 20.0,),
                Text(" BDT 2,000,000",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey,
                    )
                ),
                SizedBox(width: 20.0,),
                Container(
                  height: 24.0,
                  width: 64.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Text("50% Off",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 200.0,
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/star.png"),
                  Image.asset("assets/images/star.png"),
                  Image.asset("assets/images/star.png"),
                  Image.asset("assets/images/star.png"),
                  Image.asset("assets/images/star.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
              child: Text("Select Color",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){

                }, child: Text("black",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,

             ),
         ),  style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: Color.fromRGBO(36, 36, 36, 1.0),
            ),
          ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
      ),
    ),
                ElevatedButton(onPressed: (){}, child: Text("yellow",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                ), style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                      color: Color.fromRGBO(242, 201, 76, 1.0),
                    ),
                  ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)
                ),
                ),
                ElevatedButton(onPressed: (){}, child: Text("Red",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,

                ),
                ), style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Color.fromRGBO(221, 57, 53, 1.0),
                      ),
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                ),

                ElevatedButton(onPressed: (){}, child: Text("Blue",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.blue,

                ),
                ), style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Color.fromRGBO(47, 128, 237, 1.0),
                      ),
                    ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
              child: Text("Delivery Information",
                  style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ) ),

            ),
            Row(
              children: [
                SizedBox(width: 20.0,),
                Icon(Icons.car_rental),
                SizedBox(width: 12.0,),
                Text("Sent from Dhaka, will arrive in 7/10 workdays",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black,
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
              child: Text("Payment Method (Supported)",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 12.0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Colors.green,),
                      Text("Bkash",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cancel, color: Colors.red,),
                      Text("Cash on Delivery not available",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Colors.green,),
                      Text("Bkash",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Colors.green,),
                      Text("Bkash",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Colors.green,),
                      Text("Bkash",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Descripton",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("●",
                              style: TextStyle(fontSize: 20.0, color: Colors.grey),),
                            SizedBox(width: 8.0,),
                            Text("Soft-touch Jersey",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.grey,
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                        SizedBox(width: 8.0,),
                        Text("Lose Fabric",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),
                          ],
                        ),
              Row(
                children: [
                  Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                  SizedBox(width: 8.0,),
                        Text("High Sensitive",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),
                        ],
              ),
              Row(
                children: [
                  Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                  SizedBox(width: 8.0,),
                        Text("Soft-touch Jersey",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),
                        ],
              ),
              Row(
                children: [
                  Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                  SizedBox(width: 8.0,),
                        Text("Lose Fabric",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),
                        ],
              ),
              Row(
                children: [
                  Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                  SizedBox(width: 8.0,),
                        Text("High Sensitive",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey,
                            )
                        ),
                  ],
              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Text("Additional Information",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      )
                  ),
                  SizedBox(height: 12.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Text("●",style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                            SizedBox(width: 8.0,),
                            Text("Size: L,M,S,XL",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.grey,
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("●", style: TextStyle(fontSize: 20.0,color: Colors.grey),),
                            SizedBox(width: 8.0,),
                            Text("Colors: Black,Blue,Red",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.grey,
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}
