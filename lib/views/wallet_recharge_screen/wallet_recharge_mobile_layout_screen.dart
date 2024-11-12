import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/wallet_recharge/wallet_recharge_screen_controller.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/others/payment_method_widget.dart';
import 'package:payloadui/widgets/custom_dropdown.dart';
import '../../backend/model/wallet_recharge/payment_gateway_model.dart';
import '../../controller/wallet_recharge/wallet_recharge_preview_controller.dart';
import '../../language/language.dart';
import '../../widgets/common/inputs/primary_input_filed.dart';
import '../../widgets/common/text_labels/title_heading4_widget.dart';
import '../../widgets/common/others/custom_check_box_widget.dart';
import '../utils/dimensions.dart';

class WalletRechargeMobileLayoutScreen extends StatelessWidget {
  WalletRechargeMobileLayoutScreen({super.key});

  final controller = Get.put(WalletRechargeController());
  final _controller = Get.put(WalletRechargePreviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarWidget(),
        body: Obx(
          () => controller.isLoading ? const CustomLoadingAPI() : _bodyWidget(),
        ));
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.addMoney,
      titleFontWeight: FontWeight.w400,
      autoLeading: true,
      showBackButton: false,
    );
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _amountInputField(),
          _selectPaymentMethodText(),
          _paymentMethodItemsWidget(),
          Obx(
            () => controller.selectPaymentIndex.value >= 0
                ? _selectPaymentMethodView()
                : Container(),
          ),
          _checkBox(),
          _buttonWidget(),
        ],
      ),
    );
  }

  _amountInputField() {
    controller.amountController.text =
        controller.controller.selectedAmount.value;
    return PrimaryInputWidget(
      suffixIcon: Container(
        alignment: Alignment.center,
        width: Dimensions.widthSize * 1.5,
        decoration: BoxDecoration(
            color: CustomColor.primaryLightColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimensions.radius * 0.5),
                topRight: Radius.circular(Dimensions.radius * 0.5))),
        child: TitleHeading4Widget(
          text: controller.controller.currency.value,
          color: CustomColor.whiteColor,
        ),
      ),
      keyboardType: TextInputType.number,
      isValidator: true,
      controller: controller.amountController,
      hint: Strings.enterAmount,
      label: Strings.amount,
    );
  }

  _selectPaymentMethodText() {
    return TitleHeading4Widget(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize),
      text: Strings.selectPaymentMethod,
      color: CustomColor.primaryLightColor,
      fontWeight: FontWeight.bold,
    );
  }

  _paymentMethodItemsWidget() {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.paymentGatewayInfoList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4 / 1.1),
        itemBuilder: (context, index) {
          final data = controller.paymentGatewayInfoList[index];
          return Obx(
            () => PaymentMethodWidget(
              onTap: () {
                controller.selectPaymentIndex(index);
                controller.selectedGatewayName.value = data.name;
              },
              text: data.name,
              iconPath: "${controller.imageUrls.value}/${data.image}",
              isSelected: controller.selectPaymentIndex.value == index,
            ),
          );
        },
      ),
    );
  }

  _selectPaymentMethodView() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading4Widget(
          padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 0.5),
          text: Strings.selectPaymentCurrency,
          fontWeight: FontWeight.bold,
          color: CustomColor.primaryLightColor,
        ),
        CustomDropdownMenu<Currency>(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            color: CustomColor.greyColor.withOpacity(0.2),
          ),
          itemsList: controller.allCurrencyList
              .where(
                (element) =>
                    element.name.contains(controller.selectedGatewayName.value),
              )
              .toList(),
          selectMethod: controller.selectedCurrency,
          onChanged: (value) {
            controller.selectedCurrency.value = value!.currencyCode;
            controller.alias.value = value.alias;
            controller.exRent.value = value.rate;
            controller.percentCharge.value = value.percentCharge.toDouble();
            controller.fixeCharge.value = value.fixedCharge.toDouble();
          },
        ),
      ],
    );
  }

  _checkBox() {
    return Obx(
      () => CustomCheckBoxWidget(
        fontWeight: FontWeight.normal,
        checkboxSize: 0.8,
        textSize: Dimensions.headingTextSize6,
        text: Strings.getInvoiceInMyMobile,
        value: controller.getInvoiceChecked.value == 'on',
        onChanged: (value) {
          controller.toggleInvoice();
        },
      ),
    );
  }

  _buttonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: PrimaryButton(
        height: Dimensions.heightSize * 3,
        title: Strings.continues,
        onPressed: () {
          Get.toNamed(Routes.walletRechargePreviewScreen);
          _controller.saveData();
          _controller.calculateAllCharges();
        },
      ),
    );
  }
}
