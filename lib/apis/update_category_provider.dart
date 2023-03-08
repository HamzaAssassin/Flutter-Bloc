import 'package:flutter_bloc_implementation/apis/api_provider.dart';

class UpdateCategoryProvider extends APIProvider {
  @override
  String get apiUrl => "/api/FoodDelivery/PublicUpdateCategory";
  static UpdateCategoryProvider? _instance;

  UpdateCategoryProvider._internal();
  factory UpdateCategoryProvider() {
    return _instance ??= UpdateCategoryProvider._internal();

  }
  Future<bool> updateCategory(String title,int id) async {
    bool isUpdated = await update(title: title,id: id) as bool;

    // String status = body.entries.first.value as String;
    return isUpdated;
  }
}
