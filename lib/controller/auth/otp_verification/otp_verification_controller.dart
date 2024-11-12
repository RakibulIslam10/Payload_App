import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/auth/otp_verify/login_otp_verify_model.dart';
import 'package:payloadui/controller/auth/sign_in/sign_in_screen_controller.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';

class OtpVerificationController extends GetxController {

  final otpController = TextEditingController();
  final controller = Get.put(SignInController());

  RxInt secondsRemaining = 59.obs;
  RxBool enableResend = true.obs;
  Timer? timer;

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  timerInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        timer?.cancel();
      }
    });
  }

  resendCode() {
    secondsRemaining.value = 59;
    enableResend.value = false;
  }

//Resend Code Timer ConDown End line

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late LoginOtpVerifyModel _loginOtpVerifyModel;

  LoginOtpVerifyModel get loginOtpVerifyModel => _loginOtpVerifyModel;

  Future<LoginOtpVerifyModel> loginOtpVerifyProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp': otpController.text,
    };

    await AuthApiServices.loginOtpVerifyApiProcess(
            body: inputBody,
            userId: controller.userId.value,
            type: controller.type.value)
        .then((value) {
      _loginOtpVerifyModel = value!;

      Get.offNamed(Routes.navigationScreen);

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _loginOtpVerifyModel;
  }
}
