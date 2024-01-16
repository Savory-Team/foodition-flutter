import 'package:fpdart/fpdart.dart';

import '../../domain/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _remoteDatasource;
  ProductRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final result = await _remoteDatasource.getProducts();
      return Right(result.data.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> addFavourite(String productId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, bool>> deleteFavourite(String productId) {
    throw UnimplementedError();
  }
}
