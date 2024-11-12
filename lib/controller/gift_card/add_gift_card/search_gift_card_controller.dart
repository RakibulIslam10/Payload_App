// import 'package:get/get.dart';
// import 'package:payloadui/backend/services/gift_card/gift_card_api_service.dart';
// import '../../../backend/model/gift_card/search_gift_card_model.dart';
// import '../../../backend/utils/api_method.dart';
//
// class SearchGiftCardController extends GetxController {
//
//
//   RxString countryCode = ''.obs;
//
//   final _isLoading = false.obs;
//
//   bool get isLoading => _isLoading.value;
//
//   late SearchGiftCardModel _searchGiftCardModel;
//
//   SearchGiftCardModel get searchGiftCardModel => _searchGiftCardModel;
//
//   Future<SearchGiftCardModel> searchGiftCardProcess() async {
//     _isLoading.value = true;
//     update();
//
//     await GiftCardApiService.searchGiftCardApi(
//             countryCode: countryCode.value)
//         .then((value) {
//       _searchGiftCardModel = value!;
//       update();
//     }).catchError((onError) {
//       log.e(onError);
//     });
//
//     _isLoading.value = false;
//     update();
//
//     return _searchGiftCardModel;
//   }
// }
