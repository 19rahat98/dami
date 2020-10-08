import 'dart:io';
import 'package:dami/pages/basket_page.dart';
import 'package:dami/pages/first_page.dart';
import 'package:dami/pages/mainPage.dart';
import 'package:dami/pages/test.dart';
import 'package:dami/providers/BasketProvider.dart';
import 'package:dami/providers/CatalogsProvider.dart';
import 'package:dami/providers/ProductProvider.dart';
import 'package:dami/widget/navbar.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Muli',
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              brightness:
                  Platform.isAndroid ? Brightness.dark : Brightness.light,
              textTheme: TextTheme(
                  headline: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      fontFamily: 'Muli')),
            )),
        debugShowCheckedModeBanner: false,
        home: Router());
  }
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final catalogsProvider = Provider.of<CatalogsProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatalogsProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => BasketProvider()),
      ],
      child: NavBar(),
    );
  }
}
