import 'package:fpdart/fpdart.dart';

import '../../../home/domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../models/request/product_request.dart';

class ProductMeRepositoryImpl implements ProductMeRepository {
  final ProductMeRemoteDatasource _remoteDatasource;
  ProductMeRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, bool>> addProduct(ProductRequest request) async {
    try {
      final result = await _remoteDatasource.addProduct(request);
      return Right(result.data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final result = await _remoteDatasource.getProducts();
      return Right(result.data.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
