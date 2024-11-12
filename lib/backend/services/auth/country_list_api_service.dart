import '../api_endpoint.dart';
import '../../model/auth/register/country_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class CountryListApiService {

  ///___________  GET COUNTRY LIST PROCESS API_____________________________

  static Future<CountryModel?> getCountryListInfoProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.countryListURL,
        code: 200,
      );
      if (mapResponse != null) {
        CountryModel result = CountryModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  Get County process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! ');
      return null;
    }
    return null;
  }
}
