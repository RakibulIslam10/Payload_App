import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';

class CustomRechargeAmountWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomRechargeAmountWidget({
    super.key,
    required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: Dimensions.heightSize * 2,width: Dimensions.widthSize * 4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8)),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: CustomColor.secondaryTextColor,
            fontSize: Dimensions.headingTextSize5, // Customize font size
          ),
        ),
      ),
    );
  }
}
