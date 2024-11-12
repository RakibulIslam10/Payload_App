import 'package:flutter/material.dart';
import '../../../views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import '../text_labels/title_heading2_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Color selectedColor;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.selectedColor,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
            color: isSelected ? backgroundColor : Colors.transparent,
          ),
          child: TitleHeading2Widget(
            fontWeight: FontWeight.w400,
            text: text,
            color: isSelected ? selectedColor : CustomColor.primaryDarkColor,
            fontSize: Dimensions.headingTextSize5,
          ),
        ),
      ),
    );
  }
}
