import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/auth/two_factor/two_fa_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import 'package:payloadui/widgets/common/inputs/primary_input_filed.dart';
import 'package:payloadui/widgets/common/others/custom_copy_box_widget.dart';
import '../../utils/custom_color.dart';

class TwofaVerificationMobileLayoutScreen extends StatelessWidget {
  TwofaVerificationMobileLayoutScreen({super.key});

  final _controller = Get.put(TwoFaController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.twoFactorAuthenticator,
        autoLeading: true,
        showBackButton: false,
      ),
      body: Obx(
        () => _controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          PrimaryInputWidget(
            controller: _controller.authController,
            hint: "",
            suffixIcon: InkWell(
                onTap: () async {
                  Clipboard.setData(
                          ClipboardData(text: _controller.authController.text))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          Strings.textCopy,
                          style:
                              TextStyle(color: CustomColor.primaryLightColor),
                        ),
                      ),
                    );
                  });
                },
                child: const CustomCopyBoxWidget(icon: Icons.copy)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize),
            child: Image.network(_controller.qrCodeImage.value),
          ),
          Obx(
            () => _controller.isSubmitLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    onPressed: () {
                      _controller.twoFaStatusUpdateProcess();
                    },
                    title: _controller.status.value == 1 ? "Enable" : "Disable",
                    height: Dimensions.heightSize * 3,
                  ),
          ),
        ],
      ),
    );
  }
}
