import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/inputs/custom_amount_input_widget.dart';
import 'package:payloadui/widgets/common/appbar/custom_appbar_widget.dart';
import 'package:payloadui/widgets/common/others/custom_info_card_widget.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/dashboard/dashboard_controller.dart';
import '../../controller/wallet_recharge/wallet_recharge_screen_controller.dart';
import '../../language/language.dart';
import '../../widgets/common/text_labels/title_heading2_widget.dart';
import '../../widgets/home_widgets/balance_box_widget.dart';
import '../../widgets/home_widgets/payment_option_widget.dart';
import '../../widgets/home_widgets/search_bar_and_slider_image_box_widget.dart';
import '../drawer_menu_screen/drawer_menu_mobile_layout_screen.dart';

class DashboardMobileScreenLayout extends StatelessWidget {
  DashboardMobileScreenLayout({
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(DashboardController());
  final wallerController = Get.put(WalletRechargeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const MyDrawerMenu(),
      body: Obx(
        () => controller.isLoading && wallerController.isLoading
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
      child: Column(
        children: [
          appBarWidget(context),
          searchBarAndSliderImageBox(),
          _balanceRelatedAllWidget(context),
          _myOfferBoxWidget(context)
        ],
      ),
    );
  }

  appBarWidget(BuildContext context) {
    return CustomAppBarWidget(
      defaultImage: controller.defaultImage.value,
      profilePath: controller.image.value,
      title: controller.userFullName.value,
      subtitle: controller.fullMobile.value,
      drawerIcon: Icons.menu,
      onTap: () {
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  searchBarAndSliderImageBox() {
    return SearchBarAndSliderImageBoxWidget(
      searchBarController: controller.searchBarController,
      pageController: controller.pageController,
      imageList: controller.imageList,
      currentIndex: controller.currentIndex,
    );
  }

  _balanceRelatedAllWidget(context) {
    var walletData = controller.getDashboardInfoModel.data.wallets.first;
    var amountsList = controller.getDashboardInfoModel.data.rechargeBttn;

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.5,
        ),
        color: CustomColor.whiteColor,
        child: Column(
          children: [
            BalanceBoxWidget(
              currency: controller.currency.value,
              currentBalance: double.parse(walletData.balance.toString())
                  .toStringAsFixed(2),
              topUpCount: controller.mobileTopUpCount.value.toString(),
              gifCardCount: controller.giftCardCount.value.toString(),
              addMoneyCount: controller.addMoneyCount.value.toString(),
            ),
            Divider(color: CustomColor.greyColor.withOpacity(0.4)),
            RechargeAmountInputWidget(
              fieldController: controller.inputAmountController,
              rechargeAmounts: amountsList.take(4).toList(),
              onAmountSelected: (value) {
                controller.inputAmountController.text = value;
                controller.selectedAmount.value = value;

              },
            ),
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                ...List.generate(
                  wallerController.paymentGatewayInfoList.take(5).length,
                  (index) {
                    final data = wallerController.paymentGatewayInfoList[index];
                    return PaymentOptionWidget(
                        onTap: () {
                          Get.toNamed(Routes.walletRechargeScreen);
                        },
                        imagePath:
                            "${wallerController.imageUrls.value}/${data.image}");
                  },
                ),
                _buttonWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buttonWidget() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.heightSize * 0.5, left: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.primaryLightColor,
            foregroundColor: CustomColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
          ),
          onPressed: () {
            Get.toNamed(Routes.walletRechargeScreen);
          },
          child: Text(
            Strings.addMoney,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.headingTextSize5,
            ),
          ),
        ),
      ),
    );
  }

  _myOfferBoxWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColor.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal,
            vertical: Dimensions.marginSizeVertical * 0.5),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            const TitleHeading2Widget(
              text: Strings.myOffers,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace(Dimensions.heightSize),
            const CustomInfoCardWidget(
              title: Strings.unlimitedLife,
              subtitle: Strings.uninterruptedInternet,
              validity: Strings.validityDays,
              buttonText: Strings.buyNow,
            )
          ],
        ),
      ),
    );
  }
}
