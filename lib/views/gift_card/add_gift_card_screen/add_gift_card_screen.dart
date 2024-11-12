import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';

import 'add_gift_card_mobile_layout_screen.dart';

class GiftCardSelectScreen extends StatelessWidget {
   const GiftCardSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
        mobileScaffold: AddGiftCardMobileLayoutScreen());
  }
}
