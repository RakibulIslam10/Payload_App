import 'package:flutter/cupertino.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'package:payloadui/views/wallet_recharge_screen/preview/wallet_recharge_preview_mobile_layout_screen.dart';

class WalletRechargePreviewScreen extends StatelessWidget {
   const WalletRechargePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: WalletRechargePreviewMobileLayoutScreen());
  }
}
