import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/utils/custom_color.dart';
import '../../views/utils/dimensions.dart';

class MinutesCustomChipWidget extends StatelessWidget {
  final int index;
  final RxInt selectedValue;
  final String text;

  const MinutesCustomChipWidget({
    super.key,
    required this.index,
    required this.selectedValue,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          selectedValue.value = index;
        },
        child: Container(
          margin: EdgeInsets.only(
            left: Dimensions.marginSizeHorizontal * 0.4,
            bottom: Dimensions.marginSizeHorizontal * 0.0,
            top: Dimensions.marginSizeHorizontal * 0.2,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: selectedValue.value == index
                    ? Colors.transparent
                    : CustomColor.primaryDarkColor,
                width: 1),
          ),
          child: CircleAvatar(
            radius: Dimensions.radius * 2,
            backgroundColor: selectedValue.value == index
                ? CustomColor.pinkColor
                : CustomColor.whiteColor,
            child: Text(
              text,
              style: TextStyle(
                fontSize: Dimensions.headingTextSize5 * 0.85,
                color: selectedValue.value == index
                    ? CustomColor.whiteColor
                    : CustomColor.primaryDarkColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
