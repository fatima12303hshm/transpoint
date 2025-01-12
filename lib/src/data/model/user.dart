class User {
  final int id;
  final String name;
  final int balance;
   String? qrCode;

  User(
      {required this.id,
      required this.name,
      required this.balance,
      required this.qrCode});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        balance: json['balance'],
        qrCode: json['qr_code']);
  }
}
