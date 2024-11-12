import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/others/custom_image_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class CustomServicesBoxWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final double? iconSize;
  final VoidCallback onPressed;

  const CustomServicesBoxWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
              child: CustomImageWidget(
                path: iconPath,
                height: iconSize, // Use the iconSize parameter
                width: iconSize,
              )),
          verticalSpace(Dimensions.marginSizeVertical * 0.2),
          TitleHeading5Widget(
            text: title,
          ),
        ],
      ),
    );
  }
}
