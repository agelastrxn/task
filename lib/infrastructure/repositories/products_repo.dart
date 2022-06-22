import 'package:task/infrastructure/models/products.dart';

abstract class ProductsRepo {
  Future<List<ProductsModel>> getAll();
  Future<List<ProductsModel>> getForCategory(category);
}
