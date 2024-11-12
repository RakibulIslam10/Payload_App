import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'sign_in_mobile_layout_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(mobileScaffold: SignInMobileLayoutScreen());
  }
}
