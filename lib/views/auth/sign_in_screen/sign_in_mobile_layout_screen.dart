import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/auth/register/country_model.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/auth/sign_in/sign_in_screen_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_button_builder_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/inputs/primary_input_filed.dart';
import 'package:payloadui/widgets/common/text_labels/login_link_text_widget.dart';
import '../../../widgets/common/inputs/custom_phone_number_field.dart';
import '../../../widgets/common/text_labels/title_heading2_widget.dart';
import '../../../widgets/common/text_labels/title_heading5_widget.dart';
import '../../../widgets/common/buttons/custom_button_widget.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../utils/custom_style.dart';

class SignInMobileLayoutScreen extends StatelessWidget {
  SignInMobileLayoutScreen({super.key});

  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(''),
        body: Obx(
          () => controller.selectedCountry.isEmpty
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ));
  }

  _bodyWidget(context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
        child: Column(
          children: [
            _signInTextAndButtonWidget(),
            controller.myIndex.value == 0
                ? _otpViewWidget()
                : _signInWithPasswordView(),
            _buttonAndRegistrationText(),
          ],
        ),
      ),
    );
  }

  _signInTextAndButtonWidget() {
    return Column(
      children: [
        const TitleHeading2Widget(
          text: Strings.signIn,
          fontWeight: FontWeight.w500,
        ),
        CustomButtonBuilderWidget(
          itemBuilder: (context, index) {
            return Obx(
              () => CustomButtonWidget(
                text: controller.buttonTextList[index],
                selectedColor: CustomColor.whiteColor,
                backgroundColor: CustomColor.primaryLightColor.withOpacity(0.8),
                isSelected: controller.myIndex.value == index,
                onTap: () {
                  controller.customButtonOnchange(index);
                },
              ),
            );
          },
        )
      ],
    );
  }

  _otpViewWidget() {
    return Form(
      key: controller.formKey1,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            Strings.selectCountry,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryDarkTextColor,
            ),
          ),
          verticalSpace(7),
          CustomDropdownMenu<Country>(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              color: CustomColor.greyColor.withOpacity(0.2),
            ),
            itemsList: controller.countryNameList,
            selectMethod: controller.selectedCountry,
            onChanged: (value) {
              controller.selectedCountry.value = value!.name;
              controller.mobileCode.value = value.mobileCode;
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.2),
            child: Obx(
              () => CustomInputField(
                  controller: controller.otpNumberController,
                  label: Strings.mobileNumber,
                  hint: Strings.mobile,
                  phoneCodeText: controller.mobileCode.value),
            ),
          ),
        ],
      ),
    );
  }

  _signInWithPasswordView() {
    return Form(
      key: controller.formKey1,
      child: Column(
        crossAxisAlignment: crossEnd,
        children: [
          CustomDropdownMenu<Country>(
            isCountryLabelText: true,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              color: CustomColor.greyColor.withOpacity(0.2),
            ),
            itemsList: controller.countryNameList,
            selectMethod: controller.selectedCountry,
            onChanged: (value) {
              controller.selectedCountry.value = value!.name;
              controller.mobileCode.value = value.mobileCode;
            },
            dropdownIconColor: CustomColor.greyColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.2),
            child: Obx(
              () => CustomInputField(
                  controller: controller.numberController,
                  label: Strings.mobileNumber,
                  hint: Strings.mobile,
                  phoneCodeText: controller.mobileCode.value),
            ),
          ),
          Obx(
            () => PrimaryInputWidget(
              isObscure: controller.isPasswordHidden.value,
              isValidator: true,
              controller: controller.passwordController,
              hint: Strings.password,
              label: Strings.password,
              suffixIcon: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  controller.isPasswordHidden.value =
                      !controller.isPasswordHidden.value;
                },
                child: Icon(
                  color: Colors.grey,
                  controller.isPasswordHidden.value
                      ? Icons.visibility_off_sharp
                      : Icons.visibility_sharp,
                  size: Dimensions.iconSizeSmall * 2,
                ),
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Get.toNamed(Routes.forgotPasswordScreen);
            },
            child: TitleHeading5Widget(
              padding: EdgeInsets.only(
                  top: Dimensions.heightSize * 0.5,
                  bottom: Dimensions.heightSize * 0.5),
              text: Strings.forgotPassword,
              color: CustomColor.primaryLightColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  _buttonAndRegistrationText() {
    return Column(
      children: [
        Obx(() {
          return controller.isLoading
              ? const CustomLoadingAPI()
              : CustomElevatedButtonWidget(
                  buttonText: Strings.continues,
                  onPressed: () {
                    controller.signInProcessApiAndCheckValidation();
                  },
                );
        }),
        LinkTwoTextWidget(
            onTap: () {
              Get.toNamed(Routes.registrationScreen);
            },
            text1: Strings.dontHaveAccount,
            text2: Strings.registerNow),
      ],
    );
  }
}
