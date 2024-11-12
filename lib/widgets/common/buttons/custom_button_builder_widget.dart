import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';

class CustomButtonBuilderWidget extends StatelessWidget {
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;

  const CustomButtonBuilderWidget({
    super.key,
    this.height,
    this.backgroundColor,
    this.borderRadius,

    this.scrollDirection = Axis.horizontal,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      height: height ?? Dimensions.heightSize * 2.5,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimensions.radius),
        color: backgroundColor ??
            CustomColor.greyColor.withOpacity(0.28),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        itemCount: 2,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
