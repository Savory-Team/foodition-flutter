import 'package:go_router/go_router.dart';

import '../data/models/models.dart';
import '../presentation/pages/pages.dart';

class AuthRouter {
  const AuthRouter._();

  static final List<GoRoute> init = [
    GoRoute(
      name: login,
      path: loginPath,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          name: register,
          path: registerPath,
          builder: (context, state) => const RegisterPage(),
          routes: [
            GoRoute(
              name: verification,
              path: verificationPath,
              builder: (context, state) {
                final args = state.extra as RegisterRequest;
                return VerificationPage(request: args);
              },
            ),
          ],
        ),
      ],
    ),
  ];

  /// route for page [LoginPage]
  static const String login = 'login';
  static const String loginPath = '/login';

  /// route for page [RegisterPage]
  static const String register = 'register';
  static const String registerPath = 'register';

  /// route for page [VerificationPage]
  static const String verification = 'verification';
  static const String verificationPath = 'verification';
}
