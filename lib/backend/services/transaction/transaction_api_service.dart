import 'package:payloadui/backend/model/transaction/transaction_history_model.dart';
import 'package:payloadui/backend/services/api_endpoint.dart';

import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class TransactionApiService {
  static Future<TransactionModel?> getTransactionHistory() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.transactionHistoryURL,
        code: 200,
      );
      if (mapResponse != null) {
        TransactionModel result = TransactionModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Transaction History get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in TransactionModel');
      return null;
    }
    return null;
  }
}
