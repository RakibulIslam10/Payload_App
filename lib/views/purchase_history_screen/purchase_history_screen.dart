import 'package:flutter/material.dart';
import 'package:payloadui/views/purchase_history_screen/purchase_history_mobile_layout_screen.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: PurchaseHistoryMobileLayoutScreen());
  }
}
