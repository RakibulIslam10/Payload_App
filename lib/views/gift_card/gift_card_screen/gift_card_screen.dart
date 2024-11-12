import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'gift_card_mobile_layout_screen.dart';

class GiftCardScreen extends StatelessWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: GiftCardMobileLayoutScreen());
  }
}
