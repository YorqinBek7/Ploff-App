import 'package:dio/dio.dart';
import 'package:ploff/data/models/banners/banners.dart';
import 'package:ploff/data/models/category_with_products/categ_with_product.dart';
import 'package:ploff/data/models/searched_products/searched_products.dart';

import 'package:ploff/utils/constants/const.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<CategProducts>> getMeals() async {
    try {
      Response response = await dio.get(
        "$BASE_URL/v2/category-with-products",
        options: Options(
          headers: {
            "Shipper": "d4b1658f-3271-4973-8591-98a82939a664",
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["categories"] as List?)
                ?.map((data) => CategProducts.fromJson(data))
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<SearchedProducts>> getSearchedProduct(
      {required String searchText}) async {
    try {
      Response response = await dio.get(
        "$BASE_URL/v2/product-non-variant-modifier",
        queryParameters: {"search": searchText},
        options: Options(
          headers: {
            "Shipper": "d4b1658f-3271-4973-8591-98a82939a664",
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["products"] as List?)
                ?.map((data) => SearchedProducts.fromJson(data))
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Banners>> getBanners() async {
    try {
      Response response = await dio.get(
        "$BASE_URL/v1/banner",
        options: Options(
          headers: {
            "Shipper": "d4b1658f-3271-4973-8591-98a82939a664",
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["banners"] as List?)
                ?.map((data) => Banners.fromJson(data))
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
