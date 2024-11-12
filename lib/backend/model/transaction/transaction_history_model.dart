class TransactionModel {
  Message? message;
  Data? data;
  String type;

  TransactionModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    message: json["message"] != null ? Message.fromJson(json["message"]) : null,
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    type: json["type"] ?? '', // Default empty string if null
  );

  Map<String, dynamic> toJson() => {
    "message": message?.toJson(),
    "data": data?.toJson(),
    "type": type,
  };
}

class Data {
  Instructions? instructions;
  List<String> transactionTypes;
  List<Transaction> transactions;

  Data({
    required this.instructions,
    required this.transactionTypes,
    required this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    instructions: json["instructions"] != null
        ? Instructions.fromJson(json["instructions"])
        : null,
    transactionTypes: List<String>.from(json["transaction_types"]?.map((x) => x) ?? []),
    transactions: List<Transaction>.from(
      json["transactions"]?.map((x) => Transaction.fromJson(x)) ?? [],
    ),
  );

  Map<String, dynamic> toJson() => {
    "instructions": instructions?.toJson(),
    "transaction_types": List<dynamic>.from(transactionTypes.map((x) => x)),
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Instructions {
  String slug;
  String status;

  Instructions({
    required this.slug,
    required this.status,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
    slug: json["slug"] ?? '', // Default empty string if null
    status: json["status"] ?? '', // Default empty string if null
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "status": status,
  };
}

class Transaction {
  String type;
  String trxId;
  dynamic adminId;
  String requestCurrency;
  String receiveAmount;
  int status;
  dynamic callbackRef;
  String invoice;
  DateTime createdAt;

  Transaction({
    required this.type,
    required this.trxId,
    required this.adminId,
    required this.requestCurrency,
    required this.receiveAmount,
    required this.status,
    required this.callbackRef,
    required this.invoice,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    type: json["type"] ?? '', // Default empty string if null
    trxId: json["trx_id"] ?? '', // Default empty string if null
    adminId: json["admin_id"], // Nullable
    requestCurrency: json["request_currency"] ?? '', // Default empty string if null
    receiveAmount: json["receive_amount"] ?? '', // Default empty string if null
    status: json["status"] ?? 0, // Default to 0 if null
    callbackRef: json["callback_ref"], // Nullable
    invoice: json["invoice"] ?? '', // Default empty string if null
    createdAt: DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(), // Default to current date if null
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "trx_id": trxId,
    "admin_id": adminId,
    "request_currency": requestCurrency,
    "receive_amount": receiveAmount,
    "status": status,
    "callback_ref": callbackRef,
    "invoice": invoice,
    "created_at": createdAt.toIso8601String(),
  };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    success: List<String>.from(json["success"]?.map((x) => x) ?? []), // Handle null list
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success.map((x) => x)),
  };
}
