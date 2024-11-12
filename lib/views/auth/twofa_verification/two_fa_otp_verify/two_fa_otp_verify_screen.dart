import 'package:flutter/cupertino.dart';
import 'package:payloadui/views/auth/twofa_verification/two_fa_otp_verify/two_fa_otp_verify_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class TwoFaOtpVerifyScreen extends StatelessWidget {
  const TwoFaOtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: TwoFaOtpVerifyMobileLayoutScreen());
  }
}
