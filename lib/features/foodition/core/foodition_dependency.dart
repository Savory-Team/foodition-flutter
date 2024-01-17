import '../../../core/injection/injector.dart';
import '../../../core/networking/api_client.dart';
import '../home/data/datasources/datasources.dart';
import '../home/data/repositories/repositories.dart';
import '../home/domain/repositories/repositories.dart';
import '../home/presentation/managers/managers.dart';
import '../profile/data/datasources/datasources.dart';
import '../profile/data/repositories/repositories.dart';
import '../profile/domain/repositories/repositories.dart';
import '../profile/presentation/managers/managers.dart';

class FooditionDepedency {
  const FooditionDepedency._();

  static void init() {
    /// [STATE_MANAGEMENT]
    locator.registerFactory(() => MlBloc(locator()));
    locator.registerFactory(() => ProductBloc(locator()));
    locator.registerFactory(() => TransactionBloc(locator()));
    locator.registerFactory(() => UserBloc(locator()));
    locator.registerFactory(() => RestoBloc(locator()));
    locator.registerFactory(() => ProductMeBloc(locator()));

    /// [REPOSITORY]
    locator
        .registerLazySingleton<MlRepository>(() => MlRepositoryImpl(locator()));
    locator.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(locator()));
    locator.registerLazySingleton<TransactionRepository>(
        () => TransactionRepositoryImpl(locator()));
    locator.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(locator()));
    locator.registerLazySingleton<RestoRepository>(
        () => RestoRepositoryImpl(locator()));
    locator.registerLazySingleton<ProductMeRepository>(
        () => ProductMeRepositoryImpl(locator()));

    /// [DATASOURCE]
    locator.registerLazySingleton<MlRemoteDatasource>(() => MlRemoteDatasource(
        ApiClient(baseUrl: baseUrlML, useToken: true).instance));
    locator.registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDatasource(ApiClient(useToken: true).instance));
    locator.registerLazySingleton<TransactionRemoteDatasource>(
        () => TransactionRemoteDatasource(ApiClient(useToken: true).instance));
    locator.registerLazySingleton<UserRemoteDatasource>(
        () => UserRemoteDatasource(ApiClient(useToken: true).instance));
    locator.registerLazySingleton<RestoRemoteDatasource>(
        () => RestoRemoteDatasource(ApiClient(useToken: true).instance));
    locator.registerLazySingleton<ProductMeRemoteDatasource>(
        () => ProductMeRemoteDatasource(ApiClient(useToken: true).instance));
  }
}
