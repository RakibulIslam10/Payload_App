import 'package:flutter/material.dart';
import 'package:payloadui/views/auth/twofa_verification/twofa_verification_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class TwofaVerificationScreen extends StatelessWidget {
  const TwofaVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: TwofaVerificationMobileLayoutScreen());
  }
}
