import 'package:flutter/material.dart';
import '../../../../views/utils/custom_color.dart';
import '../../../../views/utils/dimensions.dart';

class CustomCopyBoxWidget extends StatelessWidget {
  final IconData icon;

  const CustomCopyBoxWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.primaryLightColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 0.8),
          bottomRight: Radius.circular(Dimensions.radius * 0.8),
        ),
      ),
      width: Dimensions.widthSize,
      child: Icon(
        icon,
        color: CustomColor.whiteColor,
        size: Dimensions.heightSize * 1.4,
      ),
    );
  }
}
