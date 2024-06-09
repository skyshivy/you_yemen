import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/web_navigation_view/web_navigation_view.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/controllers/profile_controller.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/screens/category_screen/category_detail_screen.dart';
import 'package:you_yemen/files/screens/home_screen/home_screen.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/profile_screen/my_tunes_screen.dart';
import 'package:you_yemen/files/screens/profile_screen/profile_screen.dart';
import 'package:you_yemen/files/screens/search_screen/search_screen.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: homeRoute,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: _shellRouteIndex,
      branches: [
        _homeScreen(),
        _profileScreen(),
        _myTunezScreen(),
        _wishlistScreen(),
        _catDetailScreen(),
        _searchScreen(),
        _faqScreen(),
      ],
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(child: _errorWidget(context, state));
  },
);

Widget _errorWidget(BuildContext context, GoRouterState state) {
  return const Scaffold(
    body: Center(
      child: Text(
        "Page Not Found",
      ),
    ),
  );
}

StatefulShellBranch _homeScreen() {
  return StatefulShellBranch(
    navigatorKey: _sectionNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: homeRoute,
          builder: (context, state) {
            return HomeScreen();
          }),
    ],
  );
}

StatefulShellBranch _profileScreen() {
  ProfileController profileController = ProfileController();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: profileRoute,
        name: profileRoute,
        builder: (context, state) {
          return ProfileScreen();
        },
      ),
    ],
  );
}

// StatefulShellBranch _profileScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//           path: profileRoute,
//           name: profileRoute,
//           builder: (context, state) {
//             return ProfileScreen();
//           }),
//     ],
//   );
// }

StatefulShellBranch _wishlistScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: wishlistRoute,
          name: wishlistRoute,
          builder: (context, state) {
            return UText(title: "wishlistRoute screen here");
          }),
    ],
  );
}

StatefulShellBranch _catDetailScreen() {
  CategoryController con = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: catDetailRoute,
          name: catDetailRoute,
          builder: (context, state) {
            String categoryId = state.uri.queryParameters['categoryId'] ?? '';
            String categoryName =
                state.uri.queryParameters['categoryName'] ?? '';
            con.getCategoryDetail(categoryName, categoryId);
            return CategoryDetailScreen();
          }),
    ],
  );
}

StatefulShellBranch _myTunezScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: myTunezRoute,
          name: myTunezRoute,
          builder: (context, state) {
            return MyTuneScreen(); //UText(title: "myTunez screen here");
          }),
    ],
  );
}

StatefulShellBranch _searchScreen() {
  USearchController cont = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: searchRoute,
          name: searchRoute,
          builder: (context, state) {
            String searchKey = state.uri.queryParameters['searchKey'] ?? '';
            //cont.searchText(searchKey);
            return SearchScreen();
          }),
    ],
  );
}

StatefulShellBranch _faqScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: faqRoute,
          name: faqRoute,
          builder: (context, state) {
            return Center(
                child: UText(
              title: "FAQ Screen here",
            ));
          }),
    ],
  );
}

Widget _shellRouteIndex(BuildContext context, GoRouterState state,
    StatefulNavigationShell navigationShell) {
  print("Selected index must be===== ${navigationShell.currentIndex}");

  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Yemen",
    home: ResponsiveBuilder(
      builder: (context, si) {
        return Material(
            child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: webNavHeight + 5),
                Expanded(child: navigationShell),
              ],
            ),
            WebNavigationView(),
          ],
        ));
      },
    ),
  );
}
