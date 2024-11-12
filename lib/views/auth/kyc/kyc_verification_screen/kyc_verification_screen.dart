import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'kyc_verification_mobile_layout_screen.dart';

class KycVerificationScreen extends StatelessWidget {
  const KycVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: KycVerificationMobileLayoutScreen());
  }
}
