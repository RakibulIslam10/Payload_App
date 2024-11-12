import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/local_storage/local_storage.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/basic_setting/basic_setting_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/views/web_view/web_view_screen.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_outline_button_widget.dart';
import '../../widgets/common/appbar/primary_appbar.dart';
import '../../widgets/common/buttons/custom_elevated_button_widget.dart';
import '../utils/dimensions.dart';

class OnboardMobileLayoutScreen extends StatelessWidget {
  OnboardMobileLayoutScreen({super.key});

  final controller = Get.put(BasicSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
      bottomNavigationBar: _bottomWidget(context),
    );
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.everythingIn1App,
      titleFontWeight: FontWeight.w400,
      showBackButton: false,
      titleColor: CustomColor.primaryLightColor,
    );
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Image.network(
        controller.onBoardImage.value.isNotEmpty
            ? controller.onBoardImage.value
            : controller.defaultImg.value,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            controller.defaultImg.value,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }


  _bottomWidget(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal,
            vertical: Dimensions.heightSize),
        child: Column(
          mainAxisAlignment: mainEnd,
          children: [
            CustomElevatedButtonWidget(
              buttonText: Strings.signIn,
              onPressed: () {
                Get.toNamed(Routes.signInScreen);
              },
            ),
            CustomOutlinedButton(
              buttonText: Strings.registerNow,
              onPressed: () {
                Get.toNamed(Routes.registrationScreen);
              },
            ),
            _byProceedingTextWidget(),
            _termsAndPolicyTextWidget(),
          ],
        ),
      ),
    );
  }

  _byProceedingTextWidget() {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.heightSize),
      child: TitleHeading5Widget(
        fontSize: Dimensions.headingTextSize6,
        text: Strings.byProceedingYouAgreeToOur,
        color: CustomColor.greyColor,
      ),
    );
  }

  _termsAndPolicyTextWidget() {
    return Row(
      mainAxisAlignment: mainCenter,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(WebViewScreen(
                url: LocalStorage.getPrivacyPolicyLink(),
                title: Strings.privacyPolicy));
          },
          child: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.termsAndCondition,
            color: CustomColor.primaryLightColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.1),
          child: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.and,
            color: CustomColor.greyColor,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(WebViewScreen(
                url: LocalStorage.getPrivacyPolicyLink(),
                title: Strings.privacyPolicy));
          },
          child: TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6,
            text: Strings.privacyPolicy,
            color: CustomColor.primaryLightColor,
          ),
        ),
      ],
    );
  }
}
