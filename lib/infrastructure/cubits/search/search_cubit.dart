import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/infrastructure/exceptions/http_exceptions.dart';
import 'package:task/infrastructure/init.dart';
import 'package:task/infrastructure/models/products.dart';
import 'package:task/infrastructure/repositories/products_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  ProductsRepo productsRepo = getIt.get();
  get() async {
    emit(SearchInProgress());
    try {
      final List<ProductsModel> products = await productsRepo.getAll();
      emit(SearchSuccess(products));
    } on HttpException catch (e) {
      emit(SearchFailure(e.message));
    }
  }

  search(String query) async {
    emit(SearchInProgress());
    final List<ProductsModel> products = await productsRepo.getAll();

    List<ProductsModel> foundedProducts =
        products.where((element) => element.title.contains(query)).toList();

    emit(SearchSuccess(foundedProducts));
  }
}
