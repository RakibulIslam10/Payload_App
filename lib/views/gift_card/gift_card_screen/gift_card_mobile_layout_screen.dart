import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/gift_card/my_gift_card_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/others/custom_cards_widget.dart';

class GiftCardMobileLayoutScreen extends StatelessWidget {
  GiftCardMobileLayoutScreen({super.key});

  final controller = Get.put(MyGiftCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
      floatingActionButton: _buttonWidget(),
    );
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.giftCard,
      showBackButton: false,
      autoLeading: true,
    );
  }

  _bodyWidget(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: controller.myGiftCard.length,
            itemBuilder: (context, index) {
              final giftCard = controller.myGiftCard[index];
              return CustomCardWidget(
                imagePath: giftCard.cardImage,
                title: giftCard.cardName,
                amount: giftCard.cardInitPrice,
                currency: giftCard.cardCurrency,
              );
            },
          ),
        ),
        if (controller.myGiftCard.isEmpty) ...[
          const Center(
            child: Text("Empty"),
          ),
        ],
      ],
    );
  }

  _buttonWidget() {
    return  FloatingActionButton(
              backgroundColor: CustomColor.primaryLightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius)),
              onPressed: () {
                Get.toNamed(Routes.addGiftCardScreen);
              },
              child: const Icon(
                Icons.add,
                color: CustomColor.whiteColor,
              ),
            );
  }
}
