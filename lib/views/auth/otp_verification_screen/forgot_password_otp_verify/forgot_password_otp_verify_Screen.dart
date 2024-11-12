import 'package:flutter/cupertino.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'forgot_password_otp_verify_mobile_layout_screen.dart';

class ForgotPasswordOtpVerifyScreen extends StatelessWidget {
  const ForgotPasswordOtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: ForgotPasswordOtpVerifyMobileLayoutScreen());
  }
}