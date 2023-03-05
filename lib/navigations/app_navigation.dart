import 'package:flutter/material.dart';
import 'package:flutter_bloc_implementation/categories/view/categories_view.dart';

import '../categoriyProduct/view/category_products_view.dart';

class AppNavigation {
  static Route<dynamic>? buildPage(RouteSettings settings) {
    switch (settings.name) {
      case CategoriesPage.pageName:
        return MaterialPageRoute(
          builder: (context) => const CategoriesPage(),
          settings: settings,
        );
      case CategoryProductsPage.pageName:
        return MaterialPageRoute(
          builder: (context) => const CategoryProductsPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const CategoriesPage(),
        );
    }
  }
}
