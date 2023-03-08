import 'api_provider.dart';

class DeleteCategoriesAPIProvider extends APIProvider {
  @override
  String get apiUrl => '/api/FoodDelivery/PublicDeleteCategory';

  static DeleteCategoriesAPIProvider? _instance;

  DeleteCategoriesAPIProvider._internal();
  factory DeleteCategoriesAPIProvider() {
    return _instance ??= DeleteCategoriesAPIProvider._internal();
  }

  Future<String> deleteCategory(int id) async {
    var body = await delete(id: 34) as Map<String, dynamic>;

    String status = body.entries.first.value as String;

     
    return status;
  }
}
