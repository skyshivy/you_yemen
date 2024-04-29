import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/faq_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_login_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_tunez_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class WebNavigationView extends StatelessWidget {
  WebNavigationView({super.key});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: webNavHeight,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 4, color: shadowColor, spreadRadius: 2)
      ], color: white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LogoWidget(),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        navTunezButton(),
                        const SizedBox(width: 8),
                        faqButton(),
                      ],
                    ),
                  ),
                  Expanded(child: rightWidgets())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row rightWidgets() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SizedBox(
            width: 300,
            child: UTextField(textEditingController: textEditingController),
          ),
        ),
        const SizedBox(width: 12),
        navLoginButton(),
        const SizedBox(width: 12),
      ],
    );
  }
}
