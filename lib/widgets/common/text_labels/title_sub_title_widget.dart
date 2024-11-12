import 'package:flutter/cupertino.dart';
import '../../../views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import '../../../views/utils/size.dart';
import 'title_heading2_widget.dart';
import 'title_heading4_widget.dart';
class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleFontSize,
    this.titleFontSize,
    this.titleColor,
    this.subTitleColor,
    this.isCenterText = false,
    this.fontWeight,
    this.subTitleFonWeight,
  });

  final String title, subTitle;
  final double? subTitleFontSize;
  final double? titleFontSize;
  final Color? titleColor, subTitleColor;
  final bool isCenterText;
  final FontWeight? fontWeight;
  final FontWeight? subTitleFonWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCenterText ? crossCenter : crossStart,
      mainAxisAlignment: isCenterText ? mainCenter : mainCenter,
      children: [
        TitleHeading2Widget(
          fontSize: titleFontSize,
          text: title,
          color: titleColor,
          fontWeight: fontWeight,
          textAlign: isCenterText ? TextAlign.center : TextAlign.start,
        ),
        Visibility(
          visible: subTitle != '',
          child: TitleHeading4Widget(
            text: subTitle,
            color: subTitleColor ??
                CustomColor.primaryDarkTextColor.withOpacity(0.60),
            fontWeight: subTitleFonWeight ?? FontWeight.w500,
            fontSize: subTitleFontSize ?? Dimensions.headingTextSize4,
            textAlign: isCenterText ? TextAlign.center : TextAlign.start,
            maxLines: 2,textOverflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}