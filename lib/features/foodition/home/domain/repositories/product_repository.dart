import 'package:fpdart/fpdart.dart';

import '../models/models.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, bool>> addFavourite(String productId);
  Future<Either<String, bool>> deleteFavourite(String productId);
}
