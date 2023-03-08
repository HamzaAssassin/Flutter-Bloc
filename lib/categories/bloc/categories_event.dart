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
@immutable
class AddCategoryEvent extends CategoriesEvent {
  final String title;
  const AddCategoryEvent({required this.title});
}

@immutable
class UpdateCategoryEvent extends CategoriesEvent {
  final String title;
  final int categoryId;
  const UpdateCategoryEvent({required this.title,required this.categoryId});
}
