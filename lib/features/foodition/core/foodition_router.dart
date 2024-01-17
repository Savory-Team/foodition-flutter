import 'dart:io';

import 'package:go_router/go_router.dart';

import '../home/domain/models/models.dart';
import '../home/presentation/pages/pages.dart';
import '../profile/domain/models/models.dart';
import '../profile/presentation/pages/pages.dart';

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
          builder: (context, state) {
            final args = state.extra as List<ProductModel>;
            return SearchPage(products: args);
          },
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
        GoRoute(
          name: editProfile,
          path: editProfilePath,
          builder: (context, state) => const EditProfilePage(),
          routes: [
            GoRoute(
              name: editBio,
              path: editBioPath,
              builder: (context, state) =>
                  EditBioPage((state.extra as UserModel).bio ?? ''),
            ),
            GoRoute(
              name: editBirthdate,
              path: editBirthdatePath,
              builder: (context, state) => EditBirthdatePage(
                  (state.extra as UserModel).birthdate ?? DateTime(0000)),
            ),
            GoRoute(
              name: editEmail,
              path: editEmailPath,
              builder: (context, state) =>
                  EditEmailPage((state.extra as UserModel).email),
            ),
            GoRoute(
              name: editGender,
              path: editGenderPath,
              builder: (context, state) =>
                  EditGenderPage((state.extra as UserModel).gender ?? ''),
            ),
            GoRoute(
              name: editName,
              path: editNamePath,
              builder: (context, state) =>
                  EditNamePage((state.extra as UserModel).name),
            ),
            GoRoute(
              name: editPhoneNumber,
              path: editPhoneNumberPath,
              builder: (context, state) => EditPhoneNumberPage(
                  (state.extra as UserModel).phoneNumber ?? ''),
            ),
            GoRoute(
              name: editUsername,
              path: editUsernamePath,
              builder: (context, state) =>
                  EditUsernamePage((state.extra as UserModel).username ?? ''),
            ),
          ],
        ),
        GoRoute(
          name: editAddress,
          path: editAddressPath,
          builder: (context, state) =>
              EditAddressPage(state.extra as AddressModel),
        ),
        GoRoute(
          name: editPassword,
          path: editPasswordPath,
          builder: (context, state) => const EditPasswordPage(),
        ),
        GoRoute(
          name: myStore,
          path: myStorePath,
          builder: (context, state) => const MyStorePage(),
          routes: [
            GoRoute(
              name: menuList,
              path: menuListPath,
              builder: (context, state) => const MenuListPage(),
              routes: [
                GoRoute(
                  name: menuCheck,
                  path: menuCheckPath,
                  builder: (context, state) => const MenuCheckPage(),
                ),
                GoRoute(
                  name: addMenu,
                  path: addMenuPath,
                  builder: (context, state) =>
                      AddMenuPage(image: state.extra as File),
                ),
              ],
            ),
            GoRoute(
              name: salesHistory,
              path: salesHistoryPath,
              builder: (context, state) => const SalesHistoryPage(),
            ),
            GoRoute(
              name: editRestaurant,
              path: editRestaurantPath,
              builder: (context, state) =>
                  EditRestaurantPage(state.extra as RestoModel),
            ),
            GoRoute(
              name: notificationRestaurant,
              path: notificationRestaurantPath,
              builder: (context, state) => const NotificationRestaurantPage(),
            ),
          ],
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

  /// route for page [EditProfilePage]
  static const String editProfile = 'editProfile';
  static const String editProfilePath = 'editProfile';

  /// route for page [EditAddressPage]
  static const String editAddress = 'editAddress';
  static const String editAddressPath = 'editAddress';

  /// route for page [EditPasswordPage]
  static const String editPassword = 'editPassword';
  static const String editPasswordPath = 'editPassword';

  /// route for page [EditBioPage]
  static const String editBio = 'editBio';
  static const String editBioPath = 'editBio';

  /// route for page [EditBirthdatePage]
  static const String editBirthdate = 'editBirthdate';
  static const String editBirthdatePath = 'editBirthdate';

  /// route for page [EditEmailPage]
  static const String editEmail = 'editEmail';
  static const String editEmailPath = 'editEmail';

  /// route for page [EditGenderPage]
  static const String editGender = 'editGender';
  static const String editGenderPath = 'editGender';

  /// route for page [EditNamePage]
  static const String editName = 'editName';
  static const String editNamePath = 'editName';

  /// route for page [EditPhoneNumberPage]
  static const String editPhoneNumber = 'editPhoneNumber';
  static const String editPhoneNumberPath = 'editPhoneNumber';

  /// route for page [EditUsernamePage]
  static const String editUsername = 'editUsername';
  static const String editUsernamePath = 'editUsername';

  /// route for page [MyStorePage]
  static const String myStore = 'myStore';
  static const String myStorePath = 'myStore';

  /// route for page [MenuListPage]
  static const String menuList = 'menuList';
  static const String menuListPath = 'menuList';

  /// route for page [MenuCheckPage]
  static const String menuCheck = 'menuCheck';
  static const String menuCheckPath = 'menuCheck';

  /// route for page [AddMenuPage]
  static const String addMenu = 'addMenu';
  static const String addMenuPath = 'addMenu';

  /// route for page [SalesHistoryPage]
  static const String salesHistory = 'salesHistory';
  static const String salesHistoryPath = 'salesHistory';

  /// route for page [EditRestaurantPage]
  static const String editRestaurant = 'editRestaurant';
  static const String editRestaurantPath = 'editRestaurant';

  /// route for page [NotificationRestaurantPage]
  static const String notificationRestaurant = 'notificationRestaurant';
  static const String notificationRestaurantPath = 'notificationRestaurant';
}
