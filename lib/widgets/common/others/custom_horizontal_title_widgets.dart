import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';

class CustomHorizontalTitleWidget extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomHorizontalTitleWidget({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical * 0.5,
          horizontal: Dimensions.marginSizeHorizontal * 0.5),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? CustomColor.primaryLightColor,
          fontSize: Dimensions.headingTextSize4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
