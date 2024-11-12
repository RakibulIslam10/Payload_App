import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/auth/forgot_password/resend_code_model.dart';
import 'package:payloadui/backend/model/auth/otp_verify/forgot_pass_otp_verify_model.dart';
import 'package:payloadui/controller/auth/forgot_password/forgot_password_controller.dart';
import 'package:payloadui/routes/routes.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';

class ForgotPasswordOtpVerifyController extends GetxController {
  final controller = Get.put(ForgotPasswordController());
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

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
    secondsRemaining.value = 29;
    enableResend.value = false;
  }

  // FORGOT PASSWORD OTP VERIFY PROCESS

  RxString userToken = ''.obs;

  final _isLoading = false.obs;
  late ForgotPasswordOtpVerifyModel _forgotPasswordOtpVerifyModel;

  bool get isLoading => _isLoading.value;

  ForgotPasswordOtpVerifyModel get forgotPasswordOtpVerifyModel =>
      _forgotPasswordOtpVerifyModel;

  Future<ForgotPasswordOtpVerifyModel> forgotPassOtpVerifyProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'token': controller.myToken.value,
      'code': otpController.text,
    };

    await AuthApiServices.forgotPassOtpVerifyProcess(body: inputBody)
        .then((value) {
      _forgotPasswordOtpVerifyModel = value!;
      _saveDataLocalStorage(_forgotPasswordOtpVerifyModel);

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _forgotPasswordOtpVerifyModel;
  }

  void _saveDataLocalStorage(ForgotPasswordOtpVerifyModel forgotPasswordModel) {
    userToken.value = forgotPasswordModel.data.token;
    Get.toNamed(Routes.resetPasswordScreen);
  }





  late ResendCodeModel _resendCodeModel;

  ResendCodeModel get resendCodeModel => _resendCodeModel;

  Future<ResendCodeModel> getResendCode() async {


    try {
      final value = await AuthApiServices.getResendCode(controller.token);
      if (value != null) {
        _resendCodeModel = value;
      } else {
        log.e('Failed to fetch Resend Code data: Data is null.');
      }
    } catch (onError) {
      log.e(onError);
    } finally {
    }
    return _resendCodeModel;
  }


}
