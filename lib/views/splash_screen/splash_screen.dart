import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/responsive_layout.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import '../../controller/basic_setting/basic_setting_controller.dart';
import '../../widgets/common/appbar/primary_appbar.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(BasicSettingController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: Scaffold(
      appBar: PrimaryAppBar(
        appbarSize: Dimensions.heightSize,
        '',
        backgroundColor: CustomColor.whiteColor,
      ),
      backgroundColor: CustomColor.whiteColor,
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
      bottomNavigationBar: _bottomNabBarWidget(context),
    ));
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Image.network(
        controller.splashImage.value,
        fit: BoxFit.cover,
      ),
    );
  }

  _bottomNabBarWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: TitleSubTitleWidget(
        titleColor: CustomColor.secondaryDarkTextColor,
        isCenterText: true,
        title: Strings.bundleServices,
        subTitleColor: CustomColor.secondaryDarkTextColor,
        subTitleFonWeight: FontWeight.w400,
        titleFontSize: Dimensions.headingTextSize2,
        subTitleFontSize: Dimensions.headingTextSize4,
        subTitle: Strings.mobileTopUpAirtimeAndDataBundles,
      ),
    );
  }
}
