class Bid {
  String userId;
  double amount;

  Bid({required this.userId, required this.amount});

  // From Firebase (from JSON)
  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      userId: json['userId'],
      amount: json['amount'].toDouble(),
    );
  }

  // To Firebase (to JSON)
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'amount': amount,
    };
  }
}
