import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/search_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class UTextField extends StatelessWidget {
  UTextField({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.leftChild,
  });
  final TextEditingController textEditingController;
  final RxBool _hideCloseButton = true.obs;
  final String? hintText;
  final Widget? leftChild;
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
          const SizedBox(width: 16),
          Expanded(
            child: Center(
              child: TextField(
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
                controller: textEditingController,
                style: _textStyle(),
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  isDense: true,
                  hintText: hintText ?? searchHintStr,
                ),
              ),
            ),
          ),
          _closeButton(),
          searchButton(() {
            print("searchButton action");
          }),
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
