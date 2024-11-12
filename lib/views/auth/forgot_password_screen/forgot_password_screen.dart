import 'package:flutter/material.dart';
import 'package:payloadui/views/auth/forgot_password_screen/forgot_password_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ForgotPasswordMobileLayoutScreen());
  }
}
