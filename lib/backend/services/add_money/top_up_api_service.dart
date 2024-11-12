import 'package:payloadui/backend/model/recharge/operator_info_model.dart';
import '../../model/common/common_success_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';
import '../../utils/logger.dart';

final log = logger(TopUpApiService);

class TopUpApiService {
  ///-----------------------DETECT OPERATOR GET PROCESS ----------------------------------------

  static Future<OperatorInfoModel?> getOperatorInfoApi(
      String mobileCode, String mobileNumber, String countryCode) async {
    final url =
        "${ApiEndpoint.topUpDetectOperator}mobile_code=$mobileCode&mobile_number=$mobileNumber&country_code=$countryCode";

    return ApiMethod(isBasic: false)
        .get(url, code: 200, showResult: true)
        .then((mapResponse) {
      if (mapResponse != null) {
        return OperatorInfoModel.fromJson(mapResponse);
      } else {
        log.e('Response from getOperatorInfoApi is null.');
        CustomSnackBar.error('Something went wrong!');
        return null;
      }
    }).catchError((error) {
      log.e('🐞 Error in getOperatorInfoApi: $error 🐞');
      CustomSnackBar.error('Something went wrong!');
      return null;
    });
  }



///-----------------------PAY CONFIRMED PROCESS ----------------------------------------

  static Future<CommonSuccessModel?> topUpPayConfirmed(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.topUpPayConfirmedURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Pay Confirmed process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Reset password process api');
      return null;
    }
    return null;
  }

}
