import 'package:flutter/material.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';

class CustomInfoCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String validity;
  final String buttonText;

  const CustomInfoCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.validity, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
      decoration: BoxDecoration(
        color: CustomColor.secondaryWhiteBoxColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
      ),
      height: MediaQuery.of(context).size.height * 0.16,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHeading4Widget(
            text: title,
            fontWeight: FontWeight.w500,
          ),
          TitleHeading4Widget(
            text: subtitle,
            color: CustomColor.secondaryTextColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleHeading4Widget(
                text: validity,
                color: CustomColor.secondaryTextColor,
              ),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 0.8))),
                child:  Text(buttonText),
              )
            ],
          )
        ],
      ),
    );
  }
}
