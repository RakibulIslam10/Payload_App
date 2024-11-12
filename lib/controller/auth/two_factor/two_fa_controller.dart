import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/services/auth/auth_api_service.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/two_fa/two_fa_info_model.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';

class TwoFaController extends GetxController {
  final authController = TextEditingController();

  @override
  void onInit() {
    getTwoFaInfo();
    super.onInit();
  }

  RxString qrCodeImage = ''.obs;
  RxString qrSecretCode = ''.obs;
  RxInt status = 0.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late TwoFaInfoModel _twoFaInfoModelData;

  TwoFaInfoModel get twoFaInfoModelData => _twoFaInfoModelData;

  Future<TwoFaInfoModel> getTwoFaInfo() async {
    _isLoading.value = true;
    update();

    await AuthApiServices.getTwoFAInfoAPi().then((value) {
      _twoFaInfoModelData = value!;
      _setData(_twoFaInfoModelData);
      authController.text = qrSecretCode.value;
      _isLoading.value = false;
      update();
    }).catchError(
      (onError) {
        log.e(onError);
      },
    );
    return _twoFaInfoModelData;
  }

  void gotoOtp() {
    Get.toNamed(Routes.otpVerificationScreen);
  }

  _setData(TwoFaInfoModel twoFaInfoModel) {
    qrSecretCode.value = twoFaInfoModel.data.qrSecret;
    status.value = twoFaInfoModel.data.status;
    qrCodeImage.value = twoFaInfoModel.data.qrCode;
  }

// => Two fa status Update

  final _isSubmitLoading = false.obs;
  late CommonSuccessModel _twoFaSubmitModel;

  bool get isSubmitLoading => _isSubmitLoading.value;

  CommonSuccessModel get twoFaSubmitModel => _twoFaSubmitModel;

  Future<CommonSuccessModel> twoFaStatusUpdateProcess() async {
    _isSubmitLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'status': status.value,
    };

    await AuthApiServices.twoFaUpdate(
      body: inputBody,
    ).then((value) {
      _twoFaSubmitModel = value!;
      getTwoFaInfo();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isSubmitLoading.value = false;
    update();
    return _twoFaSubmitModel;
  }
}
