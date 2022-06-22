part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryInProgress extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String message;

  const CategoryFailure(this.message);
}

class CategorySuccess extends CategoryState {
  final List<ProductsModel> products;

  const CategorySuccess(this.products);

  @override
  List<Object> get props => [products];
}
