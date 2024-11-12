import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/size.dart';
import '../../../views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import 'title_heading4_widget.dart';

class LinkTwoTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? text2Color;
  final VoidCallback onTap;


  const LinkTwoTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.text2Color, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 0.5),
      child: Wrap(
        children: [
          TitleHeading4Widget(
            text: text1,
            fontSize: Dimensions.headingTextSize5,
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal * 0.1),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: TitleHeading4Widget(
              fontSize: Dimensions.headingTextSize5,
              text: text2,
              color: text2Color ?? CustomColor.primaryLightColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
