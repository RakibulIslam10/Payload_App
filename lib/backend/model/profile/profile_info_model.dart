class ProfileInfoModel {
  Message message;
  Data data;
  String type;

  ProfileInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => ProfileInfoModel(
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
  Instructions instructions;
  UserInfo userInfo;
  ImagePaths imagePaths;
  List<Country> countries;

  Data({
    required this.instructions,
    required this.userInfo,
    required this.imagePaths,
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    instructions: Instructions.fromJson(json["instructions"]),
    userInfo: UserInfo.fromJson(json["user_info"]),
    imagePaths: ImagePaths.fromJson(json["image_paths"]),
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "instructions": instructions.toJson(),
    "user_info": userInfo.toJson(),
    "image_paths": imagePaths.toJson(),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
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
}

class ImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
    baseUrl: json["base_url"],
    pathLocation: json["path_location"],
    defaultImage: json["default_image"],
  );

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "path_location": pathLocation,
    "default_image": defaultImage,
  };
}

class Instructions {
  String kycVerified;

  Instructions({
    required this.kycVerified,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
    kycVerified: json["kyc_verified"],
  );

  Map<String, dynamic> toJson() => {
    "kyc_verified": kycVerified,
  };
}

class UserInfo {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String mobileCode;
  String mobile;
  String? image;
  String country;
  Kyc kyc;

  UserInfo({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobileCode,
    required this.mobile,
     this.image,
    required this.country,
    required this.kyc,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    mobileCode: json["mobile_code"],
    mobile: json["mobile"],
    image: json["image"] ?? '',
    country: json["country"],
    kyc: Kyc.fromJson(json["kyc"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
    "email": email,
    "mobile_code": mobileCode,
    "mobile": mobile,
    "image": image,
    "country": country,
    "kyc": kyc.toJson(),
  };
}

class Kyc {
  List<Datum> data;
  String rejectReason;

  Kyc({
    required this.data,
    required this.rejectReason,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    rejectReason: json["reject_reason"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "reject_reason": rejectReason,
  };
}

class Datum {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;
  String value;

  Datum({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
    required this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    label: json["label"],
    name: json["name"],
    required: json["required"],
    validation: Validation.fromJson(json["validation"]),
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "label": label,
    "name": name,
    "required": required,
    "validation": validation.toJson(),
    "value": value,
  };
}

class Validation {
  dynamic max;
  List<String> mimes;
  int min;
  List<String> options;
  bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
    max: json["max"],
    mimes: List<String>.from(json["mimes"].map((x) => x)),
    min: json["min"],
    options: List<String>.from(json["options"].map((x) => x)),
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "max": max,
    "mimes": List<dynamic>.from(mimes.map((x) => x)),
    "min": min,
    "options": List<dynamic>.from(options.map((x) => x)),
    "required": required,
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