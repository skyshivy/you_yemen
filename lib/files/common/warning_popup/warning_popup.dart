import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/generic_popup.dart/generic_popup.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/images.dart';

openWarning(String message, Function()? onConfirm,
    {PopupType type = PopupType.warning,
    bool isSingleButton = false,
    String? buttonTitle}) {
  genericPopup(_mainContainer(message, type),
      headerWidget: _headerWidget(type),
      color: _getColorType(type),
      footerWidget:
          _footerButtons(onConfirm, isSingleButton, buttonTitle, type),
      width: 380);
}

_getColorType(PopupType type) {
  return type == PopupType.warning
      ? warningColor
      : (type == PopupType.success ? green : red);
}

_getIconType(PopupType type) {
  return type == PopupType.warning
      ? warningSvg
      : (type == PopupType.success ? successSvg : errorSvg);
}

Widget _mainContainer(String message, PopupType type) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          _getIconType(type),
          height: 120,
          width: 120,
        ),
        const SizedBox(height: 20),
        UText(
          alignment: TextAlign.center,
          title: message,
          textColor: white,
          enfontName: FontName.acMuna,
          enfontSize: 18,
        ),
      ],
    ),
  );
}

Widget _footerButtons(Function()? onConfirm, bool isSingleButton,
    String? buttonTitle, PopupType type) {
  return ResponsiveBuilder(
    builder: (context, si) {
      return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: isSingleButton
            ? SizedBox(
                width: 200,
                child:
                    confirmButtonWidget(onConfirm, context, buttonTitle, type))
            : Row(
                children: [
                  Expanded(
                    child: confirmButtonWidget(
                        onConfirm, context, buttonTitle, type),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: genericButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      radius: 2,
                      btnColor: white,
                      title: cancelStr.tr,
                    ),
                  )
                ],
              ),
      );
    },
  );
}

Widget confirmButtonWidget(Function()? onConfirm, BuildContext context,
    String? buttonTitle, PopupType type) {
  return genericButton(
    onTap: () {
      if (onConfirm != null) {
        onConfirm();
      }
      Navigator.of(context).pop();
    },
    radius: 2,
    btnColor: white,
    title: buttonTitle ?? confirmCStr.tr,
  );
}

Widget _headerWidget(PopupType type) {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: genericButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              height: 30,
              width: 30,
              btnColor: white,
              child: Icon(
                Icons.close,
                color: _getColorType(type),
              ),
            ),
            // CustomButton(
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            //   height: 30,
            //   width: 30,
            //   bgColor: white,
            //   leftWidget:

            // ),
          )
        ],
      );
    },
  );
}
