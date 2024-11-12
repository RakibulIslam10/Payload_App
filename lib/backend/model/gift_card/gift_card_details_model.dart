import 'package:payloadui/widgets/custom_dropdown.dart';

class GiftCardDetailsModel {
  Message message;
  Data data;

  GiftCardDetailsModel({
    required this.message,
    required this.data,
  });

  factory GiftCardDetailsModel.fromJson(Map<String, dynamic> json) => GiftCardDetailsModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Product product;
  // List<ProductCurrency> productCurrency;
  List<UserWallet> userWallet;
  CardCharge cardCharge;
  // List<CountryElement> countries;

  Data({
    required this.product,
    // required this.productCurrency,
    required this.userWallet,
    required this.cardCharge,
    // required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    product: Product.fromJson(json["product"]),
    // productCurrency: List<ProductCurrency>.from(json["productCurrency"].map((x) => ProductCurrency.fromJson(x))),
    userWallet: List<UserWallet>.from(json["userWallet"].map((x) => UserWallet.fromJson(x))),
    cardCharge: CardCharge.fromJson(json["cardCharge"]),
    // countries: List<CountryElement>.from(json["countries"].map((x) => CountryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    // "productCurrency": List<dynamic>.from(productCurrency.map((x) => x.toJson())),
    "userWallet": List<dynamic>.from(userWallet.map((x) => x.toJson())),
    "cardCharge": cardCharge.toJson(),
    // "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class CardCharge {
  int id;
  String slug;
  String title;
  String fixedCharge;
  String percentCharge;
  String minLimit;
  String maxLimit;

  CardCharge({
    required this.id,
    required this.slug,
    required this.title,
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
  });

  factory CardCharge.fromJson(Map<String, dynamic> json) => CardCharge(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    fixedCharge: json["fixed_charge"],
    percentCharge: json["percent_charge"],
    minLimit: json["min_limit"],
    maxLimit: json["max_limit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title,
    "fixed_charge": fixedCharge,
    "percent_charge": percentCharge,
    "min_limit": minLimit,
    "max_limit": maxLimit,
  };
}


class Product {
  int productId;
  // String productName;
  // bool global;
  // bool supportsPreOrder;
  // double senderFee;
  // int senderFeePercentage;
  // double discountPercentage;
  String denominationType;
  // String recipientCurrencyCode;
  // dynamic minRecipientDenomination;
  // dynamic maxRecipientDenomination;
  // String senderCurrencyCode;
  // dynamic minSenderDenomination;
  // dynamic maxSenderDenomination;
  List<double> fixedRecipientDenominations;
  // List<double> fixedSenderDenominations;
  // Map<String, double> fixedRecipientToSenderDenominationsMap;
  // List<dynamic> metadata;
  // List<String> logoUrls;
  // Brand brand;
  // Category category;
  // ProductCountry country;
  // RedeemInstruction redeemInstruction;

  Product({
    required this.productId,
    // required this.productName,
    // required this.global,
    // required this.supportsPreOrder,
    // required this.senderFee,
    // required this.senderFeePercentage,
    // required this.discountPercentage,
    required this.denominationType,
    // required this.recipientCurrencyCode,
    // required this.minRecipientDenomination,
    // required this.maxRecipientDenomination,
    // required this.senderCurrencyCode,
    // required this.minSenderDenomination,
    // required this.maxSenderDenomination,
    required this.fixedRecipientDenominations,
    // required this.fixedSenderDenominations,
    // required this.fixedRecipientToSenderDenominationsMap,
    // required this.metadata,
    // required this.logoUrls,
    // required this.brand,
    // required this.category,
    // required this.country,
    // required this.redeemInstruction,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    // productName: json["productName"],
    // global: json["global"],
    // supportsPreOrder: json["supportsPreOrder"],
    // senderFee: json["senderFee"]?.toDouble(),
    // senderFeePercentage: json["senderFeePercentage"],
    // discountPercentage: json["discountPercentage"]?.toDouble(),
    denominationType: json["denominationType"],
    // recipientCurrencyCode: json["recipientCurrencyCode"],
    // minRecipientDenomination: json["minRecipientDenomination"],
    // maxRecipientDenomination: json["maxRecipientDenomination"],
    // senderCurrencyCode: json["senderCurrencyCode"],
    // minSenderDenomination: json["minSenderDenomination"],
    // maxSenderDenomination: json["maxSenderDenomination"],
    fixedRecipientDenominations: List<double>.from(json["fixedRecipientDenominations"].map((x) => x)),
    // fixedSenderDenominations: List<double>.from(json["fixedSenderDenominations"].map((x) => x?.toDouble())),
    // fixedRecipientToSenderDenominationsMap: Map.from(json["fixedRecipientToSenderDenominationsMap"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    // metadata: List<dynamic>.from(json["metadata"].map((x) => x)),
    // logoUrls: List<String>.from(json["logoUrls"].map((x) => x)),
    // brand: Brand.fromJson(json["brand"]),
    // category: Category.fromJson(json["category"]),
    // country: ProductCountry.fromJson(json["country"]),
    // redeemInstruction: RedeemInstruction.fromJson(json["redeemInstruction"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    // "productName": productName,
    // "global": global,
    // "supportsPreOrder": supportsPreOrder,
    // "senderFee": senderFee,
    // "senderFeePercentage": senderFeePercentage,
    // "discountPercentage": discountPercentage,
    "denominationType": denominationType,
    // "recipientCurrencyCode": recipientCurrencyCode,
    // "minRecipientDenomination": minRecipientDenomination,
    // "maxRecipientDenomination": maxRecipientDenomination,
    // "senderCurrencyCode": senderCurrencyCode,
    // "minSenderDenomination": minSenderDenomination,
    // "maxSenderDenomination": maxSenderDenomination,
    "fixedRecipientDenominations": List<dynamic>.from(fixedRecipientDenominations.map((x) => x)),
    // "fixedSenderDenominations": List<dynamic>.from(fixedSenderDenominations.map((x) => x)),
    // "fixedRecipientToSenderDenominationsMap": Map.from(fixedRecipientToSenderDenominationsMap).map((k, v) => MapEntry<String, dynamic>(k, v)),
    // "metadata": List<dynamic>.from(metadata.map((x) => x)),
    // "logoUrls": List<dynamic>.from(logoUrls.map((x) => x)),
    // "brand": brand.toJson(),
    // "category": category.toJson(),
    // "country": country.toJson(),
    // "redeemInstruction": redeemInstruction.toJson(),
  };
}

// class Brand {
//   int brandId;
//   String brandName;
//
//   Brand({
//     required this.brandId,
//     required this.brandName,
//   });
//
//   factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//     brandId: json["brandId"],
//     brandName: json["brandName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "brandId": brandId,
//     "brandName": brandName,
//   };
// }
//
// class Category {
//   int id;
//   String name;
//
//   Category({
//     required this.id,
//     required this.name,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }
//
// class ProductCountry {
//   String isoName;
//   String name;
//   String flagUrl;
//
//   ProductCountry({
//     required this.isoName,
//     required this.name,
//     required this.flagUrl,
//   });
//
//   factory ProductCountry.fromJson(Map<String, dynamic> json) => ProductCountry(
//     isoName: json["isoName"],
//     name: json["name"],
//     flagUrl: json["flagUrl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "isoName": isoName,
//     "name": name,
//     "flagUrl": flagUrl,
//   };
// }
//
// class RedeemInstruction {
//   String concise;
//   String verbose;
//
//   RedeemInstruction({
//     required this.concise,
//     required this.verbose,
//   });
//
//   factory RedeemInstruction.fromJson(Map<String, dynamic> json) => RedeemInstruction(
//     concise: json["concise"],
//     verbose: json["verbose"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "concise": concise,
//     "verbose": verbose,
//   };
// }
//
// class ProductCurrency {
//   String name;
//   String currencyCode;
//   int rate;
//
//   ProductCurrency({
//     required this.name,
//     required this.currencyCode,
//     required this.rate,
//   });
//
//   factory ProductCurrency.fromJson(Map<String, dynamic> json) => ProductCurrency(
//     name: json["name"],
//     currencyCode: json["currency_code"],
//     rate: json["rate"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "currency_code": currencyCode,
//     "rate": rate,
//   };
// }

class UserWallet implements DropdownMenuModel {
  String name;
  double balance;
  String currencyCode;
  String currencySymbol;
  String currencyType;
  int rate;
  String flag;
  String imagePath;

  UserWallet({
    required this.name,
    required this.balance,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyType,
    required this.rate,
    required this.flag,
    required this.imagePath,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
    name: json["name"],
    balance: json["balance"]?.toDouble(),
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"],
    currencyType: json["currency_type"],
    rate: json["rate"],
    flag: json["flag"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "balance": balance,
    "currency_code": currencyCode,
    "currency_symbol": currencySymbol,
    "currency_type": currencyType,
    "rate": rate,
    "flag": flag,
    "image_path": imagePath,
  };

  @override
  String get title => currencyCode;
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