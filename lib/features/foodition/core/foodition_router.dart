import 'package:go_router/go_router.dart';

import '../home/domain/models/models.dart';
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
        GoRoute(
          name: productDetail,
          path: productDetailPath,
          builder: (context, state) {
            final args = state.extra as ProductModel;
            return ProductDetailPage(data: args);
          },
          routes: [
            GoRoute(
              name: checkoutSuccess,
              path: checkoutSuccessPath,
              builder: (context, state) => const CheckoutSuccessPage(),
            ),
          ],
        ),
        GoRoute(
          name: historyDetail,
          path: historyDetailPath,
          builder: (context, state) {
            final args = state.extra as HistoryModel;
            return HistoryDetailPage(data: args);
          },
        ),
        GoRoute(
          name: notification,
          path: notificationPath,
          builder: (context, state) => const NotificationPage(),
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

  /// route for page [ProductDetailPage]
  static const String productDetail = 'productDetail';
  static const String productDetailPath = 'productDetail';

  /// route for page [CheckoutSuccessPage]
  static const String checkoutSuccess = 'checkoutSuccess';
  static const String checkoutSuccessPath = 'checkoutSuccess';

  /// route for page [HistoryDetailPage]
  static const String historyDetail = 'historyDetail';
  static const String historyDetailPath = 'historyDetail';

  /// route for page [NotificationPage]
  static const String notification = 'notification';
  static const String notificationPath = 'notification';
}
