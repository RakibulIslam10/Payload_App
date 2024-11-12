import 'package:payloadui/widgets/custom_dropdown.dart';

class CountryModel {
  Message message;
  Data data;
  String type;

  CountryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
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
  List<Country> countries;

  Data({
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country implements DropdownMenuModel {
  int id;
  String name;
  String mobileCode;
  String currencyName;
  String currencyCode;
  String currencySymbol;
  String iso2;

  Country({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
    required this.iso2,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
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

  @override
  String get title => name;
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
