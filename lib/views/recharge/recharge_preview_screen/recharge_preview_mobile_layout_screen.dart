import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/add_money/top_up_controller.dart';
import 'package:payloadui/controller/dashboard/dashboard_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/others/item_card_widget.dart';

class RechargePreviewMobileLayoutScreen extends StatelessWidget {
  RechargePreviewMobileLayoutScreen({super.key});
  final _controller = Get.put(DashboardController());
  final controller = Get.put(TopUpController());

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
              () => controller.isSubmitLoading
                  ? const CustomLoadingAPI()
                  : CustomElevatedButtonWidget(
                      showIcon: true,
                      buttonText: Strings.continues,
                      onPressed: () {
                        controller.payConfirmedProcess();
                      }),
            ))
      ],
    );
  }

  _itemsCardWidgets() {
    return Column(
      children: [
        ItemCardWidget(
            firstTitle: Strings.operatorName,
            lastTile: controller.operatorName.value,
            lastTextColor: CustomColor.greenColor,
            icon: Icons.sim_card_download),
        ItemCardWidget(
            firstTitle: Strings.mobileNumber,
            lastTile: controller.mobileNumberController.text,
            lastTextColor: CustomColor.orangeColor,
            icon: Icons.phone_android),
        ItemCardWidget(
            currency: controller.receiverCurrency.value,
            firstTitle: Strings.amount,
            lastTile: controller.amountController.text,
            lastTextColor: CustomColor.pinkColor,
            icon: Icons.attach_money),
        ItemCardWidget(
            currency: _controller.currency.value,
            firstTitle: Strings.exchangeRate,
            lastTextColor: CustomColor.primaryDarkTextColor,
            lastTile:
                '1 ${controller.receiverCurrency.value} = ${controller.exRate.value.toStringAsFixed(4)}',
            icon: Icons.add_card_sharp),
        ItemCardWidget(
            currency: _controller.currency.value,
            firstTitle: Strings.conversionAmount,
            lastTile: controller.conversionAmount.value.toStringAsFixed(4),
            icon: Icons.add_card_sharp),
        ItemCardWidget(
            currency: _controller.currency.value,
            firstTitle: Strings.totalCharge,
            lastTile: controller.totalCharge.value.toStringAsFixed(4),
            lastTextColor: CustomColor.primaryDarkTextColor,
            icon: Icons.add),
        ItemCardWidget(
            firstTitle: Strings.totalPayable,
            currency: _controller.currency.value,
            lastTile: controller.totalPayable.value.toStringAsFixed(4),
            lastTextColor: CustomColor.pinkColor,
            icon: Icons.access_time),
      ],
    );
  }
}
