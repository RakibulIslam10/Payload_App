import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'otp_verification_mobile_layout_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: OtpVerificationMobileLayoutScreen());
  }
}
