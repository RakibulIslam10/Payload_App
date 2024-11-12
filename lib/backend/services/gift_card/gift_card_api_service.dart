import 'package:payloadui/backend/model/common/common_success_model.dart';
import 'package:payloadui/backend/model/gift_card/all_gift_card_model.dart';
import '../../model/gift_card/gift_card_details_model.dart';
import '../../model/gift_card/my_gift_card_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class GiftCardApiService {
  ///---------------------------- GET MY GIFT CARD PROCESS---------------------------

  static Future<MyGiftCardModel?> getMyGiftCardApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.myGiftCardURL,
        code: 200,
      );
      if (mapResponse != null) {
        MyGiftCardModel result = MyGiftCardModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from My GiftCard get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in MyGiftCardModel');
      return null;
    }
    return null;
  }

  ///---------------------------- GET ALL GIFT CARD PROCESS---------------------------

  static Future<AllGiftCardModel?> getAllGiftCardApi(String countryCode) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        countryCode == '' ? ApiEndpoint.allGiftCardURL : "${ApiEndpoint.giftCardSearchURL}$countryCode",
        code: 200,
      );
      if (mapResponse != null) {
        AllGiftCardModel result = AllGiftCardModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from All GiftCard get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }








  ///---------------------------- GET GIFT CARD INFO PROCESS---------------------------


  static Future<GiftCardDetailsModel?> getGiftCardDetailsApi(
      String productId,
      ) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.giftCardDetailsURL}$productId",
        code: 200,
        showResult: false,
      );
      GiftCardDetailsModel result = GiftCardDetailsModel.fromJson(mapResponse!);
      return result;
    } catch (e) {
      log.e('🐞🐞🐞 err from gift card details info api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
  }



  ///------------------------ GIFT CARD ODER POST PROCESS---------------------------


  static Future<CommonSuccessModel?> createGiftCardApi({
    required Map<String, dynamic> body,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.giftCardOrderURL,
        body,
        showResult: true,
      );
      CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse!);
      // CustomSnackBar.success(result.message.success.first.toString());
      return result;
    } catch (e) {
      log.e('🐞🐞🐞 err from create gift card api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
  }


}
