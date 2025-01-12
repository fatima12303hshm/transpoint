class TransactionHistory {
  final List<Transaction> sent;
  final List<Transaction> received;

  TransactionHistory({required this.sent, required this.received});

  factory TransactionHistory.fromJson(Map<String, dynamic> json) {
    return TransactionHistory(
      sent: List<Transaction>.from(
          json['sent'].map((e) => Transaction.fromJson(e))),
      received: List<Transaction>.from(
          json['received'].map((e) => Transaction.fromJson(e))),
    );
  }
}

class Transaction {
  final String name;
  final int amount;
  final String createdAt;

  Transaction(
      {required this.name, required this.amount, required this.createdAt});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      name: json['name'],
      amount: json['amount'],
      createdAt: json['created_at'] ?? '',
    );
  }
}
