import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/inputs/primary_input_filed.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';
import '../../../controller/add_money/top_up_controller.dart';
import '../../../routes/routes.dart';
import '../../../widgets/common/text_labels/title_heading4_widget.dart';
import '../../../widgets/custom_country_dropdown_widget.dart';

class RechargeMobileLayoutScreen extends StatelessWidget {
  RechargeMobileLayoutScreen({super.key});

  final controller = Get.put(TopUpController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(),
      bottomNavigationBar: _bottomWidget(context),
      body: _bodyWidget(context),
    );
  }

  appbarWidget() {
    return PrimaryAppBar(
      titleFontWeight: FontWeight.w400,
      Strings.recharge,
      showBackButton: false,
      appbarSize: Dimensions.heightSize * 4,
    );
  }

  _bodyWidget(context) {
    return Form(
      key: formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCountryDropdown(
                label: Strings.selectCountry,
                selectMethod: Strings.selectCountry,
                itemsList: controller.controller.countryList,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCountry.value = value.name;
                    controller.mobileCode.value = value.mobileCode;
                    controller.countryCode.value = value.iso2;
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.marginSizeVertical * 0.5),
                child: PrimaryInputWidget(
                  controller: controller.mobileNumberController,
                  hint: Strings.number,
                  label: Strings.mobileNumber,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (controller.countryCode.value.isNotEmpty &&
                        controller.mobileNumberController.text.length == 11) {
                      controller.detectOperatorProcess();
                    }
                  },
                ),
              ),
              Obx(
                () => controller.isLoading
                    ? const CustomLoadingAPI()
                    : Obx(() => controller.minAmount.value >= 1
                        ? Obx(
                            () => controller.isLoading
                                ? const CustomLoadingAPI()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PrimaryInputWidget(
                                        suffixIcon: Container(
                                          alignment: Alignment.center,
                                          width: Dimensions.widthSize * 1.5,
                                          decoration: BoxDecoration(
                                            color:
                                                CustomColor.primaryLightColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(
                                                  Dimensions.radius * 0.5),
                                              topRight: Radius.circular(
                                                  Dimensions.radius * 0.5),
                                            ),
                                          ),
                                          child: TitleHeading4Widget(
                                            text: controller
                                                .receiverCurrency.value,
                                            color: CustomColor.whiteColor,
                                          ),
                                        ),
                                        controller: controller.amountController,
                                        hint: Strings.amount,
                                        label: Strings.amount,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          if (controller
                                                      .amountController.text.length ==
                                                  2 &&
                                              controller.countryCode.value
                                                  .isNotEmpty &&
                                              controller.mobileNumberController
                                                  .text.isNotEmpty) {
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              controller
                                                  .detectOperatorProcess();
                                            });
                                          }
                                        },
                                      ),
                                      TitleHeading5Widget(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.heightSize * 0.5),
                                        text:
                                            "Limit : ${controller.minAmount.value.toString()} BDT -${controller.maxAmount.value.toString()} BDT",
                                        color: CustomColor.primaryLightColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            Dimensions.headingTextSize6 * 1.1,
                                      ),
                                    ],
                                  ),
                          )
                        : const SizedBox()),
              )
            ]),
      ),
    );
  }

  _bottomWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal,
        vertical: Dimensions.marginSizeVertical * 0.5
      ),
      child: CustomElevatedButtonWidget(
        buttonText: Strings.continues,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            controller.calculateAllCharges();
            Get.toNamed(Routes.rechargePreviewScreen);
          }
        },
      ),
    );
  }
}
