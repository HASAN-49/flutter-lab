class AuctionItem {
  String id;
  String name;
  double startingBid;

  AuctionItem({
    required this.id,
    required this.name,
    required this.startingBid,
  });

  // Convert Firebase data (JSON) to AuctionItem object
  factory AuctionItem.fromJson(Map<String, dynamic> json) {
    return AuctionItem(
      id: json['id'],
      name: json['name'],
      startingBid: json['startingBid'].toDouble(),
    );
  }

  // Convert AuctionItem object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startingBid': startingBid,
    };
  }
}
