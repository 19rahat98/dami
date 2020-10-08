import 'package:dami/api/api.dart';
import 'package:dami/utils/Response.dart';
import 'file:///C:/Users/Rahat/AndroidStudioProjects/dami/lib/models/catalogs.dart';
import 'package:flutter/material.dart';

class CatalogsProvider with ChangeNotifier{
  int productId = 4;
  bool _initialized = false;

  List<Catalogs> _listCatalogs = List<Catalogs>();
  String _listCatalogsApiMore;

  ApiService apiService;

  bool get initialized => _initialized;
  List<Catalogs> get listCatalogs => _listCatalogs;

  String get listCatalogsApiMore => _listCatalogsApiMore;

  CatalogsProvider() {
      this.apiService = ApiService();

    init();
  }
  void init() async {
    try {
      CatalogsResponse openCatalogsResponse = await apiService.getCatalogs('catalogs');
      _initialized = true;
      _listCatalogs = openCatalogsResponse.catalogs;

      print(_listCatalogs);
      //_listCatalogsApiMore = openCatalogsResponse.apiMore;


      notifyListeners();
    }
    catch (Exception) {
      print(Exception);
    }
  }

/*  Future<void> loadMore(String activeTab) async {
    // Set apiMore based on the activeTab.
    String apiMore = _listCatalogsApiMore;

    // If there's no more items to load, return early.
    if (apiMore == null) {
      return;
    }

    try {
      // Make the API call to get more todos.
      CatalogsResponse catalogsResponse = await apiService.getCatalogs(activeTab, url: apiMore);

      // Get the current todos for the active tab.
      List<Catalogs> currentTodos = _listCatalogs;

      // Combine current todos with new results from API.
      List<Catalogs> allTodos = [...currentTodos, ...catalogsResponse.catalogs];

      if (activeTab == 'open') {
        _listCatalogs = allTodos;
        _listCatalogsApiMore = catalogsResponse.apiMore;
      }


      notifyListeners();
    }

    catch (Exception) {
      print(Exception);
    }

  }*/


}


