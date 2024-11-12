import 'package:flutter/material.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/others/custom_image_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';

class GridCustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String timeText;
  final String dateText;
  final String title;
  final String description;
  final VoidCallback onAddMore;

  const GridCustomCardWidget({
    super.key,
    required this.imagePath,
    required this.timeText,
    required this.dateText,
    required this.title,
    required this.description,
    required this.onAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: crossStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
                child: CustomImageWidget(
                  path: imagePath,
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.heightSize *0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: CustomColor.primaryLightColor,
                          size: Dimensions.heightSize,
                        ),
                        horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
                        TitleHeading5Widget(
                          fontSize: Dimensions.headingTextSize6,
                          text: dateText,
                          color: CustomColor.primaryLightColor,
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          color: CustomColor.primaryLightColor,
                          size: Dimensions.heightSize,
                        ),
                        horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
                        TitleHeading5Widget(
                          fontSize: Dimensions.headingTextSize6,
                          text: timeText,
                          color: CustomColor.primaryLightColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TitleSubTitleWidget(
                titleFontSize: Dimensions.headingTextSize6 * 1.1,
                subTitleFontSize: Dimensions.headingTextSize6,
                title: title,
                subTitle: description,

              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize * 2,
            child: PrimaryButton(
              fontSize: Dimensions.headingTextSize6,
              title: Strings.addMore, // Or pass dynamically if needed
              onPressed: onAddMore, // Passed function for button press
            ),
          ),
        ],
      ),
    );
  }
}
