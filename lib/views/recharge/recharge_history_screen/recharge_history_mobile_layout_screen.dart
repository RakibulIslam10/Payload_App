import 'package:flutter/material.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/others/custom_horizontal_title_widgets.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading5_widget.dart';

import '../../../widgets/common/appbar/primary_appbar.dart';

class RechargeHistoryMobileLayoutScreen extends StatelessWidget {
  const RechargeHistoryMobileLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          verticalSpace(Dimensions.marginSizeVertical),
          _horizontalTextWidget2(),
          _dataBox(),
          _horizontalTextWidget1(),
          _dataBox(),
        ],
      ),
    );
  }

  _dataBox() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.5),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: Dimensions.heightSize * 3.5,
      color: CustomColor.whiteColor,
      child: const TitleHeading5Widget(text: Strings.nothingToShowYet),
    );
  }

  _horizontalTextWidget2() {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: const [
        CustomHorizontalTitleWidget(text: Strings.sl),
        CustomHorizontalTitleWidget(text: Strings.rechargeAmount),
        CustomHorizontalTitleWidget(text: Strings.totalCost),
      ],
    );
  }

  _horizontalTextWidget1() {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: const [
        CustomHorizontalTitleWidget(text: Strings.paidWith),
        CustomHorizontalTitleWidget(text: Strings.trxTye),
        CustomHorizontalTitleWidget(text: Strings.status),
        CustomHorizontalTitleWidget(text: Strings.date),
      ],
    );
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.yourRechargeHistory,
      autoLeading: true,
      showBackButton: false,
    );
  }
}
