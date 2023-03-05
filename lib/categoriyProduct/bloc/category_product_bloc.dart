import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/categoriyProduct/model/product.dart';
import '../../apis/product_api_provider.dart';
part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  CategoryProductBloc() : super(CategoryProductInitialState()) {
    ProductAPIProvider apiProvider = ProductAPIProvider();
    on<FetchCategoryByIdEvent>((event, emit) async {
      emit.call(CategoryProductLoadingState());
      try {
        List<Product> productList = await apiProvider.fetchProducts(event.id);
        if (productList.isEmpty) {
          emit.call(CategoryProductEmptyState());
        } else {
          emit.call(
              CategoryProductLoadedState(categoryProductList: productList));
        }
      } catch (e) {
        print("llllllllllllllllllll");
        print(e.toString());
        emit.call(const CategoryProductErrorState(
            errorMessage: "Something went wrong"));
        ;
      }
    });
  }
}
