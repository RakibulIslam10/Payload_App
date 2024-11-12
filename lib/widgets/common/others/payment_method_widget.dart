import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;

  const PaymentMethodWidget({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.25,
            vertical: Dimensions.marginSizeVertical * 0.2),
        height: Dimensions.heightSize * 2.5,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: isSelected
              ? CustomColor.primaryLightColor
              : CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          border: Border.all(color: CustomColor.greyColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                iconPath,
                height: Dimensions.iconSizeSmall * 1.7,
              ),
              horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
              TitleHeading5Widget(
                textAlign: TextAlign.center,
                text: text,
                color: isSelected
                    ? CustomColor.whiteColor
                    : CustomColor.primaryDarkTextColor,
                fontSize: Dimensions.headingTextSize5,
                fontWeight: FontWeight.w500,
                textOverflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
