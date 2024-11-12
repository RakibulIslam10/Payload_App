import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/controller/recharge_details/recharge_details_screen_controller.dart';
import 'package:payloadui/custom_assets/assets.gen.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/others/add_to_get_text_box_widget.dart';
import 'package:payloadui/widgets/common/others/custom_image_widget.dart';
import 'package:payloadui/widgets/common/others/validity_text_box_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading1_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading3_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading4_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_switch_button_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';

class OfferDetailsMobileLayoutScreen extends StatelessWidget {
  OfferDetailsMobileLayoutScreen({super.key});

  final RechargeDetailsScreenController _controller =
      Get.put(RechargeDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomWidget(),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _customDetailsContainerBoxWidget(),
          verticalSpace(Dimensions.marginSizeVertical * 0.5),
          _paymentMethodWidget(),
          verticalSpace(Dimensions.marginSizeVertical * 0.5),
          _forGiftSendBoxWidget(),
          _termsAndConditionTextWidget(),
        ],
      ),
    );
  }

  _customDetailsContainerBoxWidget() {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
      height: Dimensions.heightSize * 18.5,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.5),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            const ValidityTexBoxWidget(
              heading: Strings.gB,
              validity: Strings.validity,
              offerDetails: Strings.thisOfferIncludesBonusAndAppBonus,
            ),
            Divider(
              color: CustomColor.greyColor.withOpacity(0.25),
            ),
            CustomSwitchButtonWidget(
              title: Strings.autoRenew,
              switchValue: _controller.isSwitched,
              onToggle: _controller.toggleSwitch,
            ),
            const AddToGetTextBox(
              addText: Strings.add,
              tkText: Strings.tk,
              toGetText: Strings.toGet,
              gb5Text: Strings.gb5,
            ),
          ],
        ),
      ),
    );
  }

  _paymentMethodWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.5),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.marginSizeVertical * 0.5,
                  horizontal: Dimensions.marginSizeHorizontal * 0.5),
              height: Dimensions.heightSize * 13,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  color: CustomColor.whiteColor),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                    child: const TitleHeading3Widget(
                      text: Strings.paymentMethod,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _digitalPaymentOption(),
                  _divider(),
                  _textAndIconWidget()
                ],
              ))
        ],
      ),
    );
  }

  _forGiftSendBoxWidget() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.5,
        ),
        color: CustomColor.whiteColor,
        height: _controller.isChecked.value
            ? Dimensions.heightSize * 8
            : Dimensions.heightSize * 4,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                _userNumberTextWidget(),
                _checkBoxWidget(),
              ],
            ),
            verticalSpace(Dimensions.marginSizeVertical * 0.2),
            Visibility(
              visible: _controller.isChecked.value,
              child: Container(
                height: Dimensions.heightSize * 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: CustomColor.primaryLightScaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5)),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.copy_all_sharp),
                      hintText: Strings.number,
                      hintStyle: TextStyle(
                          color: CustomColor.greyColor.withOpacity(0.6)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _termsAndConditionTextWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      child: const TitleHeading5Widget(
        text: Strings.termsAndCondition,
        color: CustomColor.primaryLightColor,
      ),
    );
  }

  _totalAmountTextWidget() {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: const [
        TitleHeading5Widget(text: "Total Amount"),
        TitleHeading3Widget(
          text: "\$229",
          color: CustomColor.primaryLightColor,
        )
      ],
    );
  }

  _checkBoxWidget() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            activeColor: CustomColor.primaryLightColor,
            value: _controller.isChecked.value,
            onChanged: _controller.onPressedCheckbox,
          ),
        ),
        horizontalSpace(Dimensions.marginSizeHorizontal * 0.1),
        const TitleHeading4Widget(
          text: Strings.sendAsGift,
        ),
      ],
    );
  }

  _userNumberTextWidget() {
    return Row(
      children: [
        const Icon(Icons.person),
        horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
        const TitleHeading4Widget(
          text: Strings.for01987845068,
        ),
      ],
    );
  }

  _textAndIconWidget() {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.5),
          child: TitleHeading4Widget(
            text: Strings.buyWithMobileBalance,
            color: CustomColor.greyColor.withOpacity(0.6),
          ),
        ),
        _balanceTextCircleWidget()
      ],
    );
  }

  _divider() {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      child: Divider(color: CustomColor.greyColor.withOpacity(0.25)),
    );
  }

  _digitalPaymentOption() {
    return Row(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainSpaceBet,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: CustomColor.primaryLightColor,
              size: Dimensions.heightSize * 1.5,
            ),
            horizontalSpace(Dimensions.marginSizeHorizontal * 0.25),
            const TitleHeading4Widget(
              text: Strings.digitalPayment,
              color: CustomColor.primaryLightColor,
            ),
            horizontalSpace(Dimensions.marginSizeHorizontal * 1.2),
            _circleAvatarIcon(Assets.icons.group, CustomColor.circleBox),
            _circleAvatarIcon(Assets.icons.vector, CustomColor.circleBox),
            _circleAvatarIcon(Assets.icons.qRPay1.path, CustomColor.circleBox3),
            _circleAvatarIcon(Assets.icons.group1215, CustomColor.circleBox2),
            _circleAvatarIcon(Assets.icons.image4.path, CustomColor.circleBox3),
            _circleAvatarIcon(Assets.icons.group1216, CustomColor.circleBox3),
          ],
        ),
      ],
    );
  }

  _circleAvatarIcon(
    String imagePath,
    Color backgroundColor,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.widthSize * 0.5),
      child: CircleAvatar(
        radius: Dimensions.radius,
        backgroundColor: backgroundColor,
        child: CustomImageWidget(
          path: imagePath,
          height: Dimensions.heightSize,
        ),
      ),
    );
  }

  _balanceTextCircleWidget() {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.2),
      child: CircleAvatar(
        radius: Dimensions.radius * 1.4,
        backgroundColor: CustomColor.secondaryBoxColor.withOpacity(0.15),
        child: TitleHeading1Widget(
          text: "\$",
          color: CustomColor.secondaryBoxColor.withOpacity(0.5),
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.headingTextSize4,
        ),
      ),
    );
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      backgroundColor: CustomColor.whiteColor,
      Strings.offerDetails,
      titleFontWeight: FontWeight.w400,
      showBackButton: false,
      autoLeading: true,
    );
  }

  _bottomWidget() {
    return Container(
      color: CustomColor.whiteColor,
      height: Dimensions.heightSize * 9,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.5,
            vertical: Dimensions.marginSizeVertical * 0.5),
        child: Column(
          mainAxisAlignment: mainSpaceBet,
          children: [
            _totalAmountTextWidget(),
            ElevatedButton(
              onPressed: null,
              child: Text(
                Strings.continues,
              ),
            )
          ],
        ),
      ),
    );
  }
}
