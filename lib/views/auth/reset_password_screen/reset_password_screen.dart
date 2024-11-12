import 'package:flutter/material.dart';
import 'package:payloadui/views/auth/reset_password_screen/reset_password_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ResetPasswordMobileLayoutScreen());
  }
}
