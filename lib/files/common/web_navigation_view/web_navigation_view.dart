import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:you_yemen/files/common/web_navigation_view/widgets/faq_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_login_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_tunez_button.dart';

import 'package:you_yemen/files/controllers/u_search_controller.dart';

import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class WebNavigationView extends StatelessWidget {
  WebNavigationView({super.key});
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return !GetPlatform.isWeb
            ? SizedBox()
            : Container(
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
                                  const SizedBox(width: 18),
                                  navTunezButton(),
                                  const SizedBox(width: 8),
                                  faqButton(),
                                ],
                              ),
                            ),
                            Expanded(child: rightWidgets(context))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  Row rightWidgets(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Flexible(child: searchTextField(context)),
        const SizedBox(width: 12),
        navLoginButton(),
        const SizedBox(width: 12),
      ],
    );
  }
}
