import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/identity/identity_verification_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';

class KycVerificationMobileLayoutScreen extends StatelessWidget {
  KycVerificationMobileLayoutScreen({super.key});

  final controller = Get.put((IdentityVerificationController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.KYCInformation,
        showBackButton: false,
        autoLeading: true,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal),
                child: ListView(
                  children: [
                    ...controller.inputFields.map((element) {
                      return element;
                    }),
                    ...controller.inputFileFields.map((element) {
                      return element;
                    }),
                    if (controller.status.value.contains("0")) ...[
                      _submitButtonWidget(),
                    ],
                    if (controller.status.value.contains("1")) ...[
                      _customMessageWidget(Strings.kycApproved,
                          Strings.approved, CustomColor.primaryLightColor)
                    ],
                    if (controller.status.value.contains("2")) ...[
                      _customMessageWidget(Strings.kycPending, Strings.pending,
                          CustomColor.primaryLightColor)
                    ],
                    if (controller.status.value.contains("3")) ...[
                      _customMessageWidget(
                          Strings.kycRejected, Strings.rejected, Colors.red)
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  _submitButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isSubmitLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                height: Dimensions.heightSize * 3,
                title: Strings.submit,
                onPressed: () {
                  controller.onSubmitKyc();
                },
              ),
      ),
    );
  }

  _customMessageWidget(title, subtitle, Color titleColor) {
    return TitleSubTitleWidget(
        title: title,
        titleFontSize: Dimensions.headingTextSize3,
        subTitleFontSize: Dimensions.headingTextSize5,
        subTitleColor: CustomColor.greyColor,
        titleColor: titleColor,
        subTitle: "Your KYC information is $subtitle. ");
  }
}
