import 'package:flutter/material.dart';
import 'package:payloadui/views/recharge/recharge_history_screen/recharge_history_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class RechargeHistoryScreen extends StatelessWidget {
  const RechargeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: RechargeHistoryMobileLayoutScreen());
  }
}
