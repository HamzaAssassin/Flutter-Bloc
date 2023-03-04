part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

@immutable
class CategoriesInitialState extends CategoriesState {}

@immutable
class CategoriesLoadingState extends CategoriesState {}

@immutable
class CategoriesEmptyState extends CategoriesState {}

@immutable
class CategoriesLoadedState extends CategoriesState {
  final List<Categories> categoriesList;
  const CategoriesLoadedState({required this.categoriesList});

  @override
  List<Object> get props => [categoriesList];
}

@immutable
class CategoriesErrorState extends CategoriesState {
  final String errorMessage;
  const CategoriesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
