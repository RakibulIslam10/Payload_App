import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';
import 'primary_input_filed.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String phoneCodeText;

  final bool isPassword;
  final bool isValidator;
  final bool? isObscure;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.isValidator = true,
    this.isObscure,
    required this.phoneCodeText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
      child: PrimaryInputWidget(
        keyboardType: TextInputType.number,
        prefixIcon: Container(
            margin: EdgeInsets.only(right: Dimensions.widthSize * 0.5),
            padding: EdgeInsets.only(
                top: Dimensions.heightSize * 0.9,
                right: Dimensions.widthSize * 0.5,
                left: Dimensions.widthSize * 0.5),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: TitleHeading4Widget(
              text: '+$phoneCodeText',
              color: CustomColor.whiteColor,
            )),
        isObscure: isObscure ?? false,
        isValidator: isValidator,
        controller: controller,
        hint: hint,
        label: label,
      ),
    );
  }
}
