import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/dashboard/dashboard_controller.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/buttons/outline_button_widget.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import '../../../controller/profile/profile_controller.dart';
import '../../../language/language.dart';
import '../../../widgets/common/appbar/primary_appbar.dart';
import '../../../widgets/common/buttons/custom_button_widget.dart';
import '../../../widgets/common/others/profile_content_box_widget.dart';
import '../../../widgets/common/text_labels/title_heading2_widget.dart';
import '../../../widgets/common/text_labels/title_heading4_widget.dart';
import '../../../widgets/common/text_labels/title_heading5_widget.dart';

class ProfileMobileLayoutScreen extends StatelessWidget {
  ProfileMobileLayoutScreen({super.key});

  final _controller = Get.put(ProfileController());
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : RefreshIndicator(
                color: CustomColor.primaryLightColor,
                backgroundColor: CustomColor.whiteColor,
                onRefresh: () => controller.getDashboardProcessApi(),
                child: _bodyWidget(context),
              ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.8),
        child: Column(
          children: [
            _editButtonWidget(),
            _profileLogoWidget(context),
            _balanceCardBoxWidget(context),
            _detailsCardWidget(context),
            _profileBoxWidget(),
            Obx(
              () => _controller.isLoading
                  ? const CustomLoadingAPI()
                  : CustomElevatedButtonWidget(
                      buttonText: Strings.logOutFromThisDevice,
                      onPressed: () {
                        Get.defaultDialog(
                          backgroundColor: CustomColor.whiteColor,
                          buttonColor: CustomColor.primaryLightColor,
                          title: Strings.logOut,
                          middleText: Strings.areYouSureYouWantToLogout,
                          textConfirm: "Yes",
                          textCancel: "No",
                          onConfirm: () {
                            _controller.signOutProcess();
                            Get.back();
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _editButtonWidget() {
    return Row(
      mainAxisAlignment: mainEnd,
      children: [
        Obx(
          () => _controller.isLoading
              ? const CustomLoadingAPI()
              : CustomOutlinedButton(
                  text: "Edit",
                  onPressed: () {
                    Get.toNamed(Routes.updateProfileScreen);
                  },
                ),
        ),
      ],
    );
  }

  _detailsCardWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical * 0.5,
          horizontal: Dimensions.marginSizeVertical * 2),
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.25),
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleSubTitleWidget(
                title: "0",
                titleFontSize: Dimensions.headingTextSize4,
                subTitle: Strings.gpPoints,
                subTitleFontSize: Dimensions.headingTextSize6,
              ),
              const TitleHeading4Widget(
                text: Strings.details,
                color: CustomColor.primaryLightColor,
              )
            ],
          ),
          VerticalDivider(
            color: CustomColor.greyColor.withOpacity(0.25),
          ),
          Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainSpaceBet,
            children: [
              TitleSubTitleWidget(
                title: "0 Account",
                titleFontSize: Dimensions.headingTextSize4,
                subTitle: Strings.linked,
                subTitleFontSize: Dimensions.headingTextSize6,
              ),
              const TitleHeading4Widget(
                text: Strings.details,
                color: CustomColor.primaryLightColor,
              )
            ],
          ),
        ],
      ),
    );
  }

  _profileBoxWidget() {
    return Column(
      children: [
        ProfileContentBoxWidget(
            title: 'TopUp - ${controller.mobileTopUpCount.value.toString()}',
            icon: Icons.phone_android),
        ProfileContentBoxWidget(
            title: 'Gift Card - ${controller.giftCardCount.value.toString()}',
            icon: Icons.card_giftcard),
        ProfileContentBoxWidget(
            title: 'Add Money - ${controller.addMoneyCount.value.toString()}',
            icon: Icons.attach_money_sharp),
      ],
    );
  }

  _balanceCardBoxWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: _balanceBoxWidget(),
      ),
    );
  }

  _profileLogoWidget(context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 10),
        border: Border.all(color: CustomColor.primaryLightColor, width: 4),
      ),
      child: CircleAvatar(
        radius: Dimensions.radius * 4,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.network(
            controller.image.value,
            fit: BoxFit.cover,
            width: Dimensions.radius * 8,
            height: Dimensions.radius * 8,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                controller.defaultImage.value,
                fit: BoxFit.cover,
                width: Dimensions.radius * 8,
                height: Dimensions.radius * 8,
              );
            },
          ),
        ),
      ),
    );

  }

  _balanceBoxWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.3),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          _balanceTextCircleWidget(),
          horizontalSpace(Dimensions.marginSizeHorizontal),
          Column(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainCenter,
            children: [
              Wrap(
                children: [
                  TitleHeading5Widget(
                    text: controller.userFullName.value,
                    color: CustomColor.primaryLightColor,
                  ),
                  const TitleHeading5Widget(
                    text: Strings.welcomeBack,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.marginSizeVertical * 0.2),
                child: TitleHeading2Widget(text: controller.fullMobile.value),
              ),
              CustomOutlinedButton(
                text: Strings.purchaseHistory,
                onPressed: () {
                  Get.toNamed(Routes.purchaseHistoryScreen);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  _balanceTextCircleWidget() {
    var walletData = controller.getDashboardInfoModel.data.wallets.first;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 10),
          border: Border.all(width: 2, color: CustomColor.primaryLightColor)),
      child: CircleAvatar(
          radius: Dimensions.radius * 4,
          backgroundColor: CustomColor.whiteColor,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              TitleHeading4Widget(
                text: double.parse(walletData.balance.toString())
                    .toStringAsFixed(2),
                color: CustomColor.primaryDarkColor,
                fontWeight: FontWeight.bold,
              ),
              TitleHeading4Widget(
                text: walletData.currency.code,
                color: CustomColor.primaryLightColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          )),
    );
  }

  _appbarWidget() {
    return PrimaryAppBar(
      Strings.myProfile,
      showBackButton: false,
      centerTitle: false,
      action: [_translatorButtonWidget()],
    );
  }

  _translatorButtonWidget() {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.5),
      child: Container(
        height: Dimensions.heightSize * 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          color: CustomColor.greyColor.withOpacity(0.28),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return SizedBox(
              width: Dimensions.widthSize * 6,
              child: Obx(
                () => CustomButtonWidget(
                  text: _controller.buttonTextList[index],
                  selectedColor: CustomColor.whiteColor,
                  backgroundColor:
                      CustomColor.primaryLightColor.withOpacity(0.8),
                  isSelected: _controller.myIndex.value == index,
                  onTap: () {
                    _controller.appbarTranslatorButtonOnChange(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
