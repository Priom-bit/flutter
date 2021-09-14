import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/details_page.dart';

void main() {
  runApp(
      ProgressHud(
        key: Key("mainprogresshud"),
        isGlobalHud: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Navigation page',
          home: FirstRoute(),
        ),
      )
  );
}

class FirstRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
title: Text("Product Details"),
    ),
      body: Center(
        child: RaisedButton(
          child: Text("Go"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>DetailsPage(key: Key("details_page_key"),) ));
          },

        ),
      ),
    );

  }
  
  }