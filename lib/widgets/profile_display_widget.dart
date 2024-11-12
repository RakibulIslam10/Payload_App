import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import 'common/text_labels/title_sub_title_widget.dart';

class ProfileDisplayWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const ProfileDisplayWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.24,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.055,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            color: CustomColor.secondaryWhiteBoxColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
            border: Border.all(
              color: CustomColor.primaryLightColor,
              width: 2.5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginSizeVertical * 0.4,
          ),
          child: TitleSubTitleWidget(
            title: title,
            subTitle: subTitle,

            titleFontSize: Dimensions.headingTextSize4,
            subTitleFontSize: Dimensions.headingTextSize5,
            isCenterText: true,
          ),
        ),
      ],
    );
  }
}
