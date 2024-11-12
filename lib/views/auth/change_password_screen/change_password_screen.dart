import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'change_password_mobile_layout_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: ChangePasswordMobileLayoutScreen());
  }
}
