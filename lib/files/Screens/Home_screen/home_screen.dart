import 'package:flutter/material.dart';

//import 'package:you_yemen/files/api_self_care/activation_api.dart';
//import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
//import 'package:you_yemen/files/api_self_care/list_settings_api.dart';
import 'package:you_yemen/files/api_self_care/pack_deatil_api.dart';
//import 'package:you_yemen/files/api_self_care/suspend_api.dart';

import 'package:you_yemen/files/api_gokul/add_to_wishlist_api.dart';
import 'package:you_yemen/files/api_gokul/get_tone_price_api.dart';


import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';

// import 'package:you_yemen/files/screens/profile_screen/transition_screen.dart';

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
      ],
    );
  }
}

