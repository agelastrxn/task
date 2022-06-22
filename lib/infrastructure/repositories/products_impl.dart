import 'package:task/infrastructure/models/products.dart';
import 'package:task/infrastructure/repositories/products_repo.dart';
import 'package:task/infrastructure/services/api_service.dart';

class ProductsImpl implements ProductsRepo {
  final ApiService apiService;
  ProductsImpl(this.apiService);

  @override
  Future<List<ProductsModel>> getAll() async {
    return await apiService.getAllProdcuts();
  }

  @override
  Future<List<ProductsModel>> getForCategory(category) async {
    return await apiService.getForCategory(category);
  }
}
