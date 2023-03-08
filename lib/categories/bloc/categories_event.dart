part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {
  const CategoriesEvent();
}

@immutable
class FetchCategoriesEvent extends CategoriesEvent {}

@immutable
class DeleteCategoryByIdEvent extends CategoriesEvent {
  final int id;
  const DeleteCategoryByIdEvent({required this.id});
}
