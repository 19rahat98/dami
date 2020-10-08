import 'file:///C:/Users/Rahat/AndroidStudioProjects/dami/lib/models/catalogs.dart';
import 'package:dami/models/basketProducts.dart';
import 'package:dami/models/products.dart';

class CatalogsResponse {
  List<Catalogs> catalogs;
  CatalogsResponse(this.catalogs);
}

class ProductsResponse {
  List<Products> products;
  ProductsResponse(this.products);
}

class BasketResponse {
  List<Baskets> products;
  BasketResponse(this.products);
}