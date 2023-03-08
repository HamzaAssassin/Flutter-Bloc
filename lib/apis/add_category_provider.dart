import 'api_provider.dart';

class AddCategoryAPIProvider extends APIProvider {
  @override
  String get apiUrl => '/api/FoodDelivery/PublicInsertCategory';

  static AddCategoryAPIProvider? _instance;

  AddCategoryAPIProvider._internal();
  factory AddCategoryAPIProvider() {
    return _instance ??= AddCategoryAPIProvider._internal();
  }

  Future<bool> addCategory(String title) async {
    bool isAdded = await post(title: title) as bool;

    // String status = body.entries.first.value as String;
    return isAdded;
  }
}
