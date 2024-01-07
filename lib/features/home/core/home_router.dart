import 'package:go_router/go_router.dart';

import '../presentation/pages/pages.dart';

part 'enums/root_tab.dart';
part 'models/path_parameter.dart';

class HomeRouter {
  const HomeRouter._();

  static final List<GoRoute> init = [
    GoRoute(
      name: root,
      path: rootPath,
      builder: (context, state) {
        final tab = int.tryParse(state.pathParameters['root_tab'] ?? '') ?? 0;
        return RootPage(
          key: state.pageKey,
          currentTab: tab,
        );
      },
      routes: const [],
    ),
  ];

  /// route for page [RootPage]
  static const String root = 'root';
  static const String rootPath = '/root';
}
