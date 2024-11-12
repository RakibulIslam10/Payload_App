class LoginWithOtpModel {
  Message message;
  Data data;
  String type;

  LoginWithOtpModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory LoginWithOtpModel.fromJson(Map<String, dynamic> json) => LoginWithOtpModel(
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
  String type;
  UserInfo userInfo;
  List<dynamic> authorization;

  Data({
    required this.type,
    required this.userInfo,
    required this.authorization,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    userInfo: UserInfo.fromJson(json["user_info"]),
    authorization: List<dynamic>.from(json["authorization"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "user_info": userInfo.toJson(),
    "authorization": List<dynamic>.from(authorization.map((x) => x)),
  };
}

class UserInfo {
  int id;

  UserInfo({
    required this.id,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
