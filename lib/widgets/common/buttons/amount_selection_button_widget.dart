import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading3_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';

class AmountSelectionButtonWidget extends StatelessWidget {
  final List<String> buttonTextList;
  final int selectedIndex;
  final Function(int) onButtonPressed;
  final String title;

  const AmountSelectionButtonWidget({
    super.key,
    required this.buttonTextList,
    required this.selectedIndex,
    required this.onButtonPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading3Widget(text: title), // Change text as required
        verticalSpace(Dimensions.heightSize * 0.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            buttonTextList.length,
            (index) {
              return InkWell(
                onTap: () => onButtonPressed(index),
                child: Container(
                  height: Dimensions.heightSize * 3,
                  width: MediaQuery.of(context).size.width * 0.20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.8),
                    color: selectedIndex == index
                        ? CustomColor.primaryLightColor
                        : CustomColor.greyColor,
                  ),
                  child: TitleHeading4Widget(
                    text: buttonTextList[index],
                    color: selectedIndex == index
                        ? CustomColor.whiteColor
                        : CustomColor.primaryDarkColor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
