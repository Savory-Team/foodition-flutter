import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/core/core_class.dart';
import '../db/db.dart';
import '../networking/api_client.dart';

final GetIt locator = GetIt.instance;

void init() {
  Auth.injection();

  locator.registerLazySingleton<UserDB>(() => UserDB(locator()));
  locator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());
  locator.registerLazySingleton<Dio>(() => ApiClient().instance);
}
