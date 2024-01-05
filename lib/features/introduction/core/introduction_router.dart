import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

class IntroductionRouter {
  const IntroductionRouter._();

  static final List<GoRoute> init = [
    GoRoute(
      name: splash,
      path: splashPath,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: introduction,
      path: introductionPath,
      builder: (context, state) => const IntroductionPage(),
    ),
  ];

  /// route for page [SplashPage]
  static const String splash = 'splash';
  static const String splashPath = '/splash';

  /// route for page [IntroductionPage]
  static const String introduction = 'introduction';
  static const String introductionPath = '/introduction';
}
