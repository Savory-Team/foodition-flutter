import 'foodition_bloc_providers.dart';
import 'foodition_dependency.dart';
import 'foodition_router.dart';

class Foodition {
  const Foodition._();

  static void injection() => FooditionDepedency.init();
  static final blocProviders = FooditionBlocProviders.init;
  static final routes = FooditionRouter.init;
}
