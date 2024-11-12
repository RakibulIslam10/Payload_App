import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';

import '../common/text_labels/title_heading4_widget.dart';

class TextIconRowWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color circleAvatarBgColor;

  const TextIconRowWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.circleAvatarBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize * 0.5),
              child: CircleAvatar(
                  radius: Dimensions.radius ,
                  backgroundColor: circleAvatarBgColor,
                  child: icon),
            ),
            TitleHeading4Widget(
              text: text,
              fontSize: Dimensions.headingTextSize4,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
