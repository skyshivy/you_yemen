import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:you_yemen/files/controllers/app_controller.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/screens/home_screen/home_screen.dart';
import 'package:you_yemen/files/screens/mobile_app/bottom_tab_view/mobile_peristent_bottom_scaffold.dart';
import 'package:you_yemen/files/screens/mobile_app/more_screen/more_screen.dart';
import 'package:you_yemen/files/screens/my_tune_screen/my_tune_screen.dart';
import 'package:you_yemen/files/screens/profile_screen/faq_screen.dart';
import 'package:you_yemen/files/screens/search_screen/search_screen.dart';
import 'package:you_yemen/files/translation/strings.dart';

class MobileTabContainer extends StatefulWidget {
  const MobileTabContainer({super.key});

  @override
  State<MobileTabContainer> createState() => _MobileTabContainerState();
}

class _MobileTabContainerState extends State<MobileTabContainer> {
//class MobileTabContainer extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();
  DateTime? currentBackPressTime;

  MobileTabController cont = Get.put(MobileTabController());
  AppController appCont = Get.find();

  //MobileTabContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: Scaffold(
            body: HomeScreen(),
            appBar: AppBar(),
          ),
          icon: Icons.home,
          title: homeStr.tr,
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: Scaffold(
              body: Center(
                  child: SearchScreen(
            isMobile: true,
          ))),
          icon: Icons.search,
          title: searchStr.tr,
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: Scaffold(body: MyTuneScreen()),
          icon: Icons.music_note,
          title: myTuneStr.tr,
          navigatorkey: _tab3navigatorKey,
        ),
        PersistentTabItem(
          tab: Scaffold(body: MoreScreen()),
          icon: Icons.more_horiz,
          title: moreStr,
          navigatorkey: _tab4navigatorKey,
        ),
      ],
    );
  }
}
