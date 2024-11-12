import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/utils/api_method.dart';

class ChangePasswordScreenController extends GetxController{
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    super.dispose();
  }



  /// API CALL CHANGE PASSWORD


  get onChangePassword => changePasswordProcess();

  final _isLoading = false.obs;
  late CommonSuccessModel _changePasswordModel;

  bool get isLoading => _isLoading.value;
  CommonSuccessModel get changePasswordModel => _changePasswordModel;

  Future<CommonSuccessModel> changePasswordProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'current_password': currentPasswordController.text,
      'password': passwordController.text,
      'password_confirmation': confirmationPasswordController.text
    };

    await AuthApiServices.changePasswordApi(body: inputBody).then((value) {
      _changePasswordModel = value!;
      _clearInputText();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _changePasswordModel;
  }

  _clearInputText() {
    currentPasswordController.text = "";
    passwordController.text = "";
    confirmationPasswordController.text = "";
  }



}
