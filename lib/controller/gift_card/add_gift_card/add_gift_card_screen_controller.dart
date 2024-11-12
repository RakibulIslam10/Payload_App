import 'package:get/get.dart';
import 'package:payloadui/backend/services/gift_card/gift_card_api_service.dart';
import '../../../backend/model/gift_card/all_gift_card_model.dart';
import '../../../backend/utils/api_method.dart';
import '../../auth/register/register_screen_controller.dart';

class AddGiftCardController extends GetxController {
  final controller = Get.put(RegisterController());

  List<Datum> allGiftCard = [];
  RxString selectedCountry = "Select Country".obs;
  RxString phoneCode = "".obs;
  RxString countryName = "".obs;
  RxString countryCode = ''.obs;


  RxString productId2 = "".obs;


  @override
  void onInit() {
    getAllGiftCardProcess();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late AllGiftCardModel _allGiftCardModel;

  AllGiftCardModel get allGiftCardModel => _allGiftCardModel;

  Future<AllGiftCardModel> getAllGiftCardProcess() async {
    _isLoading.value = true;
    update();
    await GiftCardApiService.getAllGiftCardApi(countryCode.value).then((value) {
      _allGiftCardModel = value!;
      saveInfo();

      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _allGiftCardModel;
  }

  void saveInfo() {
    allGiftCard.clear();
    for (var allCard in _allGiftCardModel.data.products.data) {
      allGiftCard.add(Datum(
        logoUrls: allCard.logoUrls,
        productId: allCard.productId,
        productName: allCard.productName,
      ));
    }

    update();
  }
}
