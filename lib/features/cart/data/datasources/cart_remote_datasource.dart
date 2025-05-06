import 'package:dio/dio.dart';
import 'package:simple_commerce/core/core.dart';

import 'package:simple_commerce/features/cart/data/data.dart';

abstract class CartRemoteDatasource {
  Future<Result<List<AllCartResponse>, Exception>> getAllCarts();
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
}
