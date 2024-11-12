class TwoFaInfoModel {
  Message message;
  Data data;
  String type;

  TwoFaInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TwoFaInfoModel.fromJson(Map<String, dynamic> json) => TwoFaInfoModel(
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
  String qrCode;
  String qrSecret;
  int status;
  String message;

  Data({
    required this.qrCode,
    required this.qrSecret,
    required this.status,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        qrCode: json["qr_code"],
        qrSecret: json["qr_secret"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code": qrCode,
        "qr_secret": qrSecret,
        "status": status,
        "message": message,
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
