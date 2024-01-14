import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../core/injection/injector.dart' as di;

import 'app.dart';
import 'core/utils/app_bloc_observer.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  di.init();

  // Set up chucker
  if (!isProduction) {
    ChuckerFlutter.showOnRelease = true;
  }

  await initializeDateFormatting('id_ID', null);
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
