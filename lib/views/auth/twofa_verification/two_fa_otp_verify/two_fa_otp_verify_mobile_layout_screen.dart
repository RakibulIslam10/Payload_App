import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/auth/two_factor/two_fa_otp_controller.dart';
import 'package:payloadui/widgets/common/appbar/custom_top_appbar_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../custom_assets/assets.gen.dart';
import '../../../../../language/language.dart';
import '../../../../../widgets/common/text_labels/title_heading3_widget.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';

class TwoFaOtpVerifyMobileLayoutScreen extends StatelessWidget {
  TwoFaOtpVerifyMobileLayoutScreen({super.key});

  final controller = Get.put(TwoFaOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Column(
            children: [
              topAppbarAndTexWidget(),
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: controller.otpController,
                pinTheme: PinTheme(
                    inactiveColor: CustomColor.greyColor.withOpacity(0.5),
                    activeColor: CustomColor.primaryLightColor),
              ),
              Obx(
                () => controller.isVerifyLoading
                    ? const CustomLoadingAPI()
                    : CustomElevatedButtonWidget(
                        buttonText: Strings.continues,
                        onPressed: () {
                          controller.twoFaStatusUpdate();
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  topAppbarAndTexWidget() {
    return Column(
      children: [
        TopAppBarWidget(
          icon: Icons.arrow_back,
          imagePath: Assets.logo.brandLogo.path,
        ),
        TitleHeading3Widget(
          text:
              "${Strings.enterTheVerificationCodeWeSend} ${controller.controller.numberController.text}",
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
