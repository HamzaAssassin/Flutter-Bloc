part of 'category_product_bloc.dart';

@immutable
abstract class CategoryProductState extends Equatable {
  const CategoryProductState();

  @override
  List<Object> get props => [];
}

class CategoryProductInitialState extends CategoryProductState {}

@immutable
class CategoryProductLoadingState extends CategoryProductState {}

@immutable
class CategoryProductEmptyState extends CategoryProductState {
  // final String categoryName;
  // const CategoryProductEmptyState({required this.categoryName});
}

@immutable
class CategoryProductLoadedState extends CategoryProductState {
  final List<Product> categoryProductList;
  const CategoryProductLoadedState({required this.categoryProductList});

  @override
  List<Object> get props => [categoryProductList];
}

@immutable
class CategoryProductErrorState extends CategoryProductState {
  final String errorMessage;
  const CategoryProductErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
