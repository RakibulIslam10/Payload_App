import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.textColor,
    this.borderColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal * 0.3),
          side: BorderSide(color: borderColor ?? Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor ?? CustomColor.primaryLightColor,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
