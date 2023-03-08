import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../apis/add_category_provider.dart';
import '../../apis/categories_api_provider.dart';
import '../../apis/delete_category_provider.dart';
import '../../apis/update_category_provider.dart';
import '../model/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitialState()) {
    CategoriesAPIProvider apiProvider = CategoriesAPIProvider();
    DeleteCategoriesAPIProvider deleteCategoriesAPIProvider =
        DeleteCategoriesAPIProvider();
    AddCategoryAPIProvider addCategoryAPIProvider = AddCategoryAPIProvider();
    UpdateCategoryProvider updateCategoryProvider = UpdateCategoryProvider();

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
        } else if (event is AddCategoryEvent) {
          bool status = await addCategoryAPIProvider.addCategory(event.title);
          List<Categories> categoriesList = await apiProvider.fetchCategories();
          emit.call(
              CategoryAddState(categoriesList: categoriesList, status: status));
        } else if (event is UpdateCategoryEvent) {
          bool isUpdate = await updateCategoryProvider.updateCategory(
              event.title, event.categoryId);
          List<Categories> categoriesList = await apiProvider.fetchCategories();
          emit.call(CategoryUpdateState(
              categoriesList: categoriesList, isUpdate: isUpdate));
        }
      } on Exception catch (e) {
        emit.call(
            const CategoriesErrorState(errorMessage: "Something went wrong"));
      }
    });
  }
}
