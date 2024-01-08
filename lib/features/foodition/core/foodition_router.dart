import 'package:go_router/go_router.dart';

import '../home/presentation/pages/pages.dart';

part 'enums/root_tab.dart';
part 'models/path_parameter.dart';

class FooditionRouter {
  const FooditionRouter._();

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
      routes: [
        GoRoute(
          name: search,
          path: searchPath,
          builder: (context, state) => const SearchPage(),
        ),
      ],
    ),
  ];

  /// route for page [RootPage]
  static const String root = 'root';
  static const String rootPath = '/root';

  /// route for page [SearchPage]
  static const String search = 'search';
  static const String searchPath = 'search';
}
