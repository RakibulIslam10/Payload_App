import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/controller/auth/sign_in/sign_in_screen_controller.dart';
import 'package:payloadui/routes/routes.dart';
import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';

class TwoFaOtpController extends GetxController {
  final otpController = TextEditingController();
  final controller = Get.put(SignInController());



  ///------------------------------- TWO FA OTP VERIFY PROCESS ---------------------------------------

  final _isVerifyLoading = false.obs;
  late CommonSuccessModel _twoFaVerifyModel;

  bool get isVerifyLoading => _isVerifyLoading.value;

  CommonSuccessModel get twoFaVerifyModel => _twoFaVerifyModel;

  Future<CommonSuccessModel> twoFaStatusUpdate() async {
    _isVerifyLoading.value = true;
    update();

    Map<String, String> inputBody = {'code': otpController.text};

    await AuthApiServices.twoFaVerify(
      body: inputBody,
    ).then((value) {
      _twoFaVerifyModel = value!;
      Get.offAllNamed(Routes.navigationScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isVerifyLoading.value = false;
    update();
    return _twoFaVerifyModel;
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }
}
