
import '../api_endpoint.dart';
import '../../model/common/common_success_model.dart';
import '../../model/profile/profile_info_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class ProfileApiServices {

  ///___________  GET PROFILE INFO PROCESS API_____________________________

  static Future<ProfileInfoModel?> getProfileInfoProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.profileInfoGetURL,
        code: 200,
      );
      if (mapResponse != null) {
        ProfileInfoModel result = ProfileInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  Get profile info process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in Profile Info Model');
      return null;
    }
    return null;
  }


  ///___________  UPDATE PROFILE WITH IMAGE API_____________________________

  static Future<CommonSuccessModel?> updateProfileWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
          ApiEndpoint.profileUpdateURL,
          body,
          code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
        CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            updateProfileModel.message.success.first.toString());
        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from update profile api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // update profile With Image api
  static Future<CommonSuccessModel?> updateProfileWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
        ApiEndpoint.profileUpdateURL,
        body,
        filepath,
        'image',
        code: 200,
      );

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
        CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            profileUpdateModel.message.success.first.toString());
        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }











}