import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class UPasswordTextField extends StatelessWidget {
  UPasswordTextField({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.enabled,
  });
  final TextEditingController textEditingController;
  final RxBool _hideCloseButton = true.obs;
  final String? hintText;
  final bool? enabled;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: Center(
              child: TextField(
                maxLength: otpLength,
                enabled: enabled,
                textAlign: TextAlign.center,
                onTap: () {
                  if (textEditingController.text.isNotEmpty) {
                    _hideCloseButton.value = false;
                  }
                },
                onChanged: (value) {
                  _hideCloseButton.value = value.isEmpty;
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
                onSubmitted: (value) {
                  if (onSubmitted != null) {
                    onSubmitted!(value);
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: textEditingController,
                style: _textStyle(),
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  isDense: true,
                  hintText: hintText ?? enterOtpStr,
                ),
              ),
            ),
          ),
          _closeButton()
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
        fontSize: 14,
        fontFamily: StoreManager().isEnglish
            ? FontName.helvetica.name
            : FontName.acMuna.name);
  }

  Obx _closeButton() {
    return Obx(() {
      return uVisibility(
        InkWell(
          focusColor: transparent,
          hoverColor: transparent,
          splashColor: transparent,
          highlightColor: transparent,
          onTap: () {
            textEditingController.text = '';
            _hideCloseButton.value = true;
            if (onChanged != null) {
              onChanged!('');
            }
          },
          child: const SizedBox(
            height: 40,
            width: 40,
            child: Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(
                Icons.close,
                color: grey,
                size: 18,
              ),
            ),
          ),
        ),
        secondChild: const SizedBox(height: 40, width: 40),
        _hideCloseButton.value,
      );
    });
  }
}
