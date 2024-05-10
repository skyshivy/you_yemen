import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/buy_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class SuccessPopupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: transparent,
        child: Container(
          width: popupWidth,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(contanerCornerRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  closePopupButton(btnColor: transparent, iconColor: white),
                ],
              ),
              SizedBox(height: 50),
              checkImageBuilder(),
              SizedBox(height: 10),
              successMessageBuilder(),
              SizedBox(height: 50),
              genericButton(
                width: 180,
                title: okStr,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Padding successMessageBuilder() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UText(
            title: cont.successMessage,
            enfontName: FontName.helvetica,
            textColor: Colors.white,
            enfontSize: 20,
            alignment: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Center checkImageBuilder() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 6),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Icon(Icons.check, size: 60, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
