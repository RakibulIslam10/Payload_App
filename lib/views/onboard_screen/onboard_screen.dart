import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'onboard_mobile_layout_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: OnboardMobileLayoutScreen(),
    );
  }
}
