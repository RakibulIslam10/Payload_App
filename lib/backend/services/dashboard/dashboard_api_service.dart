import '../api_endpoint.dart';
import '../../model/dashboard/dashboard_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class DashboardApiService{
  static Future<DashboardModel?> getDashboardInfoApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.userDashboardURL,
        code: 200,
      );
      if (mapResponse != null) {
        DashboardModel result = DashboardModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from  get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

}