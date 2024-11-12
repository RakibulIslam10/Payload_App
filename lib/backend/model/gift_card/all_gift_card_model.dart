class AllGiftCardModel {
  Message message;
  Data data;

  AllGiftCardModel({
    required this.message,
    required this.data,
  });

  factory AllGiftCardModel.fromJson(Map<String, dynamic> json) => AllGiftCardModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Products products;
  List<CountryElement> countries;

  Data({
    required this.products,
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: Products.fromJson(json["products"]),
    countries: List<CountryElement>.from(json["countries"].map((x) => CountryElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class CountryElement {
  int id;
  String name;
  String mobileCode;
  String currencyName;
  String currencyCode;
  String currencySymbol;
  String iso2;

  CountryElement({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
    required this.iso2,
  });

  factory CountryElement.fromJson(Map<String, dynamic> json) => CountryElement(
    id: json["id"],
    name: json["name"],
    mobileCode: json["mobile_code"],
    currencyName: json["currency_name"],
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"],
    iso2: json["iso2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile_code": mobileCode,
    "currency_name": currencyName,
    "currency_code": currencyCode,
    "currency_symbol": currencySymbol,
    "iso2": iso2,
  };
}

class Products {
  // int currentPage;
  List<Datum> data;
  // String firstPageUrl;
  // int from;
  // int lastPage;
  // String lastPageUrl;
  // List<Link> links;
  // String nextPageUrl;
  // String path;
  // int perPage;
  // dynamic prevPageUrl;
  // int to;
  // int total;

  Products({
    // required this.currentPage,
    required this.data,
    // required this.firstPageUrl,
    // required this.from,
    // required this.lastPage,
    // required this.lastPageUrl,
    // required this.links,
    // required this.nextPageUrl,
    // required this.path,
    // required this.perPage,
    //  this.prevPageUrl,
    // required this.to,
    // required this.total,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    // currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    // firstPageUrl: json["first_page_url"],
    // from: json["from"],
    // lastPage: json["last_page"],
    // lastPageUrl: json["last_page_url"],
    // links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    // nextPageUrl: json["next_page_url"],
    // path: json["path"],
    // perPage: json["per_page"],
    // prevPageUrl: json["prev_page_url"] ?? "",
    // to: json["to"],
    // total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    // "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    // "first_page_url": firstPageUrl,
    // "from": from,
    // "last_page": lastPage,
    // "last_page_url": lastPageUrl,
    // "links": List<dynamic>.from(links.map((x) => x.toJson())),
    // "next_page_url": nextPageUrl,
    // "path": path,
    // "per_page": perPage,
    // "prev_page_url": prevPageUrl,
    // "to": to,
    // "total": total,
  };
}

class Datum {
  int productId;
  String productName;
  // bool global;
  // bool supportsPreOrder;
  // double senderFee;
  // int senderFeePercentage;
  // dynamic discountPercentage;
  // DenominationType denominationType;
  // RecipientCurrencyCode recipientCurrencyCode;
  // int? minRecipientDenomination;
  // double? maxRecipientDenomination;
  // SenderCurrencyCode senderCurrencyCode;
  // double? minSenderDenomination;
  // double? maxSenderDenomination;
  // List<int> fixedRecipientDenominations;
  // List<double>? fixedSenderDenominations;
  // Map<String, double>? fixedRecipientToSenderDenominationsMap;
  // // List<dynamic>? metadata;
  List<String> logoUrls;
  // Brand brand;
  // Category category;
  // DatumCountry country;
  // RedeemInstruction redeemInstruction;

  Datum({
    required this.productId,
    required this.productName,
    // required this.global,
    // required this.supportsPreOrder,
    // required this.senderFee,
    // required this.senderFeePercentage,
    // // required this.discountPercentage,
    // required this.denominationType,
    // required this.recipientCurrencyCode,
    //  this.minRecipientDenomination,
    //  this.maxRecipientDenomination,
    // required this.senderCurrencyCode,
    //  this.minSenderDenomination,
    //  this.maxSenderDenomination,
    // required this.fixedRecipientDenominations,
    // required this.fixedSenderDenominations,
    // required this.fixedRecipientToSenderDenominationsMap,
    // // required this.metadata,
    required this.logoUrls,
    // required this.brand,
    // required this.category,
    // required this.country,
    // required this.redeemInstruction,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["productId"],
    productName: json["productName"],
    // global: json["global"],
    // supportsPreOrder: json["supportsPreOrder"],
    // senderFee: json["senderFee"]?.toDouble(),
    // senderFeePercentage: json["senderFeePercentage"],
    // // discountPercentage: json["discountPercentage"]?.toDouble(),
    // denominationType: denominationTypeValues.map[json["denominationType"]]!,
    // recipientCurrencyCode: recipientCurrencyCodeValues.map[json["recipientCurrencyCode"]]!,
    // minRecipientDenomination: json["minRecipientDenomination"]?.todouble()??"",
    // maxRecipientDenomination: json["maxRecipientDenomination"]?.todouble()??"",
    // senderCurrencyCode: senderCurrencyCodeValues.map[json["senderCurrencyCode"]]!,
    // minSenderDenomination: json["minSenderDenomination"]?.todouble()??"",
    // maxSenderDenomination: json["maxSenderDenomination"]?.todouble()??"",
    // fixedRecipientDenominations: List<int>.from(json["fixedRecipientDenominations"].map((x) => x)),
    // fixedSenderDenominations: json["fixedSenderDenominations"] == null ? [] : List<double>.from(json["fixedSenderDenominations"]!.map((x) => x?.toDouble())),
    // fixedRecipientToSenderDenominationsMap: Map.from(json["fixedRecipientToSenderDenominationsMap"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    // // metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    logoUrls: List<String>.from(json["logoUrls"].map((x) => x)),
    // brand: Brand.fromJson(json["brand"]),
    // category: Category.fromJson(json["category"]),
    // country: DatumCountry.fromJson(json["country"]),
    // redeemInstruction: RedeemInstruction.fromJson(json["redeemInstruction"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    // "global": global,
    // "supportsPreOrder": supportsPreOrder,
    // "senderFee": senderFee,
    // "senderFeePercentage": senderFeePercentage,
    // "discountPercentage": discountPercentage,
    // "denominationType": denominationTypeValues.reverse[denominationType],
    // "recipientCurrencyCode": recipientCurrencyCodeValues.reverse[recipientCurrencyCode],
    // "minRecipientDenomination": minRecipientDenomination,
    // "maxRecipientDenomination": maxRecipientDenomination,
    // "senderCurrencyCode": senderCurrencyCodeValues.reverse[senderCurrencyCode],
    // "minSenderDenomination": minSenderDenomination,
    // "maxSenderDenomination": maxSenderDenomination,
    // "fixedRecipientDenominations": List<dynamic>.from(fixedRecipientDenominations.map((x) => x)),
    // "fixedSenderDenominations": fixedSenderDenominations == null ? [] : List<dynamic>.from(fixedSenderDenominations!.map((x) => x)),
    // "fixedRecipientToSenderDenominationsMap": Map.from(fixedRecipientToSenderDenominationsMap!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    // // "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "logoUrls": List<dynamic>.from(logoUrls.map((x) => x)),
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

// class Category {
//   int id;
//   Name name;
//
//   Category({
//     required this.id,
//     required this.name,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//   };
// }

// enum Name {
//   FOOD_AND_ENTERTAINMENT,
//   SHOPPING
// }

// final nameValues = EnumValues({
//   "Food and Entertainment": Name.FOOD_AND_ENTERTAINMENT,
//   "Shopping": Name.SHOPPING
// });

// class DatumCountry {
//   String isoName;
//   String name;
//   String flagUrl;
//
//   DatumCountry({
//     required this.isoName,
//     required this.name,
//     required this.flagUrl,
//   });
//
//   factory DatumCountry.fromJson(Map<String, dynamic> json) => DatumCountry(
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

// enum DenominationType {
//   FIXED,
//   RANGE
// }

// final denominationTypeValues = EnumValues({
//   "FIXED": DenominationType.FIXED,
//   "RANGE": DenominationType.RANGE
// });

// enum RecipientCurrencyCode {
//   EUR,
//   GBP,
//   PLN,
//   USD
// }

// final recipientCurrencyCodeValues = EnumValues({
//   "EUR": RecipientCurrencyCode.EUR,
//   "GBP": RecipientCurrencyCode.GBP,
//   "PLN": RecipientCurrencyCode.PLN,
//   "USD": RecipientCurrencyCode.USD
// });

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

// enum SenderCurrencyCode {
//   BDT
// }

// final senderCurrencyCodeValues = EnumValues({
//   "BDT": SenderCurrencyCode.BDT
// });

// class Link {
//   dynamic url;
//   String label;
//   bool active;
//
//   Link({
//      this.url,
//     required this.label,
//     required this.active,
//   });
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"] ?? "",
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "label": label,
//     "active": active,
//   };
// }

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

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }