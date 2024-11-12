import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/wrap_button_widget/amount_button.dart';
import '../../../../language/language.dart';
import '../../../../widgets/common/inputs/custom_form_widget.dart';
import '../../../backend/model/gift_card/gift_card_details_model.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/gift_card/gift_card_details/gift_card_oder_controller.dart';
import '../../../widgets/custom_country_dropdown_widget.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';

class GiftCardOderMobileLayoutScreen extends StatelessWidget {
  GiftCardOderMobileLayoutScreen({super.key});

  final controller = Get.put(GiftCardOderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarWidget(),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ));
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            _amountButtonWidget(),
            _allFieldWidget(),
            _buttonWidget(context),
          ],
        ),
      ),
    );
  }

  _appbarWidget() {
    return PrimaryAppBar(
      appbarSize: Dimensions.heightSize * 4,
      Strings.giftCardOder,
      showBackButton: false,
      autoLeading: true,
    );
  }

  _amountButtonWidget() {
    return Wrap(
      children: List.generate(
        controller.gifCardPriceList.length,
        (index) {
          final priceText = controller.gifCardPriceList[index].toString();
          return Obx(() => AmountButton(
                text: priceText,
                isSelected: controller.selectedIndex.value == index,
                onTap: () {
                  controller.selectedIndex.value = index;
                  controller.selectedValue.value = priceText;
                },
              ));
        },
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.isBuyLoading
          ? const CustomLoadingAPI()
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.6,
              ),
              child: CustomElevatedButtonWidget(
                onPressed: () {
                  controller.createGiftCardApi();
                },
                buttonText: Strings.buyNow2,
              ),
            ),
    );
  }

  _allFieldWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        if (controller.gifCardPriceList.isEmpty) ...[
          CustomFormWidget(
              hint: Strings.amount,
              controller: controller.amountController,
              label: Strings.amount),
        ],
        CustomFormWidget(
            hint: Strings.enterReceiverMail,
            controller: controller.emailController,
            label: Strings.receiverMail),
        CustomCountryDropdown(
          label: Strings.selectCountry,
          selectMethod: Strings.selectCountry,
          itemsList: controller.controller.controller.countryList,
          onChanged: (value) {
            if (value != null) {
              controller.mobileCode.value = value.mobileCode;
              controller.selectedCountryCode.value = value.iso2;
            }
          },
        ),
        CustomFormWidget(
            hint: Strings.mobile,
            controller: controller.numberController,
            keyboardType: TextInputType.number,
            label: Strings.mobileNumber),
        CustomFormWidget(
            hint: Strings.formName,
            controller: controller.formNameController,
            label: Strings.formName),
        CustomFormWidget(
            hint: Strings.quantity,
            controller: controller.quantityController,
            keyboardType: TextInputType.number,
            label: Strings.quantity),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Text(
            Strings.walletCurrency,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryDarkTextColor,
            ),
          ),
        ),
        CustomDropdownMenu<UserWallet>(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            color: CustomColor.greyColor.withOpacity(0.2),
          ),
          itemsList: controller.userWalletList,
          selectMethod: controller.selectedWalletCurrency,
          onChanged: (value) {
            controller.selectedCountryCode.value = value!.currencyCode;
          },
        ),
      ],
    );
  }
}
