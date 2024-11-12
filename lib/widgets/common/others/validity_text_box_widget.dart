import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import '../../../views/utils/size.dart';

class ValidityTexBoxWidget extends StatelessWidget {
  final String heading;
  final String validity;
  final String offerDetails;

  const ValidityTexBoxWidget({
    super.key,
    required this.heading,
    required this.validity,
    required this.offerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading4Widget(
          text: heading,
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
          child: Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                size: Dimensions.heightSize * 1.2,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.25),
                child: TitleHeading5Widget(text: validity),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.circle,
              color: CustomColor.primaryDarkColor,
              size: Dimensions.heightSize * 0.8,
            ),
            horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
            TitleHeading5Widget(text: offerDetails),
          ],
        ),
        verticalSpace(Dimensions.marginSizeVertical * 0.6),
      ],
    );
  }
}
