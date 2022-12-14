import 'package:dio/dio.dart';
import 'package:ploff/data/models/categories/categories.dart';
import 'package:ploff/data/models/products/product.dart';
import 'package:ploff/utils/constants/const.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<Product>> getMeals() async {
    try {
      Response response = await dio.get(
        "$BASE_URL/v1/product",
        options: Options(
          headers: {
            "Shipper": "d4b1658f-3271-4973-8591-98a82939a664",
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["products"] as List?)
                ?.map((data) => Product.fromMap(data))
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Categorie>> getCategories() async {
    try {
      Response response = await dio.get(
        "$BASE_URL/v1/category",
        options: Options(
          headers: {
            "Shipper": "d4b1658f-3271-4973-8591-98a82939a664",
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["categories"] as List?)
                ?.map((data) => Categorie.fromMap(data))
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
