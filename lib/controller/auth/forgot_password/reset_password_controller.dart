import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/routes/routes.dart';
import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';
import 'forgot_password_otp_verify_controller.dart';

class ResetPasswordController extends GetxController {
  final controller = Get.put(ForgotPasswordOtpVerifyController());

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// >>  Reset Password Process

  final _isLoading = false.obs;
  late CommonSuccessModel _resetPasswordModel;

  bool get isLoading => _isLoading.value;

  CommonSuccessModel get resetPasswordModel => _resetPasswordModel;

  Future<CommonSuccessModel> resetPasswordProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'token': controller.userToken.value,
      'password': newPasswordController.text,
      'password_confirmation': confirmPasswordController.text
    };

    await AuthApiServices.resetPasswordApi(body: inputBody).then((value) {
      _resetPasswordModel = value!;

      Get.offNamed(Routes.signInScreen);

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _resetPasswordModel;
  }
}
