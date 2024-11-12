import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart'; // Make sure to import GetX for Obx

class CustomSwitchButtonWidget extends StatelessWidget {
  final String title;
  final RxBool switchValue;
  final Function(bool) onToggle;

  const CustomSwitchButtonWidget({
    super.key,
    required this.title,
    required this.switchValue,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Changed to MainAxisAlignment.spaceBetween
      children: [
        TitleHeading4Widget(text: title),
        Obx(() {
          return Switch(
            trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
            activeTrackColor: CustomColor.primaryLightColor.withOpacity(0.2),
            inactiveThumbColor: CustomColor.greyColor,
            activeColor: CustomColor.primaryLightColor,
            value: switchValue.value,
            onChanged: onToggle,
          );
        }),
      ],
    );
  }
}
