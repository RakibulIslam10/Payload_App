import 'package:payloadui/backend/model/wallet_recharge/payment_gateway_model.dart';
import 'package:payloadui/backend/services/api_endpoint.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class PaymentGatewayApiService {
  static Future<PaymentGatewayInfoModel?> getPaymentGatewayInfo() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.paymentGateWayURL,
        code: 200,
      );
      if (mapResponse != null) {
        PaymentGatewayInfoModel result = PaymentGatewayInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Payment Gate way info get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in TransactionModel');
      return null;
    }
    return null;
  }
}
