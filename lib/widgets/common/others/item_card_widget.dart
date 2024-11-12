import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget(
      {super.key,
      required this.firstTitle,
      required this.lastTile,
      required this.icon,
      this.lastTextColor,
      this.fontWeight,  this.currency = ''});

  final String firstTitle;
  final String? currency;
  final String lastTile;
  final IconData icon;
  final Color? lastTextColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal * 0.5),
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
      color: CustomColor.whiteColor,
      child: ListTile(
        title:  TitleHeading4Widget(
        maxLines: 1,
        text: firstTitle,
      ),
        leading:   Container(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
          decoration: BoxDecoration(
              border: Border.all(
                  color: CustomColor.primaryLightColor, width: 1.5),
              color: CustomColor.whiteColor,
              shape: BoxShape.circle),
          child: Icon(
            icon,
            size: Dimensions.iconSizeSmall * 2,
            color: CustomColor.primaryLightColor,
          ),
        ),
        trailing:  TitleHeading4Widget(
          maxLines: 2,
          text: "$lastTile $currency",
          fontWeight: fontWeight,
          color: lastTextColor ?? CustomColor.primaryLightColor,
        ),
      ),
    );
  }
}
