import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/api_calls/Profile_api.dart';

import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';

import 'package:go_router/go_router.dart';

import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController msisdnTextCont = TextEditingController();
  TextEditingController textCont = TextEditingController();
  TextEditingController passwordTextCont = TextEditingController();
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
      ],
    );
  }
}
