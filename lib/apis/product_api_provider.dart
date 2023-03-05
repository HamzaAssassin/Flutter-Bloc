import 'package:flutter_bloc_implementation/categoriyProduct/model/product.dart';

import 'api_provider.dart';

class ProductAPIProvider extends APIProvider {
  @override
  String get apiUrl => '/api/FoodProduct/PublicGetProductListByCategoryId';

  static ProductAPIProvider? _instance;
  List<Product> productList = [];

  ProductAPIProvider._internal();
  factory ProductAPIProvider() {
    return _instance ??= ProductAPIProvider._internal();
  }

  Future<List<Product>> fetchProducts(int id) async {
    var result = await fetch(endPoint: '?CategoryId=$id') as List;
    productList = result.map((e) => Product.fromMap(e)).toList();
    return productList;
  }
}
