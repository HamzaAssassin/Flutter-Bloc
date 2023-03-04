import 'package:flutter_bloc_implementation/apis/api_provider.dart';

import '../categories/model/categories.dart';

class CategoriesAPIProvider extends APIProvider {
  @override
  String get apiUrl => '/api/FoodDelivery/PublicGetListCategory';
  static CategoriesAPIProvider? _instance;
  late List<Categories> categoriesList = [];

  CategoriesAPIProvider._internal();
  factory CategoriesAPIProvider() {
    return _instance ??= CategoriesAPIProvider._internal();
  }

  Future<List<Categories>> fetchCategories() async {
    var result = await fetch() as List;
    categoriesList = result.map((e) => Categories.fromMap(e)).toList();
    return categoriesList;
  }
}
