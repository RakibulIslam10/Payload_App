import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading3_widget.dart';

class UserNameAndEmailTextWidget extends StatelessWidget {
  final String name;
  final String email;

  const UserNameAndEmailTextWidget({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical * .5),
      child: Column(
        children: [
          TitleHeading3Widget(text: name),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: Dimensions.marginSizeHorizontal * 0.2,
            children: [
              Icon(
                Icons.email,
                color: CustomColor.primaryLightColor,
                size: Dimensions.iconSizeSmall * 1.5,
              ),
              Text(
                email,
                style: TextStyle(fontSize: Dimensions.headingTextSize6),
              )
            ],
          ),
        ],
      ),
    );
  }
}
