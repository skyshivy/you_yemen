import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:you_yemen/files/Screens/Home_screen/success_popup.dart';
import 'package:you_yemen/files/api_calls/profile_api.dart';
import 'package:you_yemen/files/common/tell_friend_popup/popup.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';

import 'package:go_router/go_router.dart';

import 'package:you_yemen/files/router/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController msisdnTextCont = TextEditingController();
  TextEditingController textCont = TextEditingController();
  TextEditingController passwordTextCont = TextEditingController();
  TextEditingController umsisdnTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 10),
        RecomendedTabView(),
        RecomendedListView(),
        ElevatedButton(
          onPressed: () async {
            getProfileDetailsApi();

            context.goNamed(profileRoute);
          },
          child: Text('Go to Profile'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.dialog(
              TellFriendPopupView(
                msisdn: '12345',
                info: TuneInfo(),
              ),
              barrierDismissible: false,
            );
          },
          child: Text('Show Dialog'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.dialog(
              SuccessPopupView(),
              barrierDismissible: false,
            );
          },
          child: Text('Show Dialog'),
        ),
      ],
    );
  }
}
