import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../apis/categories_api_provider.dart';
import '../../apis/delete_category_provider.dart';
import '../model/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitialState()) {
    CategoriesAPIProvider apiProvider = CategoriesAPIProvider();
    DeleteCategoriesAPIProvider deleteCategoriesAPIProvider =
        DeleteCategoriesAPIProvider();
    // on<DeleteCategoryByIdEvent>((event, emit) async {
    //   await deleteCategoriesAPIProvider.deleteCategory(event.id);
    // });
    on<CategoriesEvent>((event, emit) async {
      emit.call(CategoriesLoadingState());
      try {
        if (event is FetchCategoriesEvent) {
          List<Categories> categoriesList = await apiProvider.fetchCategories();
          if (categoriesList.isEmpty) {
            emit.call(CategoriesEmptyState());
          } else {
            emit.call(CategoriesLoadedState(categoriesList: categoriesList));
          }
        } else if (event is DeleteCategoryByIdEvent) {
          String status =
              await deleteCategoriesAPIProvider.deleteCategory(event.id);
          List<Categories> categoriesList = await apiProvider.fetchCategories();
          emit.call(CategoryDeletedState(
              categoriesList: categoriesList, status: status));
        }
      } on Exception catch (e) {
        print(e.toString());
        emit.call(
            const CategoriesErrorState(errorMessage: "Something went wrong"));
      }
    });
  }
}
