import 'package:dami/api/api.dart';
import 'package:dami/models/basketProducts.dart';
import 'package:dami/models/products.dart';
import 'package:dami/utils/Response.dart';
import 'file:///C:/Users/Rahat/AndroidStudioProjects/dami/lib/models/catalogs.dart';
import 'package:flutter/material.dart';

class BasketProvider with ChangeNotifier{
  int baskproductID =25;
  bool _initialized = false;

  List<Baskets> _listProducts = List<Baskets>();
  String _listCatalogsApiMore;

  ApiService apiService;

  bool get initialized => _initialized;
  List<Baskets> get listProducts => _listProducts;





  void addProductBasket(int currentId) {
    baskproductID = currentId;
    print("baskproductID $baskproductID");
  }

  ProductProvider() {
    this.apiService = ApiService();

    init();
  }
  void init() async {
    //print('call init');
    try {
      BasketResponse basketProducts = await apiService.addBaskets();
      _initialized = true;
      _listProducts = basketProducts.products;

      //print(_listCatalogs);

      notifyListeners();
    }
    catch (Exception) {
      print(Exception);
    }
  }

}


