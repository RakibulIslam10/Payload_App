class DashboardModel {
  Message message;
  Data data;
  String type;

  DashboardModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
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

  UserInfo userInfo;
  List<Wallet> wallets;
  List<Banner> banner;
  List<PaymentGateway> paymentGateway;
  List<String> rechargeBttn;
  ProfileImagePaths profileImagePaths;
  ImagePaths gatewayImagePaths;
  ImagePaths bannerImagePaths;
  int mobileTopupCount;
  int giftcardCount;
  int addMoneyCount;

  Data({
    required this.userInfo,
    required this.wallets,
    required this.banner,
    required this.paymentGateway,
    required this.rechargeBttn,
    required this.profileImagePaths,
    required this.gatewayImagePaths,
    required this.bannerImagePaths,
    required this.mobileTopupCount,
    required this.giftcardCount,
    required this.addMoneyCount,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: UserInfo.fromJson(json["user_info"]),
    wallets: List<Wallet>.from(json["wallets"].map((x) => Wallet.fromJson(x))),
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    paymentGateway: List<PaymentGateway>.from(json["payment_gateway"].map((x) => PaymentGateway.fromJson(x))),
    rechargeBttn: List<String>.from(json["recharge_bttn"].map((x) => x)),
    profileImagePaths: ProfileImagePaths.fromJson(json["profile_image_paths"]),
    gatewayImagePaths: ImagePaths.fromJson(json["gateway_image_paths"]),
    bannerImagePaths: ImagePaths.fromJson(json["banner_image_paths"]),
    mobileTopupCount: json["mobile_topup_count"],
    giftcardCount: json["giftcard_count"],
    addMoneyCount: json["add_money_count"],
  );

  Map<String, dynamic> toJson() => {
    "user_info": userInfo.toJson(),
    "wallets": List<dynamic>.from(wallets.map((x) => x.toJson())),
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    "payment_gateway": List<dynamic>.from(paymentGateway.map((x) => x.toJson())),
    "recharge_bttn": List<dynamic>.from(rechargeBttn.map((x) => x)),
    "profile_image_paths": profileImagePaths.toJson(),
    "gateway_image_paths": gatewayImagePaths.toJson(),
    "banner_image_paths": bannerImagePaths.toJson(),
    "mobile_topup_count": mobileTopupCount,
    "giftcard_count": giftcardCount,
    "add_money_count": addMoneyCount,
  };
}

class Banner {
  String image;

  Banner({
    required this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class ImagePaths {
  String baseUrl;
  String pathLocation;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
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
  String type;
  String name;
  String title;
  String image;
  int crypto;

  PaymentGateway({
    required this.id,
    required this.type,
    required this.name,
    required this.title,
    required this.image,
    required this.crypto,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    title: json["title"],
    image: json["image"],
    crypto: json["crypto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "title": title,
    "image": image,
    "crypto": crypto,
  };
}

class ProfileImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ProfileImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ProfileImagePaths.fromJson(Map<String, dynamic> json) => ProfileImagePaths(
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

class UserInfo {
  int id;
  String firstname;
  String lastname;
  String fullname;
  String username;
  String email;
  String image;
  String mobileCode;
  String mobile;
  String fullMobile;
  int emailVerified;
  int kycVerified;
  int twoFactorVerified;
  int twoFactorStatus;
  String twoFactorSecret;

  UserInfo({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.fullname,
    required this.username,
    required this.email,
    required this.image,
    required this.mobileCode,
    required this.mobile,
    required this.fullMobile,
    required this.emailVerified,
    required this.kycVerified,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    required this.twoFactorSecret,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    username: json["username"],
    email: json["email"],
    image: json["image"]?? "",
    mobileCode: json["mobile_code"],
    mobile: json["mobile"],
    fullMobile: json["full_mobile"],
    emailVerified: json["email_verified"],
    kycVerified: json["kyc_verified"],
    twoFactorVerified: json["two_factor_verified"],
    twoFactorStatus: json["two_factor_status"],
    twoFactorSecret: json["two_factor_secret"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "fullname": fullname,
    "username": username,
    "email": email,
    "image": image,
    "mobile_code": mobileCode,
    "mobile": mobile,
    "full_mobile": fullMobile,
    "email_verified": emailVerified,
    "kyc_verified": kycVerified,
    "two_factor_verified": twoFactorVerified,
    "two_factor_status": twoFactorStatus,
    "two_factor_secret": twoFactorSecret,
  };
}

class Wallet {
  int id;
  int userId;
  int currencyId;
  double balance;
  bool status;
  DateTime createdAt;
  Currency currency;

  Wallet({
    required this.id,
    required this.userId,
    required this.currencyId,
     this.balance = 0.00,
    required this.status,
    required this.createdAt,
    required this.currency,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    userId: json["user_id"],
    currencyId: json["currency_id"],
    balance: json["balance"] != null ? json["balance"].toDouble() : 0.00,
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    currency: Currency.fromJson(json["currency"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "currency_id": currencyId,
    "balance": balance,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "currency": currency.toJson(),
  };
}

class Currency {
  int id;
  String code;
  bool both;
  bool senderCurrency;
  bool receiverCurrency;
  String editData;

  Currency({
    required this.id,
    required this.code,
    required this.both,
    required this.senderCurrency,
    required this.receiverCurrency,
    required this.editData,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    code: json["code"],
    both: json["both"],
    senderCurrency: json["senderCurrency"],
    receiverCurrency: json["receiverCurrency"],
    editData: json["editData"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "both": both,
    "senderCurrency": senderCurrency,
    "receiverCurrency": receiverCurrency,
    "editData": editData,
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
