import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/recharge/operator_info_model.dart';
import 'package:payloadui/backend/services/add_money/top_up_api_service.dart';
import 'package:payloadui/controller/auth/register/register_screen_controller.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../routes/routes.dart';

class TopUpController extends GetxController {
  final controller = Get.put(RegisterController());
  final amountController = TextEditingController();
  final mobileNumberController = TextEditingController();

  RxString selectedCountry = "".obs;
  RxString mobileCode = "".obs;
  RxString operatorName = "".obs;
  RxInt operatorID = 0.obs;
  RxString countryCode = "".obs;
  RxString amount = "".obs;
  RxInt minAmount = 0.obs;
  RxInt maxAmount = 0.obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late OperatorInfoModel _operatorInfoModel;

  OperatorInfoModel get operatorInfoModel => _operatorInfoModel;

  Future<OperatorInfoModel> detectOperatorProcess() async {
    _isLoading.value = true;
    update();
    await TopUpApiService.getOperatorInfoApi(
            mobileCode.value, mobileNumberController.text, countryCode.value)
        .then((value) {
      _operatorInfoModel = value!;
      saveData(_operatorInfoModel);
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _operatorInfoModel;
  }

  ///  TOP UP PAY CONFIRMED PROCESS

  final _isSubmitLoading = false.obs;
  late CommonSuccessModel _payConfirmedModel;

  bool get isSubmitLoading => _isSubmitLoading.value;

  CommonSuccessModel get payConfirmedModel => _payConfirmedModel;

  Future<CommonSuccessModel> payConfirmedProcess() async {
    _isSubmitLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'operator_id': operatorID.value,
      'mobile_code': mobileCode.value,
      'mobile_number': mobileNumberController.text,
      'country_code': countryCode.value,
      'amount': amountController.text,
    };

    await TopUpApiService.topUpPayConfirmed(body: inputBody).then((value) {
      _payConfirmedModel = value!;
      Get.offNamed(Routes.congratulationScreen);

      _isSubmitLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isSubmitLoading.value = false;
    update();
    return _payConfirmedModel;
  }

  /// FOR CALCULATION VARIABLE

  RxString receiverCurrency = ''.obs;
  RxDouble receiverCurrencyRate = 0.0.obs;
  RxDouble rechargeAmount = 0.0.obs;
  RxDouble fixedCharge = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;

  void saveData(OperatorInfoModel operatorInfoModel) {
    rechargeAmount.value = double.parse(
        amountController.text.isEmpty ? "0.0" : amountController.text);

    operatorName.value = _operatorInfoModel.data.data.name;
    minAmount.value = _operatorInfoModel.data.data.minAmount;
    maxAmount.value = _operatorInfoModel.data.data.maxAmount;
    fixedCharge.value = _operatorInfoModel.data.data.trxInfo.fixedCharge;
    percentCharge.value = _operatorInfoModel.data.data.trxInfo.percentCharge;

    /// FOR CALCULATION
    receiverCurrency.value = operatorInfoModel.data.data.receiverCurrencyCode;
    receiverCurrencyRate.value =
        operatorInfoModel.data.data.receiverCurrencyRate;
  }

  RxDouble conversionAmount = 0.0.obs;
  RxDouble exRate = 0.0.obs;
  RxDouble totalCharge = 0.0.obs;
  RxDouble totalPayable = 0.0.obs;
  RxDouble myPercentCharge = 0.0.obs;

  void calculateAllCharges() {
    exRate.value = (1 / receiverCurrencyRate.value);
    // Calculate the conversion amount based on the exchange rate

    conversionAmount.value = exRate.value * rechargeAmount.value;

    // Calculate the percent charge based on the conversion amount

    myPercentCharge.value =
        (percentCharge.value / 100) * conversionAmount.value;

    // Calculate the total charge (fixed charge + percent charge)
    totalCharge.value = fixedCharge.value + myPercentCharge.value;

    // Calculate the total payable amount (conversion amount + total charge)
    totalPayable.value =
        conversionAmount.value + myPercentCharge.value + fixedCharge.value;
  }
}
