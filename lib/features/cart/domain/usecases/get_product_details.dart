import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/cart/data/data.dart';

class GetProductDetails {
  const GetProductDetails({required this.datasource});

  final CartRemoteDatasource datasource;

  Future<Result<ProductResponse, Exception>> call({required int id}) async {
    final result = await datasource.getProductDetails(id);
    return result;
  }
}
