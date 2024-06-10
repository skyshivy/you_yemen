import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'package:you_yemen/files/Screens/Home_screen/success_popup.dart';
import 'package:you_yemen/files/Screens/profile_screen/advanced_setting_screen.dart';
import 'package:you_yemen/files/Screens/profile_screen/blocklist_screen.dart';
import 'package:you_yemen/files/Screens/profile_screen/my_tunes_screen.dart';
import 'package:you_yemen/files/Screens/profile_screen/view_blocklist_screen.dart';
import 'package:you_yemen/files/api_calls/mytunes_api.dart';

import 'package:you_yemen/files/api_calls/profile_api.dart';
import 'package:you_yemen/files/api_calls/transition_api.dart';

import 'package:you_yemen/files/common/tell_friend_popup/popup.dart';
import 'package:you_yemen/files/controllers/my_tunes_controller.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';

import 'package:go_router/go_router.dart';

import 'package:you_yemen/files/router/route_name.dart';

import '../profile_screen/faq_screen.dart';
// import 'package:you_yemen/files/screens/profile_screen/transition_screen.dart';

=======
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';

>>>>>>> 255239e4e6ade76e65028a39b5d82244c84112cc
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
<<<<<<< HEAD
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
        // ElevatedButton(
        //   onPressed: () {
        //     makeAPICall(context);
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => TransactionScreen()),
        //     );
        //   },
        //   child: Text('Transition Screen'),
        // ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdvancedSettingScreen()),
            );
          },
          child: Text('Advanced Setting Screen'),
        ),
        ElevatedButton(
          onPressed: () async {
            myTunesController.fetchTunes();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyTuneScreen(),
              ),
            );
          },
          child: Text('MYTunesScreen'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewBlackListScreen(),
              ),
            );
          },
          child: Text('Blacklist Screen'),
        ),
       





        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaqScreen(),
              ),
            );
          },
          child: Text('Faq Screen')
        ),
=======
>>>>>>> 255239e4e6ade76e65028a39b5d82244c84112cc
      ],
    );
  }
}
