import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';
import '../../features/foodition/core/core.dart';
import '../../features/introduction/introduction.dart';

class AppRouter {
  final router = GoRouter(
    debugLogDiagnostics: true,
    observers: [ChuckerFlutter.navigatorObserver],
    initialLocation: IntroductionRouter.splashPath,
    routes: [
      ...Introduction.routes,
      ...Auth.routes,
      ...Foodition.routes,
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}
