import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../categories/model/categories.dart';
import '../bloc/category_product_bloc.dart';
import '../widgets/Category_products_widget.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key});
  static const pageName = "products";

  @override
  Widget build(BuildContext context) {
    CategoryProductBloc categoriesProductBloc =
        Provider.of<CategoryProductBloc>(context, listen: false);
    Categories categoryName =
        ModalRoute.of(context)!.settings.arguments as Categories;
    categoriesProductBloc
        .add(FetchCategoryByIdEvent(id: categoryName.categoryId));

    return Scaffold(
      body: BlocBuilder<CategoryProductBloc, CategoryProductState>(
        bloc: categoriesProductBloc,
        builder: (context, state) {
          if (state is CategoryProductInitialState) {
            return const SizedBox();
          } else if (state is CategoryProductLoadingState) {
            return const CategoriesProductLoadingUI();
          } else if (state is CategoryProductLoadedState) {
            return CategoryProductLoadedUI(
              productssList: state.categoryProductList,
              categoryName: categoryName.categoryTitle,
            );
          } else if (state is CategoryProductErrorState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
              ));
            });
            return const SizedBox();
          } else if (state is CategoryProductEmptyState) {
            return CategoriesProductEmptyUI(
              categoryName: categoryName.categoryTitle,
            );
          } else {
            return const SizedBox(
              child: Text("Empty"),
            );
          }
        },
      ),
    );
  }
}
