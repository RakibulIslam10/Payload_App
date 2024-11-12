class ForgotPasswordOtpVerifyModel {
  Message message;
  Data data;
  String type;

  ForgotPasswordOtpVerifyModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ForgotPasswordOtpVerifyModel.fromJson(Map<String, dynamic> json) => ForgotPasswordOtpVerifyModel(
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
  String token;
  String waitTime;

  Data({
    required this.token,
    required this.waitTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    waitTime: json["wait_time"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "wait_time": waitTime,
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