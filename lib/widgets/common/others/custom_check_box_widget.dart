import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? text;
  final double? textSize;
  final double? checkboxSize;
  final FontWeight? fontWeight;

  const CustomCheckBoxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.text,
    this.textSize,
    this.checkboxSize, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: checkboxSize ?? 1.0,
          child: Checkbox(
            side: const BorderSide(color: CustomColor.primaryDarkColor),
            checkColor: CustomColor.whiteColor,
            activeColor: CustomColor.primaryLightColor,
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        TitleHeading5Widget(
          text: text ?? "",
          fontWeight:  fontWeight ?? FontWeight.w500,
          fontSize: textSize ?? Dimensions.headingTextSize5,
        ),
      ],
    );
  }
}
