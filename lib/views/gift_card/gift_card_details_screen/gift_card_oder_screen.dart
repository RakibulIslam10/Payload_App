import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'gift_card_oder_mobile_layout_screen.dart';

class GiftCardDetailsScreen extends StatelessWidget {
  const GiftCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: GiftCardOderMobileLayoutScreen());
  }
}
