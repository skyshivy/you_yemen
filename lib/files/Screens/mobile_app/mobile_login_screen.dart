import 'package:flutter/material.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPopupView(),
    );
  }
}
