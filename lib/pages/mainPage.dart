import 'dart:io';

import 'package:dami/pages/first_page.dart';
import 'package:dami/providers/BasketProvider.dart';
import 'package:dami/providers/CatalogsProvider.dart';
import 'package:dami/providers/ProductProvider.dart';
import 'package:dami/widget/FlexSpace.dart';
import 'package:dami/widget/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentId = 0;


  Widget getStatusMessage(String message) {
    return SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
  }

  void addProductBasket(productId) async{
    setState(() {});
    await Provider.of<BasketProvider>(context, listen: false).addProductBasket(productId);
  }


  @override
  Widget build(BuildContext context) {
    final basketsList = Provider.of<BasketProvider>(context);
    final productsList = Provider.of<ProductProvider>(context).listCatalogs;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            flexibleSpace: FlexibleSpaceWidget(),
            elevation: 10.0,
            brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
            centerTitle: true,
            leading: Container(
              padding: EdgeInsets.all(7),
              child: Icon(
                Icons.person,
                size: 32,
                color: Color(0xff750498),
              ),
            ),
            title: Center(
              child: Image.asset(
                "assets/damiLogo.PNG",
                height: 42.0,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Color(0xff750498),
                  ),
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
        body: Column(
                children: [
                  Container(
                    width: 330.0,
                    height: 45.0,
                    margin: EdgeInsets.only(top: 20.0),
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Color(0xff750498),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Container(
                      padding: EdgeInsets.only(left: 30.0, top: 10.0),
                      child: Text(
                        'Салаты',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                       child: ListView.builder(
                            itemCount: productsList.length,
                           scrollDirection: Axis.vertical,
                           shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final productName = productsList[index];
                              return Container (
                                width: 330.0,
                                height: 160.0,
                                margin: EdgeInsets.only ( top: 20.0 ),
                                //color: Colors.blue,
                                decoration: BoxDecoration (
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow (
                                      color: Colors.grey.withOpacity ( 0.5 ),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset (
                                          0, 3 ), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular ( 12 ),
                                ),
                                child: InkWell (
                                  onTap: () {
                                    showAlertDialog ( context );
                                    addProductBasket(productName.id);
                                    basketsList.init();
                                  },
                                  child: Row (
                                    //mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container (
                                        margin: EdgeInsets.only (
                                            top: 15.0, left: 15.0 ),
                                        child: Column (
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Text (
                                              productName.title,
                                              style: TextStyle (
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0 ),
                                            ),
                                            SizedBox (
                                              height: 10,
                                            ),
                                            Row (
                                              children: [
                                                Icon (
                                                  Icons.add_box,
                                                  color: Colors.purple,
                                                ),
                                                SizedBox (
                                                  width: 10,
                                                ),
                                                Text (
                                                  '${productName.price} ₸',
                                                  style: TextStyle (
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 18.0 ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox (
                                        width: 73,
                                      ),
                                      Container (
                                          child: ClipRRect (
                                              borderRadius: BorderRadius.only (
                                                  bottomRight: const Radius
                                                      .circular( 10.0 ),
                                                  topRight: const Radius.circular(
                                                      10.0 ) ),
                                              child: Image (
                                                image: NetworkImage (
                                                    productName.images ),
                                                fit: BoxFit.fill,
                                              ) ) ),
                                    ],
                                  ),
                                ),

                              );

                            }
                  ),
                     ),
                ],
              ),
          ),

    );
  }
}
