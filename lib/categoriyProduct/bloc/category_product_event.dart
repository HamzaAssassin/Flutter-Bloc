part of 'category_product_bloc.dart';

@immutable
abstract class CategoryProductEvent {
  const CategoryProductEvent();
}

@immutable
class FetchCategoryByIdEvent extends CategoryProductEvent {
  final int id;
  const FetchCategoryByIdEvent({required this.id});
}
