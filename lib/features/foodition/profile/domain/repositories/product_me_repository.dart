import 'package:fpdart/fpdart.dart';

import '../../../home/domain/models/models.dart';
import '../../data/models/request/requests.dart';

abstract class ProductMeRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, bool>> addProduct(ProductRequest request);
}
