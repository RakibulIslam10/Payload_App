import 'package:get/get.dart';
import '../../backend/model/gift_card/my_gift_card_model.dart';
import '../../backend/services/gift_card/gift_card_api_service.dart';
import '../../backend/utils/api_method.dart';

class MyGiftCardController extends GetxController {

  List<GiftCard> myGiftCard = [];

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyGiftCardModel _myGiftCardModel;
  MyGiftCardModel get myGiftCardModel => _myGiftCardModel;

  @override
  void onInit() {
    super.onInit();
    getMyGifCardProcess();
  }

  Future<MyGiftCardModel> getMyGifCardProcess() async {
    _isLoading.value = true;
    update();
    await GiftCardApiService.getMyGiftCardApi().then((value) {
      _myGiftCardModel = value!;
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
    return _myGiftCardModel;
  }

  void saveInfo() {
    myGiftCard.clear();
    for (var myCard in _myGiftCardModel.data.giftCards) {
      myGiftCard.add(GiftCard(
        trxId: myCard.trxId,
        cardName: myCard.cardName,
        cardImage: myCard.cardImage,
        receiverEmail: myCard.receiverEmail,
        receiverPhone: myCard.receiverPhone,
        cardCurrency: myCard.cardCurrency,
        cardInitPrice: myCard.cardInitPrice,
        quantity: myCard.quantity,
        cardTotalPrice: myCard.cardTotalPrice,
        cardCurrencyRate: myCard.cardCurrencyRate,
        walletCurrency: myCard.walletCurrency,
        walletCurrencyRate: myCard.walletCurrencyRate,
        payableUnitPrice: myCard.payableUnitPrice,
        payableCharge: myCard.payableCharge,
        totalPayable: myCard.totalPayable,
        status: myCard.status,
      ));
    }
    update();
  }

}