import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/widgets/common/others/custom_services_box_widget.dart';

import '../../../controller/services/service_screen_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../language/language.dart';
import '../../../widgets/common/inputs/primary_input_filed.dart';
import '../../../widgets/common/text_labels/title_heading4_widget.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';


class ServicesMobileLayoutScreen extends StatelessWidget {
  ServicesMobileLayoutScreen({super.key});

  final ServicesScreenController _controller =
      Get.put(ServicesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [ _itemsCardBoxWidget(context),],
    );
  }

  _itemsCardBoxWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.4),
      height: MediaQuery.of(context).size.height * 0.43,
      width: double.maxFinite,
      color: CustomColor.whiteColor,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _customSearchBarWidget(),
          const TitleHeading4Widget(
            text: Strings.ourServices,
          ),
          _iconAndTextWidget1(),
          _iconAndTextWidget2()
        ],
      ),
    );
  }

  _customSearchBarWidget() {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.heightSize*1.5,
          bottom: Dimensions.heightSize * 1.5,
          right: Dimensions.marginSizeHorizontal,
          left: Dimensions.marginSizeHorizontal),
      child: PrimaryInputWidget(
        prefixIcon: const Icon(
          Icons.search_sharp,
          color: CustomColor.greyColor,
        ),
        controller: _controller.searchBarController,
        hint: Strings.searchPayload,
      ),
    );
  }

  _iconAndTextWidget1() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.25,
          vertical: Dimensions.marginSizeVertical * 0.4),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          CustomServicesBoxWidget(
              onPressed: () {
                Get.toNamed(Routes.giftCardScreen);
              },
              iconSize: Dimensions.heightSize * 1.65,
              iconPath: Assets.icons.membershipVip,
              title: Strings.giftCard),
          CustomServicesBoxWidget(
              onPressed: () {
               Get.toNamed(Routes.dataBundlesScreen);
              },
              iconSize: Dimensions.heightSize * 1.65,
              iconPath: Assets.icons.cloudBackUp,
              title: Strings.dataBundle),
          CustomServicesBoxWidget(
              onPressed: () {
                _controller.backToRecharge();
              },
              iconPath: Assets.icons.mobileHand,
              iconSize: Dimensions.heightSize * 1.65,
              title: Strings.recharge),
        ],
      ),
    );
  }

  _iconAndTextWidget2() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.25,
          vertical: Dimensions.marginSizeVertical * 0.5),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          CustomServicesBoxWidget(
              onPressed: () {
                Get.toNamed(Routes.dataBundlesScreen);
              },
              iconSize: Dimensions.heightSize * 1.65,
              iconPath: Assets.icons.cloudBackUp,
              title: Strings.dataBundle),
          CustomServicesBoxWidget(
              onPressed: () {
                _controller.backToRecharge();
              },
              iconPath: Assets.icons.mobileHand,
              iconSize: Dimensions.heightSize * 1.65,
              title: Strings.recharge),
          CustomServicesBoxWidget(
              onPressed: () {
                Get.toNamed(Routes.flexiPlanScreen);
              },
              iconPath: Assets.icons.grid,
              iconSize: Dimensions.heightSize * 1.4,
              title: Strings.flexiplan)
        ],
      ),
    );
  }
}
