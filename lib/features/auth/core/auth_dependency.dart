import '../../../core/injection/injector.dart';
import '../../../core/networking/api_client.dart';
import '../data/datasources/datasources.dart';
import '../data/repositories/repositories.dart';
import '../domain/repositories/repositories.dart';
import '../presentation/managers/managers.dart';

class AuthDepedency {
  const AuthDepedency._();

  static void init() {
    /// [STATE_MANAGEMENT]
    locator.registerFactory(() => AuthBloc(locator()));

    /// [REPOSITORY]
    locator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(locator(), locator()));

    /// [DATASOURCE]
    locator.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasource(ApiClient().instance));
  }
}
