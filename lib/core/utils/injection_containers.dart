import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core.dart';

final di = GetIt.instance;

void init() {
  di

    // Remote Datasources

    // Usecases

    // Blocs

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
