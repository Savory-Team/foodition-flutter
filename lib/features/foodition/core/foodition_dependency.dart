import '../../../core/injection/injector.dart';
import '../../../core/networking/api_client.dart';
import '../home/data/datasources/datasources.dart';
import '../home/data/repositories/repositories.dart';
import '../home/domain/repositories/repositories.dart';
import '../home/presentation/managers/managers.dart';

class FooditionDepedency {
  const FooditionDepedency._();

  static void init() {
    /// [STATE_MANAGEMENT]
    locator.registerFactory(() => MlBloc(locator()));
    locator.registerFactory(() => ProductBloc(locator()));

    /// [REPOSITORY]
    locator
        .registerLazySingleton<MlRepository>(() => MlRepositoryImpl(locator()));
    locator.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(locator()));

    /// [DATASOURCE]
    locator.registerLazySingleton<MlRemoteDatasource>(() => MlRemoteDatasource(
        ApiClient(baseUrl: baseUrlML, useToken: true).instance));
    locator.registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDatasource(ApiClient(useToken: true).instance));
  }
}
