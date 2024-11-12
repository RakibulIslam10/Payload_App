import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import '../../views/utils/custom_color.dart';
import 'text_labels/title_heading4_widget.dart';

class CustomTransactionItemWidget extends StatelessWidget {
  final String day;
  final String month;
  final String title;
  final String subTitle;
  final String amount;
  final String currency;

  const CustomTransactionItemWidget({
    super.key,
    required this.day,
    required this.month,
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.heightSize * 0.6),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.5,
        horizontal: Dimensions.marginSizeHorizontal,
      ),
      color: CustomColor.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.25),
                margin: EdgeInsets.only(right: Dimensions.widthSize),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                  color: CustomColor.secondaryWhiteBoxColor,
                ),
                child: Column(
                  children: [
                    TitleHeading4Widget(
                      text: day,
                      fontWeight: FontWeight.w500,
                    ),
                    TitleHeading5Widget(text: month),
                  ],
                ),
              ),
              TitleSubTitleWidget(
                title: title,
                titleFontSize: Dimensions.headingTextSize4,
                subTitleFontSize: Dimensions.headingTextSize5,
                subTitle: subTitle,
              ),
            ],
          ),
          Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(right: Dimensions.widthSize * 0.5),
                child: TitleHeading4Widget(
                  text: amount,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TitleHeading4Widget(
                text: currency,
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
    );
  }
}
