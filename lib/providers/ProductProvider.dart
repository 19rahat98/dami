import 'package:dami/api/api.dart';
import 'package:dami/models/products.dart';
import 'package:dami/utils/Response.dart';
import 'file:///C:/Users/Rahat/AndroidStudioProjects/dami/lib/models/catalogs.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  int productId = 4;
  bool _initialized = false;

  List<Products> _listCatalogs = List<Products>();
  String _listCatalogsApiMore;

  ApiService apiService;

  bool get initialized => _initialized;
  List<Products> get listCatalogs => _listCatalogs;

  String get listCatalogsApiMore => _listCatalogsApiMore;

  void setIdProduct(int currentId) {
    productId = currentId;
    print(productId);
  }


  ProductProvider() {
    this.apiService = ApiService();

    init();
  }
  void init() async {
    try {
      ProductsResponse openCatalogsResponse = await apiService.getProducts(productId);
      _initialized = true;
      _listCatalogs = openCatalogsResponse.products;


      notifyListeners();
    }
    catch (Exception) {
      print(Exception);
    }
  }

}


