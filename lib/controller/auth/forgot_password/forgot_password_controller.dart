import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/auth/forgot_password/forgot_password_model.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';

class ForgotPasswordController extends GetxController {
  final numberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  // FORGOT PASSWORD SEND OTP

  RxString myToken = ''.obs;
  String token = '';

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ForgotPasswordModel _forgotPasswordModel;

  ForgotPasswordModel get loginWithPasswordModel => _forgotPasswordModel;

  Future<ForgotPasswordModel> forgotPasswordProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'credentials': numberController.text,
    };

    await AuthApiServices.forgotPasswordProcessApi(body: inputBody)
        .then((value) {
      _forgotPasswordModel = value!;
      _saveDataLocalStorage(value);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _forgotPasswordModel;
  }

  void _saveDataLocalStorage(ForgotPasswordModel forgotPasswordModel) {
    myToken.value = forgotPasswordModel.data.token;
    token = forgotPasswordModel.data.token;
    Get.toNamed(Routes.forgotPasswordOtpVerifyScreen);
  }
}
