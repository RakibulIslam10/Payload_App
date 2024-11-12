import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/custom_style.dart';
import 'package:payloadui/views/utils/dimensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomOutlinedButton({super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.heightSize * 3.3,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          ),
          side: const BorderSide(color: CustomColor.primaryLightColor),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          overflow: TextOverflow.ellipsis,
          style: CustomStyle.darkHeading3TextStyle.copyWith(
            fontSize: Dimensions.headingTextSize4,
            fontWeight: FontWeight.w600,
            color: CustomColor.primaryDarkTextColor,
          ),
        ),
      ),
    );
  }
}
