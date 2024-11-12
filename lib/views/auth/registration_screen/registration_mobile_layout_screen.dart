import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/inputs/custom_form_widget.dart';
import 'package:payloadui/widgets/common/others/custom_check_box_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import 'package:payloadui/widgets/common/text_labels/login_link_text_widget.dart';
import 'package:payloadui/widgets/custom_country_dropdown_widget.dart';
import 'package:payloadui/widgets/common/inputs/custom_phone_number_field.dart';
import '../../../controller/auth/register/register_screen_controller.dart';
import '../../../routes/routes.dart';

class RegistrationMobileLayoutScreen extends StatelessWidget {
  RegistrationMobileLayoutScreen({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarWidget(),
        body: Obx(
          () => controller.selectedCountry.value.isEmpty
              ? const CustomLoadingAPI()
              : _bodyWidget(),
        ));
  }

  _appbarWidget() {
    return PrimaryAppBar(
      toolbarHeight: Dimensions.heightSize * 2.5,
      appbarSize: Dimensions.heightSize * 4,
      Strings.appName,
      autoLeading: true,
      titleColor: CustomColor.primaryLightColor,
      showBackButton: false,
    );
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: SingleChildScrollView(
        child: Column(
          children: [
            titleAndDescriptionTextWidget(),
            _inputFormWidgets(),
            _registerButton(),
            _signInTextWidget(),
          ],
        ),
      ),
    );
  }

  titleAndDescriptionTextWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.heightSize * 1.5),
      child: TitleSubTitleWidget(
        isCenterText: true,
        titleFontSize: Dimensions.headingTextSize3,
        title: Strings.registerForAnAccountToday,
        subTitle: Strings.registerDescription,
        subTitleFontSize: Dimensions.headingTextSize6,
        subTitleFonWeight: FontWeight.w500,
      ),
    );
  }

  _inputFormWidgets() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomFormWidget(
            hint: Strings.firstName,
            controller: controller.firstNameController,
            label: Strings.firstName,
          ),
          CustomFormWidget(
              hint: Strings.lastName,
              controller: controller.lastNameController,
              label: Strings.lastName),
          Obx(() {
            return CustomCountryDropdown(
              label: Strings.selectCountry,
              selectMethod: controller.selectCountry.value,
              itemsList: controller.countryList,
              onChanged: (value) {
                if (value != null) {
                  controller.selectedCountry.value = value.name;
                  controller.phoneCode.value = value.mobileCode;
                }
              },
            );
          }),
          Obx(
            () => CustomInputField(
                controller: controller.mobileController,
                label: Strings.mobileNumber,
                hint: Strings.mobile,
                phoneCodeText: controller.phoneCode.value),
          ),
          CustomFormWidget(
              hint: Strings.emailAddress,
              controller: controller.emailController,
              label: Strings.emailAddress),
          Obx(
            () => CustomFormWidget(
                hint: Strings.password,
                isObscure: controller.isPasswordHidden.value,
                suffixIcon: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    controller.isPasswordHidden.value =
                        !controller.isPasswordHidden.value;
                  },
                  child: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    color: Colors.grey,
                    size: Dimensions.iconSizeSmall * 2,
                  ),
                ),
                isValidator: true,
                controller: controller.passwordController,
                label: Strings.enterPassword),
          ),
          Row(
            children: [
              Obx(
                () => CustomCheckBoxWidget(
                  value: controller.isChecked.value,
                  onChanged: (value) {
                    controller.isChecked.value = value ?? false;
                  },
                ),
              ),
              const TitleHeading5Widget(
                  text: Strings.iAgreeToTheTermsAndCondition)
            ],
          )
        ],
      ),
    );
  }

  _registerButton() {
    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : CustomElevatedButtonWidget(
              buttonText: Strings.registerNow,
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.registerApiProcess();
                }
              },
            ),
    );
  }

  _signInTextWidget() {
    return LinkTwoTextWidget(
        onTap: () {
          Get.offAllNamed(Routes.signInScreen);
        },
        text1: Strings.alreadyHaveAnAccount,
        text2: Strings.signIn);
  }
}
