import 'package:flutter/material.dart';
import 'package:payloadui/views/recharge/recharge_preview_screen/recharge_preview_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class RechargePreviewScreen extends StatelessWidget {
   const RechargePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(mobileScaffold: RechargePreviewMobileLayoutScreen());
  }
}
