import 'package:payloadui/backend/model/add_money/add_money_paypal_model.dart';
import '../../model/add_money/add_money_automatic_model.dart';
import '../../model/add_money/manual_gateway/add_money_manual_insert_model.dart';
import '../../model/common/common_success_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';
import '../../utils/logger.dart';

final log = logger(AddMoneyApiServices);

class AddMoneyApiServices {

  ///-----------------------AUTOMATIC PAYMENT PROCESS ----------------------------------------

  static Future<AddMoneyAutomaticModel?> automaticGatewayApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.automaticPaymentURL, body, code: 200);
      if (mapResponse != null) {
        AddMoneyAutomaticModel result =
        AddMoneyAutomaticModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from Add money Automatic process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


  ///-----------------------MANUAL PAYMENT PROCESS ----------------------------------------
  static Future<AddMoneyManualInsertModel?> getManualGatewayInputFields(String alias) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
          "${ApiEndpoint.manualPaymentURL}$alias",
          code: 200,
          showResult: true
      );
      if (mapResponse != null) {
        AddMoneyManualInsertModel result = AddMoneyManualInsertModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  get AddMoney Manual Insert process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }




  ///------------------------MANUAL PAYMENT CONFIRM PROCESS ----------------------------------------

  static Future<CommonSuccessModel?> manualPaymentConfirmApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
          ApiEndpoint.manualPaymentConfirmURL, body,
          fieldList: fieldList, pathList: pathList, code: 200);

      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          'err from Add money manual payment confirm process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }


}
