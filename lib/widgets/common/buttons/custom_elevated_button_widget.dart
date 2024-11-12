import 'package:flutter/material.dart';
import 'package:payloadui/custom_assets/assets.gen.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/custom_style.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/others/custom_image_widget.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool showIcon;

  const CustomElevatedButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      child: PrimaryButton(
        height: Dimensions.heightSize * 3.3,
        buttonColor: CustomColor.primaryLightColor,
        buttonTextColor: CustomColor.whiteColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showIcon)...[
              CustomImageWidget(
                path: Assets.icons.send,
                height: Dimensions.heightSize * 1.3,
                width: Dimensions.widthSize * 3,
              ),
            ],
            horizontalSpace(Dimensions.marginSizeHorizontal * 0.25),
            Text(
              buttonText,
              overflow: TextOverflow.ellipsis,
              style: CustomStyle.darkHeading3TextStyle.copyWith(
                  fontSize: Dimensions.headingTextSize4,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
