import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/wallet_recharge/payment_gateway_model.dart';
import 'package:payloadui/backend/services/wallet_recharge/payment_gateway_api_service.dart';
import 'package:payloadui/controller/dashboard/dashboard_controller.dart';
import '../../backend/utils/api_method.dart';

class WalletRechargeController extends GetxController {
  final amountController = TextEditingController();
  final controller = Get.put(DashboardController());

  @override
  void onInit() {
    super.onInit();
    getPaymentGatewayInfo();
  }

  var selectPaymentIndex = (-1).obs;
  RxString selectedCurrency = 'select Currency'.obs;
  RxString selectedGatewayName = "".obs;
  RxString alias = "".obs;

  ///FOR CALCULATION
  RxDouble exRent = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble fixeCharge = 0.0.obs;

  RxString getInvoiceChecked = "off".obs;

  void toggleInvoice() {
    getInvoiceChecked.value = getInvoiceChecked.value == "off" ? "on" : "off";
  }

  void selectPaymentOption(int index) {
    selectPaymentIndex.value = index;
  }

  final _isLoading = false.obs;

  late PaymentGatewayInfoModel _paymentGatewayInfoModel;

  bool get isLoading => _isLoading.value;

  PaymentGatewayInfoModel get paymentGatewayInfoModel =>
      _paymentGatewayInfoModel;

  Future<void> getPaymentGatewayInfo() async {
    _isLoading.value = true;
    update();
    try {
      final value = await PaymentGatewayApiService.getPaymentGatewayInfo();
      if (value != null) {
        _paymentGatewayInfoModel = value;
        setData(_paymentGatewayInfoModel);
      }
    } catch (error) {
      log.e(error);
    } finally {
      _isLoading.value = false;
      update();
    }
  }

  RxString imageUrls = ''.obs;
  List<Currency> allCurrencyList = [];
  var paymentGatewayInfoList = <PaymentGateway>[].obs;

  void setData(PaymentGatewayInfoModel paymentGatewayInfoModel) {
    paymentGatewayInfoList
        .assignAll(paymentGatewayInfoModel.data.paymentGateways);

    var baseLink = paymentGatewayInfoModel.data.imagePath.baseUrl;
    var imgLocation = paymentGatewayInfoModel.data.imagePath.pathLocation;

    imageUrls.value = '$baseLink/$imgLocation';
    amountController.text = controller.selectedAmount.value;

    for (var gateways in paymentGatewayInfoModel.data.paymentGateways) {
      for (var currency in gateways.currencies) {
        allCurrencyList.add(
          Currency(
            id: currency.id,
            paymentGatewayId: currency.paymentGatewayId,
            name: currency.name,
            alias: currency.alias,
            currencyCode: currency.currencyCode,
            currencySymbol: currency.currencySymbol,
            minLimit: currency.minLimit,
            maxLimit: currency.maxLimit,
            percentCharge: currency.percentCharge,
            fixedCharge: currency.fixedCharge,
            rate: currency.rate,
            createdAt: currency.createdAt,
            updatedAt: currency.updatedAt,
            image: currency.image,
          ),
        );
      }
    }
  }
}
