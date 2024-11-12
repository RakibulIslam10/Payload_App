import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../language/language.dart';
import '../../../views/utils/custom_color.dart';
import '../../../views/utils/custom_style.dart';
import '../../../views/utils/dimensions.dart';
import '../../../views/utils/size.dart';

class PrimaryInputWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final bool? isObscure;
  final int maxLines;
  final bool isValidator;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmitted;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? borderTopRightRadius;
  final double? borderBottomRightRadius;
  final double? topLeft;
  final double? bottomLeft;

  const PrimaryInputWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    this.label,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly,
    this.suffixIcon,
    this.isObscure,
    this.prefixIcon,
    this.borderTopRightRadius,
    this.borderBottomRightRadius,
    this.topLeft,
    this.bottomLeft,
  });

  @override
  State<PrimaryInputWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<PrimaryInputWidget> {
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: CustomStyle.darkHeading4TextStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: CustomColor.primaryDarkTextColor,
          ),
        ),
        widget.label != null ? verticalSpace(7) : verticalSpace(0),
        TextFormField(
          obscureText: widget.isObscure ?? false,
          readOnly: widget.readOnly ?? false,
          validator: widget.isValidator == false
              ? null
              : (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          onTap: () {
            setState(() {
              focusNode!.requestFocus();
            });
          },
          onFieldSubmitted: widget.onFieldSubmitted ??
              (value) {
                setState(() {
                  focusNode!.unfocus();
                });
              },
          onChanged: widget.onChanged,
          focusNode: focusNode,
          style: CustomStyle.darkHeading3TextStyle.copyWith(
            color: CustomColor.primaryDarkTextColor,
          ),
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          cursorColor: CustomColor.primaryLightColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColor.greyColor.withOpacity(0.2),
            hintText: widget.hint,
            hintStyle: GoogleFonts.inter(
              fontSize: Dimensions.headingTextSize4,
              fontWeight: FontWeight.w400,
              color: CustomColor.primaryDarkTextColor.withOpacity(0.2),
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(widget.topLeft ?? Dimensions.radius * 0.8),
                bottomLeft: Radius.circular(
                    widget.bottomLeft ?? Dimensions.radius * 0.8),
                topRight: Radius.circular(
                    widget.borderTopRightRadius ?? Dimensions.radius * 0.8),
                bottomRight: Radius.circular(
                    widget.borderBottomRightRadius ?? Dimensions.radius * 0.8),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 0.8),
                bottomLeft: Radius.circular(Dimensions.radius * 0.8),
                topRight: Radius.circular(
                    widget.borderTopRightRadius ?? Dimensions.radius * 0.8),
                bottomRight: Radius.circular(
                    widget.borderBottomRightRadius ?? Dimensions.radius * 0.8),
              ),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 0.8),
                bottomLeft: Radius.circular(Dimensions.radius * 0.8),
                topRight: Radius.circular(
                    widget.borderTopRightRadius ?? Dimensions.radius * 0.8),
                bottomRight: Radius.circular(
                    widget.borderBottomRightRadius ?? Dimensions.radius * 0.8),
              ),
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.heightSize * 1.7,
              vertical: Dimensions.widthSize,
            ),
          ),
        ),
      ],
    );
  }
}
