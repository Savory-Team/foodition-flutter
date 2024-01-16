import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injector.dart';
import '../home/presentation/managers/managers.dart';

class FooditionBlocProviders {
  const FooditionBlocProviders._();

  static final List<BlocProvider> init = [
    BlocProvider<MlBloc>(create: (_) => locator()),
    BlocProvider<ProductBloc>(create: (_) => locator()),
    BlocProvider<TransactionBloc>(create: (_) => locator()),
  ];
}
