import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_password_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';

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
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 300,
        //       child:
        //           UPasswordTextField(textEditingController: passwordTextCont),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 10),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 300,
        //       child: UTextField(textEditingController: textCont),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 10),
        // Row(
        //   children: [
        //     SizedBox(
        //         width: 300,
        //         child: UMsisdnTextField(textEditingController: msisdnTextCont)),
        //   ],
        // ),
        const SizedBox(height: 10),
        RecomendedTabView(),
        RecomendedListView()
      ],
    );
  }
}
