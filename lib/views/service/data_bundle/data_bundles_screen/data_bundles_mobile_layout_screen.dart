import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';

import '../../../../controller/data_bundles/data_bundles_screen_controller.dart';
import '../../../../language/language.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/common/buttons/primary_button.dart';
import '../../../../widgets/common/inputs/primary_input_filed.dart';
import '../../../../widgets/common/text_labels/title_heading3_widget.dart';
import '../../../../widgets/common/text_labels/title_heading5_widget.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';

class DataBundlesMobileLayoutScreen extends StatelessWidget {
  DataBundlesMobileLayoutScreen({super.key});

  final DataBundlesScreenController _controller = DataBundlesScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        '',
        showBackButton: false,
        autoLeading: true,
        appbarSize: Dimensions.heightSize * 2,
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [_customSearchBarWidget(), _gridViewItems()],
      ),
    );
  }

  _customSearchBarWidget() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dimensions.heightSize),
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

  _gridViewItems() {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 15,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return _gridTextContentWidget();
        },
      ),
    );
  }

  _gridTextContentWidget() {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize * 0.5),
        child: Column(
          mainAxisAlignment: mainSpaceBet,
          children: [
            const TitleHeading3Widget(text: Strings.gB),
            const TitleHeading5Widget(
              text: (Strings.withBonus),
            ),
            const TitleHeading3Widget(
              text: Strings.uSD,
              color: CustomColor.primaryLightColor,
            ),
            const TitleHeading5Widget(
              text: (Strings.validityDays),
            ),
            _buyButton()
          ],
        ),
      ),
    );
  }

  _buyButton() {
    return SizedBox(
        height: Dimensions.heightSize * 2.2,
        width: Dimensions.widthSize * 7,
        child: PrimaryButton(
          fontSize: Dimensions.headingTextSize5,
          title: Strings.buyNow,
          onPressed: () {
            Get.toNamed(Routes.offerDetailsScreen);
          },
        ));
  }
}
