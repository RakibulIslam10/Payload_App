import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'flexiplan_mobile_layout_screen.dart';

class FlxiplanScreen extends StatelessWidget {
  const FlxiplanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   ResponsiveLayout(
        mobileScaffold: FlexiPlanMobileLayoutScreen());
  }
}
