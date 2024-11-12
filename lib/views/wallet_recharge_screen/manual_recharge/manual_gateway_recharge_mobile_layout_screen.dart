import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/add_money/add_money_controller.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/custom_elevated_button_widget.dart';
import '../../../language/language.dart';

class ManualGatewayRechargeMobileLayoutScreen extends StatelessWidget {
  ManualGatewayRechargeMobileLayoutScreen({super.key});

  final controller = Get.put(AddMoneyController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.manualGateway,
        showBackButton: false,
        autoLeading: true,
        titleFontWeight: FontWeight.w400,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      ...controller.inputFields.map((element) {
                        return element;
                      }),
                      Obx(
                        () => controller.isConfirmLoading
                            ? const CustomLoadingAPI()
                            : CustomElevatedButtonWidget(
                                buttonText: Strings.rechargeNow,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.manualPaymentProcess();
                                  }
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
