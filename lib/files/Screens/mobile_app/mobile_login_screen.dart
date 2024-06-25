import 'package:flutter/material.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';
import 'package:you_yemen/files/utility/colors.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: LoginPopupView(
        enableCloseButton: false,
      ),
    );
  }
}
