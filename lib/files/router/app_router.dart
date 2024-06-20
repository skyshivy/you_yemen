import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/Screens/wishlist_screen/wishlist_screen.dart';
import 'package:you_yemen/files/common/web_navigation_view/custom_drawer.dart';
import 'package:you_yemen/files/common/web_navigation_view/web_navigation_view.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
import 'package:you_yemen/files/controllers/artist_tunes_controller.dart';
import 'package:you_yemen/files/controllers/banner_controller.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/controllers/profile_controller.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/screens/artist_tunes_screen/artist_tunes_screen.dart';
import 'package:you_yemen/files/screens/banner_detail_screen/banner_detail_screen.dart';
import 'package:you_yemen/files/screens/category_screen/category_detail_screen.dart';

import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/home_screen/home_screen.dart';
import 'package:you_yemen/files/screens/my_tune_screen/my_tune_screen.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/my_tune_setting_screen.dart';
import 'package:you_yemen/files/screens/profile_screen/faq_screen.dart';

import 'package:you_yemen/files/screens/profile_screen/profile_screen.dart';
import 'package:you_yemen/files/screens/search_screen/search_screen.dart';
import 'package:you_yemen/files/screens/see_all_screen/see_all_screen.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
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
        _tuneSettingScreen(),
        _wishlistScreen(),
        _catDetailScreen(),
        _searchScreen(),
        _faqScreen(),
        _bannerDetailScreen(),
        _artistTunesScreen(),
        _seeAllScreen(),
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
          profileController.getProfileDetail();
          return ProfileScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _tuneSettingScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: tuneSettingRoute,
          name: tuneSettingRoute,
          builder: (context, state) {
            TuneInfo info2 = state.extra as TuneInfo;
            // String encodedToneDetail =
            //     state.uri.queryParameters['toneDetail'] ?? '';
            // Map<String, dynamic> valueMap = json.decode(encodedToneDetail);
            // TuneInfo info1 = TuneInfo.fromJson(valueMap);
            return MyTuneSettingScreen(
              info: info2,
            );
          }),
    ],
  );
}

StatefulShellBranch _wishlistScreen() {
  WishListController wishListController=Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: wishlistRoute,
          name: wishlistRoute,
          builder: (context, state) {
            wishListController.getWishListTones();
            return WishListScreen();
            //return UText(title: "wishlistRoute screen here");
          }),
    ],
  );
}

StatefulShellBranch _catDetailScreen() {
  Get.lazyPut(() => CategoryController());
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
  Get.lazyPut(() => MyTuneController());
  MyTuneController cont = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: myTunezRoute,
          name: myTunezRoute,
          builder: (context, state) {
            cont.makeApiCall();
            return MyTuneScreen(); //UText(title: "myTunez screen here");
          }),
    ],
  );
}

StatefulShellBranch _searchScreen() {
  Get.lazyPut(() => USearchController());
  USearchController cont = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: searchRoute,
          name: searchRoute,
          builder: (context, state) {
            String searchKey = state.uri.queryParameters['searchKey'] ?? '';
            String searchType = state.uri.queryParameters['searchType'] ?? '0';
            //cont.updateSearchType(int.parse(searchType));
            cont.searchText(searchKey, type: searchType);
            return SearchScreen();
          }),
    ],
  );
}

StatefulShellBranch _artistTunesScreen() {
  ArtistTunesController cont = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: artistTunesRoute,
          name: artistTunesRoute,
          builder: (context, state) {
            String artistKey = state.uri.queryParameters['artistKey'] ?? '';
            cont.getArtistTunes(artistKey);
            return ArtistTunesScreen(
              artistKey: artistKey,
            );
          }),
    ],
  );
}

StatefulShellBranch _bannerDetailScreen() {
  BannerController cont = Get.find();
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: bannerDetailRoute,
          name: bannerDetailRoute,
          builder: (context, state) {
            String searchKey = state.uri.queryParameters['searchKey'] ?? '';
            String type = state.uri.queryParameters['type'] ?? '';
            cont.getBannerDetail(searchKey, type);
            return BannerDetailScreen();
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
            return Center(child: FaqScreen());
          }),
    ],
  );
}

StatefulShellBranch _seeAllScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
          path: seeAllRoute,
          name: seeAllRoute,
          builder: (context, state) {
            List<TuneInfo> list = state.extra as List<TuneInfo>;
            print("list ======= ${list.length}");
            return SeeAllScreen(lst: list);
          }),
    ],
  );
}

Widget _shellRouteIndex(BuildContext context, GoRouterState state,
    StatefulNavigationShell navigationShell) {
  print("Selected index must be===== ${navigationShell.currentIndex}");
  print("Route name is ${state.fullPath} path is ${state.path}");
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
            si.isMobile
                ? Scaffold(
                    appBar: AppBar(
                      title: UText(
                        title: ((state.fullPath ?? '').replaceAll("/", " "))
                            .toUpperCase(),
                        fontName: FontName.helveticaBold,
                      ),
                      elevation: 2,
                      leading: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LogoWidget(),
                      ),
                      backgroundColor: white,
                    ),
                    endDrawer: Drawer(
                      child: CustomDrawer(),
                    ),
                    body: SizedBox(
                      child: navigationShell,
                    ))
                : WebNavigationView(),
          ],
        ));
      },
    ),
  );
}
