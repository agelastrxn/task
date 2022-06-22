part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure(this.message);
}

class SearchSuccess extends SearchState {
  final List<ProductsModel> products;

  const SearchSuccess(this.products);

  @override
  List<Object> get props => [products];
}
