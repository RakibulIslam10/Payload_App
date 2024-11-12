import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/wallet_recharge/wallet_recharge_preview_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/others/item_card_widget.dart';

class WalletRechargePreviewMobileLayoutScreen extends StatelessWidget {
  WalletRechargePreviewMobileLayoutScreen({super.key});

  final controller = Get.put(WalletRechargePreviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  _appbarWidget() {
    return PrimaryAppBar(
      autoLeading: true,
      appbarSize: Dimensions.heightSize * 3,
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      Strings.preview,
      titleFontWeight: FontWeight.w400,
      showBackButton: false,
    );
  }

  _bodyWidget() {
    return Column(
      children: [
        _itemsCardWidgets(),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal,
                vertical: Dimensions.marginSizeVertical * 0.5),
            child: Obx(
              () => controller.isLoading
                  ? const CustomLoadingAPI()
                  : CustomElevatedButtonWidget(
                      showIcon: true,
                      buttonText: Strings.submit,
                      onPressed: () {
                        if (controller.controller.alias.value
                            .contains('automatic')) {
                          controller.automaticGatewayProcess();
                        } else {
                          Get.toNamed(Routes.manualGatewayRechargeScreen);
                        }

                      },
                    ),
            ))
      ],
    );
  }

  _itemsCardWidgets() {
    return Column(
      children: [
        ItemCardWidget(
            currency: controller.currency.value,
            firstTitle: Strings.amount,
            lastTile: controller.amount.value.toString(),
            lastTextColor: CustomColor.pinkColor,
            icon: Icons.attach_money),
        ItemCardWidget(
            firstTitle: "Payment Method",
            lastTile: controller.paymentMethod.value,
            lastTextColor: CustomColor.primaryDarkColor,
            icon: Icons.rate_review_rounded),
        ItemCardWidget(
          currency: controller.userSelectedCurrency.value,
          firstTitle: Strings.totalCharge,
          lastTile: controller.totalCharge.value.toString(),
          lastTextColor: CustomColor.primaryLightColor,
          icon: Icons.add_card_sharp,
        ),
        ItemCardWidget(
          currency: controller.userSelectedCurrency.value,
          firstTitle: Strings.totalPayable,
          lastTile: controller.totalPayable.value.toString(),
          lastTextColor: CustomColor.primaryLightColor,
          icon: Icons.add_card_sharp,
        ),
      ],
    );
  }
}
