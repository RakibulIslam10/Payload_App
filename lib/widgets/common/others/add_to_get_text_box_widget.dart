import 'package:flutter/material.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';

class AddToGetTextBox extends StatelessWidget {
  final String addText;
  final String tkText;
  final String toGetText;
  final String gb5Text;

  const AddToGetTextBox({
    super.key,
    required this.addText,
    required this.tkText,
    required this.toGetText,
    required this.gb5Text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          color: CustomColor.primaryLightColor.withOpacity(0.2),
        ),
        height: Dimensions.heightSize * 4,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Changed to MainAxisAlignment.spaceBetween
            children: [
              Icon(
                Icons.hourglass_empty_rounded,
                size: Dimensions.heightSize * 1.5,
              ),
              _buildTextRow(),
              _buildCircleButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextRow() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.2),
          child: TitleHeading4Widget(
            text: addText,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.2),
          child: TitleHeading4Widget(
            text: tkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.2),
          child: TitleHeading4Widget(
            text: toGetText,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.2),
          child: TitleHeading4Widget(
            text: gb5Text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const TitleHeading4Widget(
          text: Strings.more,
        ),
      ],
    );
  }

  Widget _buildCircleButton() {
    return CircleAvatar(
      radius: Dimensions.radius,
      backgroundColor: CustomColor.primaryLightColor,
      child: Icon(
        Icons.add,
        color: CustomColor.whiteColor,
        size: Dimensions.heightSize,
      ),
    );
  }
}
