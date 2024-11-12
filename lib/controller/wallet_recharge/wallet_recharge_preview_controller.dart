import 'package:get/get.dart';
import 'package:payloadui/backend/services/add_money/add_money_api_service.dart';
import 'package:payloadui/controller/wallet_recharge/wallet_recharge_screen_controller.dart';
import 'package:payloadui/views/web_view/web_view_screen.dart';
import '../../backend/model/add_money/add_money_automatic_model.dart';

class WalletRechargePreviewController extends GetxController {
  final controller = Get.put(WalletRechargeController());


  /// AUTOMATIC PAYMENT PROCESS

  RxDouble amount = 0.0.obs;
  RxString paymentMethod = "".obs;
  RxString currency = "".obs;
  RxString webUrls = ''.obs;
  RxString userSelectedCurrency = ''.obs;

  final _isLoading = false.obs;
  late AddMoneyAutomaticModel _addMoneyAutomaticModel;

  bool get isLoading => _isLoading.value;

  AddMoneyAutomaticModel get automaticGatewayModel => _addMoneyAutomaticModel;

  Future<AddMoneyAutomaticModel> automaticGatewayProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': controller.amountController.text,
      'currency': controller.alias.value,
      'invoice': controller.getInvoiceChecked.value,
    };

    await AddMoneyApiServices.automaticGatewayApi(body: inputBody)
        .then((value) {
      _addMoneyAutomaticModel = value!;
      Get.to(WebViewScreen(
          url: _addMoneyAutomaticModel.data.redirectUrl,
          title: controller.selectedGatewayName.value));
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _addMoneyAutomaticModel;
  }

  void saveData() {
    amount.value = double.parse(controller.amountController.text.isEmpty
        ? "0.0"
        : controller.amountController.text);

    paymentMethod.value = controller.selectedGatewayName.value;
    currency.value = controller.controller.currency.value;
    userSelectedCurrency.value = controller.selectedCurrency.value;
  }

  /// FOR CALCULATION VARIABLE

  RxDouble conversionAmount = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble totalPayable = 0.0.obs;
  RxDouble totalCharge = 0.0.obs;

  void calculateAllCharges() {
    // Calculate the conversion amount
    conversionAmount.value = controller.exRent.value * amount.value;

    // Calculate the percent charge based on the conversion amount
    percentCharge.value =
        controller.percentCharge.value / 100 * conversionAmount.value;

    // Calculate the total charge
    totalCharge.value = controller.fixeCharge.value + percentCharge.value;

    // Calculate the total payable amount
    totalPayable.value = conversionAmount.value + totalCharge.value;
  }
}
