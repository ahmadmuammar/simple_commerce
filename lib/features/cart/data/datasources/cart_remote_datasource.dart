import 'package:dio/dio.dart';
import 'package:simple_commerce/core/core.dart';

import 'package:simple_commerce/features/cart/data/data.dart';

abstract class CartRemoteDatasource {
  Future<Result<List<AllCartResponse>, Exception>> getAllCarts();
  Future<Result<ProductResponse, Exception>> getProductDetails(int id);
}

class CartRemoteDatasourceImpl
    with ErrorHandling
    implements CartRemoteDatasource {
  CartRemoteDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<Result<List<AllCartResponse>, Exception>> getAllCarts() async {
    try {
      final response = await dio.get(
        'https://fakestoreapi.com/carts',
        data: {},
        options: Options(validateStatus: (status) => true),
      );
      if (response.statusCode != 200) {
        return Failure<List<AllCartResponse>, Exception>(
          Exception(response.data),
        );
      }
      final dataList = <AllCartResponse>[];
      for (final json in response.data as List<dynamic>) {
        dataList.add(AllCartResponse.fromJson(json as Map<String, dynamic>));
      }
      return Success<List<AllCartResponse>, Exception>(
        dataList,
      );
    } on Exception catch (e) {
      return handleException<List<AllCartResponse>>(e);
    }
  }

  @override
  Future<Result<ProductResponse, Exception>> getProductDetails(int id) async {
    try {
      final response = await dio.get(
        'https://fakestoreapi.com/products/$id',
        data: {},
        options: Options(validateStatus: (status) => true),
      );
      if (response.statusCode != 200) {
        return Failure<ProductResponse, Exception>(
          Exception(response.data),
        );
      }
      return Success<ProductResponse, Exception>(
        ProductResponse.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return handleException<ProductResponse>(e);
    }
  }
}
