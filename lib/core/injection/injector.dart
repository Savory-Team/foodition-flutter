import 'package:get_it/get_it.dart';

import '../../features/auth/core/core_class.dart';
import '../../features/foodition/core/core_class.dart';
import '../db/db.dart';

final GetIt locator = GetIt.instance;

void init() {
  Auth.injection();
  Foodition.injection();

  locator.registerLazySingleton<UserDB>(() => UserDB(locator()));
  locator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());
}
