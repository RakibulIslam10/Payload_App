import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import '../../../views/utils/custom_color.dart';
import '../text_labels/title_heading1_widget.dart';

class StatusDataWidget extends StatelessWidget {
  const StatusDataWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize),
        margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: CustomColor.primaryDarkTextColor.withOpacity(0.4),
                size: Dimensions.iconSizeLarge * 1.5,
              ),
              verticalSpace(Dimensions.paddingSize * 0.3),
              TitleHeading1Widget(
                text: text,
                color: CustomColor.primaryDarkTextColor.withOpacity(0.4),
                textAlign: TextAlign.center,
                fontSize: Dimensions.headingTextSize3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
