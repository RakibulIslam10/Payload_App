import 'package:payloadui/widgets/custom_dropdown.dart';

class PaymentGatewayInfoModel {
  Message message;
  Data data;
  String type;

  PaymentGatewayInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory PaymentGatewayInfoModel.fromJson(Map<String, dynamic> json) => PaymentGatewayInfoModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
    "data": data.toJson(),
    "type": type,
  };
}

class Data {
  List<PaymentGateway> paymentGateways;
  ImagePath imagePath;

  Data({
    required this.paymentGateways,
    required this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentGateways: List<PaymentGateway>.from(json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
    imagePath: ImagePath.fromJson(json["image_path"]),
  );

  Map<String, dynamic> toJson() => {
    "payment_gateways": List<dynamic>.from(paymentGateways.map((x) => x.toJson())),
    "image_path": imagePath.toJson(),
  };
}

class ImagePath {
  String baseUrl;
  String pathLocation;

  ImagePath({
    required this.baseUrl,
    required this.pathLocation,
  });

  factory ImagePath.fromJson(Map<String, dynamic> json) => ImagePath(
    baseUrl: json["base_url"],
    pathLocation: json["path_location"],
  );

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "path_location": pathLocation,
  };
}

class PaymentGateway {
  int id;
  Type type;
  String name;
  String image;
  int crypto;
  String? desc;
  int status;
  List<Currency> currencies;

  PaymentGateway({
    required this.id,
    required this.type,
    required this.name,
    required this.image,
    required this.crypto,
    required this.desc,
    required this.status,
    required this.currencies,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
    id: json["id"],
    type: typeValues.map[json["type"]]!,
    name: json["name"],
    image: json["image"],
    crypto: json["crypto"],
    desc: json["desc"],
    status: json["status"],
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": typeValues.reverse[type],
    "name": name,
    "image": image,
    "crypto": crypto,
    "desc": desc,
    "status": status,
    "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
  };
}

class Currency implements DropdownMenuModel{
  int id;
  int paymentGatewayId;
  String name;
  String alias;
  String currencyCode;
  String? currencySymbol;
  dynamic image;
  int minLimit;
  int maxLimit;
  int percentCharge;
  int fixedCharge;
  double rate;
  DateTime createdAt;
  DateTime updatedAt;

  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    required this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    paymentGatewayId: json["payment_gateway_id"],
    name: json["name"],
    alias: json["alias"],
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"],
    image: json["image"],
    minLimit: json["min_limit"],
    maxLimit: json["max_limit"],
    percentCharge: json["percent_charge"],
    fixedCharge: json["fixed_charge"],
    rate: json["rate"]?.toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "payment_gateway_id": paymentGatewayId,
    "name": name,
    "alias": alias,
    "currency_code": currencyCode,
    "currency_symbol": currencySymbol,
    "image": image,
    "min_limit": minLimit,
    "max_limit": maxLimit,
    "percent_charge": percentCharge,
    "fixed_charge": fixedCharge,
    "rate": rate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String get title => currencyCode;
}

enum Type {
  AUTOMATIC,
  MANUAL
}

final typeValues = EnumValues({
  "AUTOMATIC": Type.AUTOMATIC,
  "MANUAL": Type.MANUAL
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}