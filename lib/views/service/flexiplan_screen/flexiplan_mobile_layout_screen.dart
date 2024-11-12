import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/text_labels/title_sub_title_widget.dart';
import '../../../controller/flexiplan/flexiplan_button_controller.dart';
import '../../../language/language.dart';
import '../../../widgets/common/text_labels/title_heading3_widget.dart';
import '../../../widgets/flexiplan_widgets/internet_chip_box_widget.dart';
import '../../../widgets/flexiplan_widgets/minutes_chip_box_widget.dart';
import '../../../widgets/flexiplan_widgets/sms_chip_box_widget.dart';
import '../../../widgets/flexiplan_widgets/validity_chip_box_widget.dart';

class FlexiPlanMobileLayoutScreen extends StatelessWidget {
  FlexiPlanMobileLayoutScreen({super.key});

  final _controller = Get.put(FlexiplanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNabBarWidget(context),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(color: CustomColor.greyColor.withOpacity(0.5)),
          _validityBoxWidget(),
          Divider(color: CustomColor.greyColor.withOpacity(0.5)),
          _internetChipBoxWidget(),
          Divider(color: CustomColor.greyColor.withOpacity(0.5)),
          _minutesChipBoxWidget(),
          Divider(color: CustomColor.greyColor.withOpacity(0.5)),
          _smsChipBoxWidget(),
        ],
      ),
    );
  }

  _bottomNabBarWidget(BuildContext context) {
    return Container(
      color: CustomColor.whiteColor,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Row(
            children: [
              _savingsTextAndColorBoxWidget(),
              VerticalDivider(
                color: CustomColor.greenColor.withOpacity(0.5),
              ),
              _totalAmountTextWidget(),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: Dimensions.widthSize * 5,
            color: CustomColor.primaryLightColor,
            child: Icon(
              Icons.arrow_forward,
              color: CustomColor.whiteColor,
              size: Dimensions.iconSizeLarge,
            ),
          )
        ],
      ),
    );
  }

  _totalAmountTextWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Dimensions.heightSize * 0.45),
          child: TitleSubTitleWidget(
            titleFontSize: Dimensions.headingTextSize3,
            title: "৳ 181.29",
            subTitle: "7 Days | 2.5 GB | 150 Min",
            subTitleColor: CustomColor.primaryDarkColor,
            subTitleFonWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  _savingsTextAndColorBoxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.5,
          vertical: Dimensions.marginSizeVertical * 0.2),
      child: Column(
        mainAxisAlignment: mainSpaceBet,
        crossAxisAlignment: crossCenter,
        children: [
          TitleSubTitleWidget(
            title: "19%",
            subTitle: Strings.savings,
            subTitleFontSize: Dimensions.headingTextSize5,
          ),
          Wrap(
            children: [
              ...List.generate(
                4,
                (index) {
                  final colors = [
                    CustomColor.primaryLightColor,
                    CustomColor.greenColor,
                    CustomColor.yellowColor,
                    CustomColor.pinkColor
                  ];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize * 0.1),
                    child: CircleAvatar(
                      backgroundColor: colors[index],
                      radius: Dimensions.radius * 0.45,
                    ),
                  );
                },
              )
            ],
          ),
          verticalSpace(Dimensions.heightSize * 0.0),
        ],
      ),
    );
  }

  PrimaryAppBar _appbarWidget() {
    return PrimaryAppBar(
      Strings.flexiplan,
      appbarSize: Dimensions.heightSize * 3,
      centerTitle: false,
      showBackButton: false,
      autoLeading: true,
    );
  }

  _validityBoxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.15),
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          const Column(
            children: [
              TitleHeading3Widget(
                text: Strings.validityText,
              ),
            ],
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal),
          Expanded(
            child: Wrap(
              children:
                  List.generate(_controller.validityTextList.length, (index) {
                return ValidityCustomChipWidget(
                    index: index,
                    selectedValue: _controller.validitySelectedIndex,
                    text: _controller.validityTextList[index]);
              }),
            ),
          )
        ],
      ),
    );
  }

  _internetChipBoxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.15),
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          const Column(
            children: [
              TitleHeading3Widget(
                text: Strings.internet,
              ),
            ],
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal),
          Expanded(
            child: Wrap(
              children:
                  List.generate(_controller.internetPackList.length, (index) {
                return InternetCustomChipWidget(
                    index: index,
                    selectedValue: _controller.internetSelectedIndex,
                    text: _controller.internetPackList[index]);
              }),
            ),
          )
        ],
      ),
    );
  }

  _minutesChipBoxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.15),
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          const Column(
            children: [
              TitleHeading3Widget(
                text: Strings.minutes,
              ),
            ],
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal),
          Expanded(
            child: Wrap(
              children:
                  List.generate(_controller.minutesPackList.length, (index) {
                return MinutesCustomChipWidget(
                    index: index,
                    selectedValue: _controller.minutesSelectedIndex,
                    text: _controller.minutesPackList[index]);
              }),
            ),
          )
        ],
      ),
    );
  }

  _smsChipBoxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.15),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        crossAxisAlignment: crossStart,
        children: [
          const Column(
            children: [
              TitleHeading3Widget(
                text: Strings.sms,
              ),
            ],
          ),
          horizontalSpace(Dimensions.marginSizeHorizontal),
          Expanded(
            child: Wrap(
              children: List.generate(_controller.smsPackList.length, (index) {
                return SmsCustomChipWidget(
                    index: index,
                    selectedValue: _controller.smsSelectedIndex,
                    text: _controller.smsPackList[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
}
