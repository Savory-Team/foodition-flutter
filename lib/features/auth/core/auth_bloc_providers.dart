import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injector.dart';
import '../presentation/managers/managers.dart';

class AuthBlocProviders {
  const AuthBlocProviders._();

  static final List<BlocProvider> init = [
    BlocProvider<AuthBloc>(create: (_) => locator()),
  ];
}
