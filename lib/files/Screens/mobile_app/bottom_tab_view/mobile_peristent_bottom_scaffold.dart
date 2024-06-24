import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/app_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class PersistentBottomBarScaffold extends StatefulWidget {
  /// pass the required items for the tabs and BottomNavigationBar
  final List<PersistentTabItem> items;
  AppController appCont = Get.find();
  PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  //int _selectedTab = 0;
  //AppController appController = Get.find();
  bool isMyTuneLoaded = false;
  AppController appCont = Get.find();
  MobileTabController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: scaffold(),
    );
  }

  Scaffold scaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      /// Using indexedStack to maintain the order of the tabs and the state of the
      /// previously opened tab
      body: indexStack(),

      /// Define the persistent bottom bar
      bottomNavigationBar: safeArea(),
    );
  }

  SafeArea safeArea() {
    return SafeArea(
      child: bottomNavigationBar(),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      iconSize: 18,
      elevation: 10,
      selectedItemColor: Colors.teal,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: cont.index.value,
      onTap: ontap,
      items: items,
    );
  }

  List<BottomNavigationBarItem> get items {
    return [
      for (int i = 0; i < widget.items.length; i++)
        BottomNavigationBarItem(
          icon: customTitleWidget(widget.items[i], i),
          label: widget.items[i].title,
        ),
    ];
  }

  void ontap(index) {
    print("cont.index.value   === ${cont.index.value}");

    // StoreManager().context =
    //     widget.items[index].navigatorkey?.currentState?.context;
    //appCont.appTitle.value = "${index}";
    if (index == 0) {
      //appCont.appTitle.value = home.tr;
    } else if (index == 1) {
      USearchController co = Get.find();

      co.errorMessage.value = searchHintStr;
      //appCont.appTitle.value = myMusic.tr;
    } else if (index == 2) {
      if (isMyTuneLoaded) {
      } else {
        MyTuneController cont = Get.find();
        cont.makeApiCall();
        isMyTuneLoaded = true;
      }

      //appCont.appTitle.value = search.tr;
    } else if (index == 3) {
      //appCont.appTitle.value = myProfile.tr;
    }
    // print(
    //     "Corrent context is    === ${widget.items[index].navigatorkey?.currentState?.context}");

    if (index == cont.index.value) {
      /// if you want to pop the current tab to its root then use
      widget.items[index].navigatorkey?.currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        //_selectedTab = index;
        cont.index.value = index;
        print("cont.index.value   === ${cont.index.value}");
      });
    }
  }

  Widget indexStack() {
    return Obx(
      () {
        return IndexedStack(
          index: cont.index.value,
          children: widget.items.map((page) => navigator(page)).toList(),
        );
        /*
        Column(
          children: [
            Expanded(
              child: 
              IndexedStack(
                index: cont.index.value,
                children: widget.items.map((page) => navigator(page)).toList(),
              ),
            ),
            Text("Some thing was here")
          ],
        );
        */
      },
    );
  }

  Navigator navigator(PersistentTabItem page) {
    return Navigator(
      /// Each tab is wrapped in a Navigator so that naigation in
      /// one tab can be independent of the other tabs
      key: page.navigatorkey,
      onGenerateInitialRoutes: (navigator, initialRoute) {
        //cont.index.value = _selectedTab;

        return [
          MaterialPageRoute(builder: (context) => page.tab),
        ];
      },
    );
  }

  Future<bool> onWillPop() async {
    /// Check if curent tab can be popped
    if (widget.items[cont.index.value].navigatorkey?.currentState?.canPop() ??
        false) {
      widget.items[cont.index.value].navigatorkey?.currentState?.pop();
      print("trapped sky 12");
      return false;
    } else {
      print("trapped sky");
      // if current tab can't be popped then use the root navigator
      return true;
    }
  }

  Widget customTitleWidget(PersistentTabItem item, int index) {
    return Obx(
      () {
        return Column(
          children: [
            icon(item, index),
            (cont.index.value == index) ? title(item) : SizedBox(),
            // indicator(index),
          ],
        );
      },
    );
  }

  Icon icon(PersistentTabItem item, int index) {
    return Icon(
      item.icon,
      size: 24,
      color: (cont.index.value == index) ? black : grey,
    );
  }

  Widget title(PersistentTabItem item) {
    return UText(
      title: item.title.tr,
      fontSize: 12,
      fontName: FontName.helveticaBold,
    );
  }

  Container indicator(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.5),
        color: black,
      ),
      width: 50,
      height: 3,
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  PersistentTabItem({
    required this.tab,
    this.navigatorkey,
    required this.title,
    required this.icon,
  });
}

class MobileTabController extends GetxController {
  RxInt index = 0.obs;
}
