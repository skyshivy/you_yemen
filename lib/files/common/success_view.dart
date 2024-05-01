import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Material(
          color: transparent,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: popupWidth - 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(contanerCornerRadius),
              color: white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                headerView(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      UText(
                        title: message,
                        alignment: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      okButtonBuilder(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget okButtonBuilder(BuildContext context) {
    return genericButton(
      width: 120,
      title: okStr,
      borderColor: grey,
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget headerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: closePopupButton(),
        )
      ],
    );
  }
}
