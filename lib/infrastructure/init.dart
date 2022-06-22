import 'package:get_it/get_it.dart';
import 'package:task/infrastructure/repositories/products_impl.dart';
import 'package:task/infrastructure/repositories/products_repo.dart';
import 'package:task/infrastructure/services/api_service.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static register() {
    getIt.registerSingleton(ApiService());
    getIt.registerFactory<ProductsRepo>(() => ProductsImpl(getIt.get()));
  }
}
