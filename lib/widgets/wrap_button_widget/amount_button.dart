import 'package:flutter/material.dart';
import '../../views/utils/custom_color.dart';
import '../../views/utils/dimensions.dart';
import '../common/text_labels/title_heading2_widget.dart';

class AmountButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AmountButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.25,
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize,
            vertical: Dimensions.heightSize * 0.25,
          ),
          decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? CustomColor.primaryLightColor
                    : CustomColor.primaryLightColor,
                width: 2),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            color: isSelected
                ? CustomColor.primaryLightColor
                : CustomColor.whiteColor,
          ),
          child: TitleHeading2Widget(
            text: text,
            color: isSelected
                ? CustomColor.whiteColor
                : CustomColor.primaryDarkTextColor,
          ),
        ),
      ),
    );
  }
}
