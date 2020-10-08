import 'dart:io';

import 'package:dami/pages/test.dart';
import 'package:dami/widget/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
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
                  Container(
                    width: 330.0,
                    height: 160.0,
                    margin: EdgeInsets.only(top: 20.0),
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15.0, left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Фастфуд:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_box,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1500 ₸',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 73,
                          ),
                          Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0)),
                                  child: Image(
                                    image: AssetImage('assets/burger.jpg'),
                                    fit: BoxFit.fill,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 330.0,
                    height: 160.0,
                    margin: EdgeInsets.only(top: 20.0),
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15.0, left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Фастфуд:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                    child: Text(
                                        'Отварная говядина, кусок оленины, яйцо, соленые огурчики, зеленый горошек')),
                                SizedBox(height: 10.0,),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_box,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1500 ₸',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0)),
                                  child: Image(
                                    image: AssetImage('assets/burger.jpg'),
                                    fit: BoxFit.fill,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class FlexibleSpaceWidget extends StatelessWidget {
  const FlexibleSpaceWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      //height: 1000,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 100.0,
            //height: 20.0,
            child: FlatButton(
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Salats',
                style: TextStyle(
                    color: Color(0xff750498),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                  color: Color(0xff750498),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 120.0,
            child: FlatButton(
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Salat',
                style: TextStyle(
                    color: Color(0xff750498),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                  color: Color(0xff750498),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 120.0,
            child: FlatButton(
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Salat',
                style: TextStyle(
                    color: Color(0xff750498),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                  color: Color(0xff750498),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 120.0,
            child: FlatButton(
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Salat',
                style: TextStyle(
                    color: Color(0xff750498),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(
                  color: Color(0xff750498),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
