part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

@immutable
class FetchCategoriesEvent extends CategoriesEvent {}
