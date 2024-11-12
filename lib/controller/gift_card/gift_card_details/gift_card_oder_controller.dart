import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/services/gift_card/gift_card_api_service.dart';
import 'package:payloadui/controller/gift_card/add_gift_card/add_gift_card_screen_controller.dart';
import 'package:payloadui/controller/gift_card/my_gift_card_controller.dart';
import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/model/gift_card/gift_card_details_model.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';

class GiftCardOderController extends GetxController {
  final controller = Get.put(AddGiftCardController());
  final myController = Get.put(MyGiftCardController());
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final amountController = TextEditingController();
  final formNameController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void onInit() {
    getGiftCardDetailsInfo();
    super.onInit();
  }

  final List<UserWallet> userWalletList = [];
  RxList<dynamic> gifCardPriceList = <dynamic>[].obs;

  RxInt selectedIndex = (0).obs;
  RxString selectedValue = ''.obs;

  RxString mobileCode = ''.obs;
  RxString selectedCountryCode = ''.obs;
  RxString selectedWalletCurrency = ''.obs;

  /// -------------------------GIFT CARD DETAILS INFO GET API PROCESS ----------------------------

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  final _isBuyLoading = false.obs;

  bool get isBuyLoading => _isBuyLoading.value;

  late GiftCardDetailsModel _giftCardDetailsModel;

  GiftCardDetailsModel get giftCardDetailsModel => _giftCardDetailsModel;

  Future<GiftCardDetailsModel> getGiftCardDetailsInfo() async {
    _isLoading.value = true;
    update();
    await GiftCardApiService.getGiftCardDetailsApi(
            controller.productId2.value.toString())
        .then((value) {
      _giftCardDetailsModel = value!;

      gifCardPriceList.clear();

      gifCardPriceList.addAll(
        _giftCardDetailsModel.data.product.fixedRecipientDenominations,
      );

      /// User Wallet
      selectedWalletCurrency.value =
          _giftCardDetailsModel.data.userWallet.first.currencyCode;
      for (var element in _giftCardDetailsModel.data.userWallet) {
        userWalletList.add(
          UserWallet(
            name: element.name,
            balance: element.balance,
            currencyCode: element.currencyCode,
            currencySymbol: element.currencySymbol,
            currencyType: element.currencyType,
            flag: element.flag,
            imagePath: element.imagePath,
            rate: element.rate,
          ),
        );
      }
      if (_giftCardDetailsModel.data.product.denominationType == "FIXED") {
        selectedValue.value = _giftCardDetailsModel
            .data.product.fixedRecipientDenominations.first
            .toString();
      }

      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _giftCardDetailsModel;
  }

  /// -------------------------GIFT CARD ODER  POST API PROCESS ----------------------------

  late CommonSuccessModel _successModel;

  CommonSuccessModel get successModel => _successModel;

  Future<CommonSuccessModel> createGiftCardApi() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'product_id': controller.productId2.value,
      'amount': amountController.text.isEmpty
          ? selectedValue.value
          : amountController.text,
      'receiver_email': emailController.text,
      'receiver_country': selectedCountryCode.value,
      'receiver_phone_code': mobileCode.value,
      'receiver_phone': numberController.text,
      'from_name': formNameController.text,
      'quantity': quantityController.text,
      'wallet_currency': selectedWalletCurrency.value,
    };

    await GiftCardApiService.createGiftCardApi(body: inputBody).then((value) {
      _successModel = value!;
      myController.getMyGifCardProcess();
      Get.offAllNamed(Routes.giftCardScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();

    return _successModel;
  }

  /// ---------CLEAR ALL TEXT FIELD------------------------------

  @override
  void onClose() {
    _clearAllField();
    super.onClose();
  }

  void _clearAllField() {
    emailController.clear();
    numberController.clear();
    amountController.clear();
    formNameController.clear();
    quantityController.clear();
  }

  @override
  void dispose() {
    amountController.dispose();
    formNameController.dispose();
    emailController.dispose();
    quantityController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
