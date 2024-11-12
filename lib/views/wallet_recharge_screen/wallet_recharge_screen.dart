import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'package:payloadui/views/wallet_recharge_screen/wallet_recharge_mobile_layout_screen.dart';

class WalletRechargeScreen extends StatelessWidget {
  const WalletRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: WalletRechargeMobileLayoutScreen());
  }
}
