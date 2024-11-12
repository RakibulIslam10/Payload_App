import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';

import '../text_labels/title_heading3_widget.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  final String amount;
  final String currency;

  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginSizeVertical * 0.2),
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          color: CustomColor.whiteColor,
        ),
        child: ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              child: Image.network(imagePath)),
          title: TitleHeading4Widget(
            text: title,
            maxLines: 2,
          ),
          trailing: TitleHeading3Widget(text: "$amount $currency"),
        ));
  }
}
