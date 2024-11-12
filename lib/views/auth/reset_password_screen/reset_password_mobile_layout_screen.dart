import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/auth/forgot_password/reset_password_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../language/language.dart';
import '../../../widgets/common/appbar/custom_top_appbar_widget.dart';
import '../../../widgets/common/buttons/primary_button.dart';
import '../../../widgets/common/inputs/custom_form_widget.dart';
import '../../utils/dimensions.dart';

class ResetPasswordMobileLayoutScreen extends StatelessWidget {
  ResetPasswordMobileLayoutScreen({super.key});

  final _controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget());
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          TopAppBarWidget(
            icon: Icons.arrow_back,
            imagePath: Assets.logo.brandLogo.path,
          ),
          _inputFormWidget(),
          Obx(
            () => _controller.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.confirm,
                    onPressed: () {
                      if (_controller.formKey.currentState!.validate()) {
                        _controller.resetPasswordProcess();
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  _inputFormWidget() {
    return Form(
      key: _controller.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.heightSize * 2,
        ),
        child: Column(
          children: [
            CustomFormWidget(
              hint: Strings.enterNewPassword,
              controller: _controller.newPasswordController,
              label: Strings.enterNewPassword,
            ),
            CustomFormWidget(
                hint: Strings.enterConfirmPassword,
                controller: _controller.confirmPasswordController,
                label: Strings.enterConfirmPassword),
          ],
        ),
      ),
    );
  }
}
