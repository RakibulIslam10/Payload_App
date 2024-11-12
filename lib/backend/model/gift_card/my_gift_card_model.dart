class MyGiftCardModel {
  Message message;
  Data data;

  MyGiftCardModel({
    required this.message,
    required this.data,
  });

  factory MyGiftCardModel.fromJson(Map<String, dynamic> json) => MyGiftCardModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  List<GiftCard> giftCards;

  Data({
    required this.giftCards,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    giftCards: List<GiftCard>.from(json["gift_cards"].map((x) => GiftCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "gift_cards": List<dynamic>.from(giftCards.map((x) => x.toJson())),
  };
}

class GiftCard {
  String trxId;
  String cardName;
  String cardImage;
  String receiverEmail;
  String receiverPhone;
  String cardCurrency;
  String cardInitPrice;
  String quantity;
  String cardTotalPrice;
  String cardCurrencyRate;
  String walletCurrency;
  String walletCurrencyRate;
  String payableUnitPrice;
  String payableCharge;
  String totalPayable;
  String status;

  GiftCard({
    required this.trxId,
    required this.cardName,
    required this.cardImage,
    required this.receiverEmail,
    required this.receiverPhone,
    required this.cardCurrency,
    required this.cardInitPrice,
    required this.quantity,
    required this.cardTotalPrice,
    required this.cardCurrencyRate,
    required this.walletCurrency,
    required this.walletCurrencyRate,
    required this.payableUnitPrice,
    required this.payableCharge,
    required this.totalPayable,
    required this.status,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) => GiftCard(
    trxId: json["trx_id"],
    cardName: json["card_name"],
    cardImage: json["card_image"],
    receiverEmail: json["receiver_email"],
    receiverPhone: json["receiver_phone"],
    cardCurrency: json["card_currency"],
    cardInitPrice: json["card_init_price"],
    quantity: json["quantity"],
    cardTotalPrice: json["card_total_price"],
    cardCurrencyRate: json["card_currency_rate"],
    walletCurrency: json["wallet_currency"],
    walletCurrencyRate: json["wallet_currency_rate"],
    payableUnitPrice: json["payable_unit_price"],
    payableCharge: json["payable_charge"],
    totalPayable: json["total_payable"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "trx_id": trxId,
    "card_name": cardName,
    "card_image": cardImage,
    "receiver_email": receiverEmail,
    "receiver_phone": receiverPhone,
    "card_currency": cardCurrency,
    "card_init_price": cardInitPrice,
    "quantity": quantity,
    "card_total_price": cardTotalPrice,
    "card_currency_rate": cardCurrencyRate,
    "wallet_currency": walletCurrency,
    "wallet_currency_rate": walletCurrencyRate,
    "payable_unit_price": payableUnitPrice,
    "payable_charge": payableCharge,
    "total_payable": totalPayable,
    "status": status,
  };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    success: List<String>.from(json["success"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success.map((x) => x)),
  };
}