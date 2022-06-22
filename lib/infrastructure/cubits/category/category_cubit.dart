import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/infrastructure/exceptions/http_exceptions.dart';
import 'package:task/infrastructure/init.dart';
import 'package:task/infrastructure/models/products.dart';
import 'package:task/infrastructure/repositories/products_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  ProductsRepo productsRepo = getIt.get();
  get(String category) async {
    emit(CategoryInProgress());
    try {
      final List<ProductsModel> products =
          await productsRepo.getForCategory(category);
      emit(CategorySuccess(products));
    } on HttpException catch (e) {
      emit(CategoryFailure(e.message));
    }
  }
}
