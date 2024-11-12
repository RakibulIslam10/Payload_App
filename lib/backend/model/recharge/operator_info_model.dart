class OperatorInfoModel {
  Message message;
  OperatorInfoModelData data;

  OperatorInfoModel({
    required this.message,
    required this.data,
  });

  factory OperatorInfoModel.fromJson(Map<String, dynamic> json) => OperatorInfoModel(
    message: Message.fromJson(json["message"]),
    data: OperatorInfoModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class OperatorInfoModelData {
  bool status;
  String message;
  DataData data;

  OperatorInfoModelData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OperatorInfoModelData.fromJson(Map<String, dynamic> json) => OperatorInfoModelData(
    status: json["status"],
    message: json["message"],
    data: DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class DataData {
  int id;
  int operatorId;
  String name;
  bool bundle;
  bool data;
  bool pin;
  bool comboProduct;
  bool supportsLocalAmounts;
  bool supportsGeographicalRechargePlans;
  String denominationType;
  String senderCurrencyCode;
  String senderCurrencySymbol;
  String destinationCurrencyCode;
  String destinationCurrencySymbol;
  int commission;
  int internationalDiscount;
  int localDiscount;
  int mostPopularAmount;
  dynamic mostPopularLocalAmount;
  int minAmount;
  int maxAmount;
  dynamic localMinAmount;
  dynamic localMaxAmount;
  Country country;
  Fx fx;
  List<String> logoUrls;
  List<dynamic> fixedAmounts;
  List<dynamic> fixedAmountsDescriptions;
  List<dynamic> localFixedAmounts;
  List<dynamic> localFixedAmountsDescriptions;
  List<dynamic> suggestedAmounts;
  List<dynamic> suggestedAmountsMap;
  Fees fees;
  List<dynamic> geographicalRechargePlans;
  List<dynamic> promotions;
  String status;
  double receiverCurrencyRate;
  String receiverCurrencyCode;
  TrxInfo trxInfo;

  DataData({
    required this.id,
    required this.operatorId,
    required this.name,
    required this.bundle,
    required this.data,
    required this.pin,
    required this.comboProduct,
    required this.supportsLocalAmounts,
    required this.supportsGeographicalRechargePlans,
    required this.denominationType,
    required this.senderCurrencyCode,
    required this.senderCurrencySymbol,
    required this.destinationCurrencyCode,
    required this.destinationCurrencySymbol,
    required this.commission,
    required this.internationalDiscount,
    required this.localDiscount,
    required this.mostPopularAmount,
    required this.mostPopularLocalAmount,
    required this.minAmount,
    required this.maxAmount,
    required this.localMinAmount,
    required this.localMaxAmount,
    required this.country,
    required this.fx,
    required this.logoUrls,
    required this.fixedAmounts,
    required this.fixedAmountsDescriptions,
    required this.localFixedAmounts,
    required this.localFixedAmountsDescriptions,
    required this.suggestedAmounts,
    required this.suggestedAmountsMap,
    required this.fees,
    required this.geographicalRechargePlans,
    required this.promotions,
    required this.status,
    required this.receiverCurrencyRate,
    required this.receiverCurrencyCode,
    required this.trxInfo,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    id: json["id"],
    operatorId: json["operatorId"],
    name: json["name"],
    bundle: json["bundle"],
    data: json["data"],
    pin: json["pin"],
    comboProduct: json["comboProduct"],
    supportsLocalAmounts: json["supportsLocalAmounts"],
    supportsGeographicalRechargePlans: json["supportsGeographicalRechargePlans"],
    denominationType: json["denominationType"],
    senderCurrencyCode: json["senderCurrencyCode"],
    senderCurrencySymbol: json["senderCurrencySymbol"],
    destinationCurrencyCode: json["destinationCurrencyCode"],
    destinationCurrencySymbol: json["destinationCurrencySymbol"],
    commission: json["commission"],
    internationalDiscount: json["internationalDiscount"],
    localDiscount: json["localDiscount"],
    mostPopularAmount: json["mostPopularAmount"],
    mostPopularLocalAmount: json["mostPopularLocalAmount"],
    minAmount: json["minAmount"],
    maxAmount: json["maxAmount"],
    localMinAmount: json["localMinAmount"],
    localMaxAmount: json["localMaxAmount"],
    country: Country.fromJson(json["country"]),
    fx: Fx.fromJson(json["fx"]),
    logoUrls: List<String>.from(json["logoUrls"].map((x) => x)),
    fixedAmounts: List<dynamic>.from(json["fixedAmounts"].map((x) => x)),
    fixedAmountsDescriptions: List<dynamic>.from(json["fixedAmountsDescriptions"].map((x) => x)),
    localFixedAmounts: List<dynamic>.from(json["localFixedAmounts"].map((x) => x)),
    localFixedAmountsDescriptions: List<dynamic>.from(json["localFixedAmountsDescriptions"].map((x) => x)),
    suggestedAmounts: List<dynamic>.from(json["suggestedAmounts"].map((x) => x)),
    suggestedAmountsMap: List<dynamic>.from(json["suggestedAmountsMap"].map((x) => x)),
    fees: Fees.fromJson(json["fees"]),
    geographicalRechargePlans: List<dynamic>.from(json["geographicalRechargePlans"].map((x) => x)),
    promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
    status: json["status"],
    receiverCurrencyRate: json["receiver_currency_rate"]?.toDouble(),
    receiverCurrencyCode: json["receiver_currency_code"],
    trxInfo: TrxInfo.fromJson(json["trx_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "operatorId": operatorId,
    "name": name,
    "bundle": bundle,
    "data": data,
    "pin": pin,
    "comboProduct": comboProduct,
    "supportsLocalAmounts": supportsLocalAmounts,
    "supportsGeographicalRechargePlans": supportsGeographicalRechargePlans,
    "denominationType": denominationType,
    "senderCurrencyCode": senderCurrencyCode,
    "senderCurrencySymbol": senderCurrencySymbol,
    "destinationCurrencyCode": destinationCurrencyCode,
    "destinationCurrencySymbol": destinationCurrencySymbol,
    "commission": commission,
    "internationalDiscount": internationalDiscount,
    "localDiscount": localDiscount,
    "mostPopularAmount": mostPopularAmount,
    "mostPopularLocalAmount": mostPopularLocalAmount,
    "minAmount": minAmount,
    "maxAmount": maxAmount,
    "localMinAmount": localMinAmount,
    "localMaxAmount": localMaxAmount,
    "country": country.toJson(),
    "fx": fx.toJson(),
    "logoUrls": List<dynamic>.from(logoUrls.map((x) => x)),
    "fixedAmounts": List<dynamic>.from(fixedAmounts.map((x) => x)),
    "fixedAmountsDescriptions": List<dynamic>.from(fixedAmountsDescriptions.map((x) => x)),
    "localFixedAmounts": List<dynamic>.from(localFixedAmounts.map((x) => x)),
    "localFixedAmountsDescriptions": List<dynamic>.from(localFixedAmountsDescriptions.map((x) => x)),
    "suggestedAmounts": List<dynamic>.from(suggestedAmounts.map((x) => x)),
    "suggestedAmountsMap": List<dynamic>.from(suggestedAmountsMap.map((x) => x)),
    "fees": fees.toJson(),
    "geographicalRechargePlans": List<dynamic>.from(geographicalRechargePlans.map((x) => x)),
    "promotions": List<dynamic>.from(promotions.map((x) => x)),
    "status": status,
    "receiver_currency_rate": receiverCurrencyRate,
    "receiver_currency_code": receiverCurrencyCode,
    "trx_info": trxInfo.toJson(),
  };
}

class Country {
  String isoName;
  String name;

  Country({
    required this.isoName,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    isoName: json["isoName"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "isoName": isoName,
    "name": name,
  };
}

class Fees {
  int international;
  int local;
  int localPercentage;
  int internationalPercentage;

  Fees({
    required this.international,
    required this.local,
    required this.localPercentage,
    required this.internationalPercentage,
  });

  factory Fees.fromJson(Map<String, dynamic> json) => Fees(
    international: json["international"],
    local: json["local"],
    localPercentage: json["localPercentage"],
    internationalPercentage: json["internationalPercentage"],
  );

  Map<String, dynamic> toJson() => {
    "international": international,
    "local": local,
    "localPercentage": localPercentage,
    "internationalPercentage": internationalPercentage,
  };
}

class Fx {
  int rate;
  String currencyCode;

  Fx({
    required this.rate,
    required this.currencyCode,
  });

  factory Fx.fromJson(Map<String, dynamic> json) => Fx(
    rate: json["rate"],
    currencyCode: json["currencyCode"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "currencyCode": currencyCode,
  };
}

class TrxInfo {
  double fixedCharge;
  double percentCharge;
  int minLimit;
  int maxLimit;
  int monthlyLimit;
  int dailyLimit;

  TrxInfo({
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
    required this.monthlyLimit,
    required this.dailyLimit,
  });

  factory TrxInfo.fromJson(Map<String, dynamic> json) => TrxInfo(
    fixedCharge: json["fixed_charge"]?.toDouble(),
    percentCharge: json["percent_charge"]?.toDouble(),
    minLimit: json["min_limit"],
    maxLimit: json["max_limit"],
    monthlyLimit: json["monthly_limit"],
    dailyLimit: json["daily_limit"],
  );

  Map<String, dynamic> toJson() => {
    "fixed_charge": fixedCharge,
    "percent_charge": percentCharge,
    "min_limit": minLimit,
    "max_limit": maxLimit,
    "monthly_limit": monthlyLimit,
    "daily_limit": dailyLimit,
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