import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_commerce/features/authentication/data/data.dart';
import 'package:simple_commerce/features/authentication/domain/domain.dart';
import 'package:simple_commerce/features/authentication/presentation/presentation.dart';
import 'package:simple_commerce/features/cart/data/data.dart';
import 'package:simple_commerce/features/cart/domain/domain.dart';
import 'package:simple_commerce/features/cart/presentation/presentation.dart';

import '../core.dart';

final di = GetIt.instance;

void init() {
  di

    // Remote Datasources
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(
        dio: di(),
      ),
    )
    ..registerLazySingleton<CartRemoteDatasource>(
      () => CartRemoteDatasourceImpl(
        dio: di(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => Login(
        datasource: di(),
      ),
    )
    ..registerFactory(
      () => GetAllCarts(
        datasource: di(),
      ),
    )
    ..registerFactory(
      () => GetProductDetails(
        datasource: di(),
      ),
    )

    // Blocs
    ..registerFactory(
      () => AuthBloc(
        login: di(),
      ),
    )
    ..registerFactory(
      () => CartBloc(
        getAllCarts: di(),
        getProductDetails: di(),
      ),
    )

    // Others
    ..registerLazySingleton(() {
      final options = BaseOptions(
        connectTimeout: const Duration(seconds: 60), //20 seconds
        receiveTimeout: const Duration(seconds: 60),
      );
      final dio = Dio(options);
      dio.interceptors.addAll([
        DioLoggingInterceptor(),
      ]);

      return dio;
    });
}
