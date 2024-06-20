import 'package:flutter/material.dart';
import 'package:you_yemen/files/common/custom_app_bar.dart';

mobileNavigation(BuildContext context, Widget widget, {String? title}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: customAppBar(title: title),
      body: widget,
    );
  }));
}
