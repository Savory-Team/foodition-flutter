import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';
import '../../features/home/home.dart';
import '../../features/introduction/introduction.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: IntroductionRouter.splashPath,
    routes: [
      ...Introduction.routes,
      ...Auth.routes,
      ...Home.routes,
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
