import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/cart/data/data.dart';

class GetAllCarts {
  const GetAllCarts({required this.datasource});

  final CartRemoteDatasource datasource;

  Future<Result<List<AllCartResponse>, Exception>> call() async {
    final result = await datasource.getAllCarts();
    return result;
  }
}
