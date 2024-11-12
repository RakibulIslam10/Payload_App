import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/widgets/home_widgets/text_icon_row_widget.dart';
import '../../custom_assets/assets.gen.dart';
import '../../language/language.dart';
import '../../routes/routes.dart';
import '../../views/utils/custom_color.dart';
import '../../views/utils/dimensions.dart';
import '../../views/utils/size.dart';
import '../common/others/custom_image_widget.dart';
import '../common/text_labels/title_heading3_widget.dart';
import '../common/text_labels/title_heading4_widget.dart';

class BalanceBoxWidget extends StatelessWidget {
  final String currentBalance;
  final String currency;

  final String topUpCount;
  final String gifCardCount;
  final String addMoneyCount;

  const BalanceBoxWidget({
    super.key,
    required this.currentBalance,
    required this.currency,
    required this.topUpCount,
    required this.gifCardCount,
    required this.addMoneyCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.heightSize * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _balanceAndHistoryButton(),
          _gpMinuteAndSmsTextAndIconWidget(),
        ],
      ),
    );
  }

  _balanceAndHistoryButton() {
    return Row(
      children: [
        CircleAvatar(
          radius: Dimensions.radius * 2.5,
          backgroundColor: CustomColor.primaryLightColor,
          child: CustomImageWidget(
            path: Assets.icons.lucideDollarSign,
            height: Dimensions.heightSize * 2.5,
          ),
        ),
        horizontalSpace(Dimensions.marginSizeHorizontal * 0.4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleHeading4Widget(
              text: Strings.currentBalance,
              fontSize: Dimensions.headingTextSize6,
              color: CustomColor.secondaryTextColor,
              fontWeight: FontWeight.normal,
            ),
            Row(
              children: [
                TitleHeading3Widget(
                  fontSize: Dimensions.headingTextSize3 * 1.1,
                  text: currentBalance,
                ),
                horizontalSpace(Dimensions.widthSize * 0.5),
                TitleHeading3Widget(
                  fontSize: Dimensions.headingTextSize3 * 1.1,
                  text: currency,
                  color: CustomColor.primaryLightColor,
                ),
              ],
            ),
            verticalSpace(Dimensions.heightSize * 0.5),
            SizedBox(
              height: Dimensions.heightSize * 2,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: CustomColor.greyColor,
                    width: 1.2,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(Routes.purchaseHistoryScreen);
                },
                child: TitleHeading3Widget(
                  text: Strings.history,
                  fontWeight: FontWeight.normal,
                  color: CustomColor.secondaryTextColor,
                  fontSize: Dimensions.headingTextSize5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _gpMinuteAndSmsTextAndIconWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextIconRowWidget(
          text: "TopUp - $topUpCount", // Use dynamic GB count
          icon: Icon(
            Icons.phone_android,
            size: Dimensions.heightSize * 1.2,
          ),
          circleAvatarBgColor: CustomColor.circleBox,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginSizeVertical * 0.4,
          ),
          child: TextIconRowWidget(
            text: "GifCard - $gifCardCount", // Use dynamic minute count
            icon: Icon(Icons.card_giftcard,
                color: CustomColor.redColor, size: Dimensions.heightSize * 1.1),
            circleAvatarBgColor: CustomColor.circleBox2,
          ),
        ),
        TextIconRowWidget(
          text: "Add Money - $addMoneyCount", // Use dynamic SMS count
          icon: Icon(
            Icons.attach_money,
            size: Dimensions.heightSize * 1.2,
          ),
          circleAvatarBgColor: CustomColor.circleBox3,
        ),
      ],
    );
  }
}
