import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/constants/app_config.dart';
import 'package:task/infrastructure/exceptions/http_exceptions.dart';
import 'package:task/infrastructure/models/products.dart';

class ApiService {
  Dio dio = Dio();
  ApiService();

  Future<List<ProductsModel>> getForCategory(String category) async {
    bool network = await InternetConnectionChecker().hasConnection;
    if (!network) {
      throw HttpException('Error: Network');
    }
    try {
      dio.options.contentType = "application/json";
      final response =
          await dio.get("${AppConfigs.baseUrl}products/category/$category");
      if (response.statusCode != 200) {
        throw HttpException("Error: Unknown");
      }
      return (response.data as List)
          .map((x) => ProductsModel.fromJson(x))
          .toList();
    } catch (e) {
      throw HttpException("Error: Unknown");
    }
  }

  Future<List<ProductsModel>> getAllProdcuts() async {
    bool network = await InternetConnectionChecker().hasConnection;
    if (!network) {
      throw HttpException('Error: Network');
    }
    try {
      dio.options.contentType = "application/json";
      final response = await dio.get("${AppConfigs.baseUrl}products/");
      if (response.statusCode != 200) {
        throw HttpException("Error: Unknown");
      }
      return (response.data as List)
          .map((x) => ProductsModel.fromJson(x))
          .toList();
    } catch (e) {
      throw HttpException("Error: Unknown");
    }
  }
}
