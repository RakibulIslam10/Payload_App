import 'package:payloadui/backend/services/api_endpoint.dart';
import 'package:payloadui/backend/model/bassic_setting/basic_setting_model.dart';

import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class BasicSettingsApiServices {
  static Future<BasicSettingModel?> getBasicSettingProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.basicSettingURL,
        code: 200,
      );
      if (mapResponse != null) {
        BasicSettingModel result = BasicSettingModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Basic settings get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in BasicSettingsInfoModel');
      return null;
    }
    return null;
  }
}
