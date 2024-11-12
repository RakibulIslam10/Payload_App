import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'package:payloadui/views/wallet_recharge_screen/manual_recharge/manual_gateway_recharge_mobile_layout_screen.dart';

class ManualGatewayRechargeScreen extends StatelessWidget {
  const ManualGatewayRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: ManualGatewayRechargeMobileLayoutScreen());
  }
}
