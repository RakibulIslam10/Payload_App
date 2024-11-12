import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/views/utils/size.dart';
import 'package:payloadui/widgets/common/appbar/primary_appbar.dart';
import 'package:payloadui/widgets/common/buttons/primary_button.dart';
import '../../../controller/auth/change_password/change_password_screen_controller.dart';
import '../../../widgets/common/inputs/custom_form_widget.dart';

class ChangePasswordMobileLayoutScreen extends StatelessWidget {
  ChangePasswordMobileLayoutScreen({super.key});

  final _controller = ChangePasswordScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.changePassword,
      autoLeading: true,
      showBackButton: false,
    );
  }

  _bodyWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          _inputFormWidget(),
          verticalSpace(Dimensions.heightSize * 2),
          Obx(
            () => _controller.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.confirm,
                    onPressed: () {
                      if (_controller.formKey.currentState!.validate()) {
                        _controller.onChangePassword;
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }

  _inputFormWidget() {
    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          CustomFormWidget(
              hint: Strings.enterCurrentPassword,
              controller: _controller.currentPasswordController,
              label: Strings.currentPassword),
          CustomFormWidget(
              hint: Strings.enterNewPassword,
              controller: _controller.passwordController,
              label: Strings.enterNewPassword),
          CustomFormWidget(
              hint: Strings.enterConfirmationPassword,
              controller: _controller.confirmationPasswordController,
              label: Strings.enterConfirmationPassword),
        ],
      ),
    );
  }
}
