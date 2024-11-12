import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/dimensions.dart';

import 'primary_input_filed.dart';
class CustomFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isValidator;
  final bool? isObscure;
  final TextInputType? keyboardType;

   const CustomFormWidget({
    super.key,
    required this.controller,
    required this.label,
     required this.hint,
    this.isPassword = false,
    this.suffixIcon,
    this.isValidator = true, this.isObscure, this.prefixIcon, this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
      child: PrimaryInputWidget(
        keyboardType: keyboardType,
        prefixIcon: prefixIcon,
        isObscure: isObscure ?? false,
        isValidator: isValidator,
        controller: controller,
        hint: hint,
        label: label,
        suffixIcon: suffixIcon ??
            (isPassword
                ? Icon(
                    Icons.visibility_sharp,
                    size: Dimensions.iconSizeSmall * 2,
                  )
                : null),
      ),
    );
  }
}
