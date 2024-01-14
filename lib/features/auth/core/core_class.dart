import 'auth_bloc_providers.dart';
import 'auth_dependency.dart';
import 'auth_router.dart';

class Auth {
  const Auth._();

  static void injection() => AuthDepedency.init();
  static final blocProviders = AuthBlocProviders.init;
  static final routes = AuthRouter.init;
}
