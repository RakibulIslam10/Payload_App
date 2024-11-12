import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/auth/otp_verification/otp_verification_controller.dart';
import 'package:payloadui/widgets/common/appbar/custom_top_appbar_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../language/language.dart';
import '../../../../widgets/common/text_labels/title_heading3_widget.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';

class OtpVerificationMobileLayoutScreen extends StatelessWidget {
  OtpVerificationMobileLayoutScreen({super.key});

  final _controller = Get.put(OtpVerificationController());

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
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                controller: _controller.otpController,
                pinTheme: PinTheme(
                    inactiveColor: CustomColor.greyColor.withOpacity(0.5),
                    activeColor: CustomColor.primaryLightColor),
              ),
              _buttonWidget(),
              _resendCodeTextWidget()
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
              "${Strings.enterTheVerificationCodeWeSend} ${_controller.controller.numberController.text}",
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  _buttonWidget() {
    return Obx(
      () => _controller.isLoading
          ? const CustomLoadingAPI()
          : CustomElevatedButtonWidget(
              buttonText: Strings.continues,
              onPressed: () {
                _controller.loginOtpVerifyProcess();
              },
            ),
    );
  }

  _resendCodeTextWidget() {
    return Column(
      children: [
        TitleHeading3Widget(
          text: Strings.didntGetCode,
          fontWeight: FontWeight.w500,
          fontSize: Dimensions.headingTextSize4,
          color: CustomColor.greyColor,
        ),
        Obx(() {
          return InkWell(
            onTap: _controller.enableResend.value
                ? () {
                    _controller.resendCode();
                    _controller.timerInit();
                  }
                : null,
            child: Text(
              _controller.enableResend.value
                  ? "Resend Code"
                  : "Resend in ${_controller.secondsRemaining.value}s",
              style: TextStyle(
                color:
                    _controller.enableResend.value ? Colors.blue : Colors.grey,
              ),
            ),
          );
        }),
      ],
    );
  }
}
