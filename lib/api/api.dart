import 'dart:convert';
import 'dart:io';

import 'package:dami/models/basketProducts.dart';
import 'package:dami/models/products.dart';
import 'package:dami/utils/Exceptions.dart';
import 'package:dami/utils/Response.dart';
import 'file:///C:/Users/Rahat/AndroidStudioProjects/dami/lib/models/catalogs.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiService{
  String token;

  //List<Catalogs> _listOfCatalogs = List<Catalogs>();

  final String api = 'https://manapolise.a-lux.dev/api/';
  final String api2 = 'https://cicada.kz/api/catalogs/';

  void validateResponseStatus(int status, int validStatus) {
    if (status == 401) {
      throw new ResquestsException( "401", "Unauthorized" );
    }

    if (status != validStatus) {
      throw new ApiException( status.toString(), "API Error" );
    }
  }

  Future<CatalogsResponse> getCatalogs(String status,  {String url = '' }) async {
/*    if ('' == url) {
      //print('url null');
      url = "$api?status=$status";
    }*/
    url = api + status;
    //print('my url is $url');
    final response = await http.get (
        url
      /*headers: {
        "Accept": "application/json"});
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },*/
    );

    validateResponseStatus ( response.statusCode, 200 );

    Map<String, dynamic> apiResponse = json.decode ( response.body );
    List<dynamic> data = apiResponse['data'];

      //String next = apiResponse['name']['id'];
      List<Catalogs> todos = todoFromJson ( json.encode ( data ) );

    return CatalogsResponse (todos);
  }

  Future<ProductsResponse> getProducts(int catalogId,  {String url = '' }) async {

    url = api2 + catalogId.toString() + '/products';
    final response = await http.get (
        url
      /*headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },*/
    );

    validateResponseStatus ( response.statusCode, 200 );

    Map<String, dynamic> apiResponse = json.decode ( response.body );
    List<dynamic> data = apiResponse['data'];

    //String next = apiResponse['name']['id'];
    List<Products> todos = productFromJson(json.encode (data));

    //addBasket();
    return ProductsResponse (todos);
  }


  Future<void> getToken() async {

    String url = 'https://cicada.kz/api/_token';
    final response = await http.get (
        url
    );

    validateResponseStatus ( response.statusCode, 200 );

    Map<String, dynamic>apiResponse = json.decode ( response.body );
    Map<String, dynamic> data = apiResponse['data'];
    token = data['token'];

  }


  Future<BasketResponse> addBaskets() async {
    String url = 'https://cicada.kz/api/basket/add';
    getToken();
    print('massage');
    Map<String, String> body = {
      "id": "sad",
      "amount": 'asd',
    };
    final response = await http.post (
      url,
      body: body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token.toString()}"
      },
    );
    //print('statusCode: ${response.statusCode} addBasket');
    validateResponseStatus ( response.statusCode, 200 );

    Map<String, dynamic> apiResponse = json.decode ( response.body );
    List< dynamic>  data = apiResponse['data'];
    List<Baskets> basketProducts;
    for(int i = 0; i < 1; i++){
      basketProducts = basketsFromJson ( json.encode ( data[i][i] ) );
    }

    for(int i = 0; i < data.length; i ++) print(data);

    return BasketResponse (basketProducts);
  }

}


