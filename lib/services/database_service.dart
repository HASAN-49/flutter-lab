import 'package:firebase_database/firebase_database.dart';
import '../auction_item.dart';
import '../bid.dart';

class DatabaseService {
  final DatabaseReference _itemRef = FirebaseDatabase.instance.ref('items');
  final DatabaseReference _bidsRef = FirebaseDatabase.instance.ref('bids');

  Stream<List<AuctionItem>> getAuctionItems() {
    return _itemRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) {
        return [];
      }
      return data.entries
          .map((e) => AuctionItem.fromJson(Map<String, dynamic>.from(e.value)))
          .toList();
    });
  }

  void uploadItem(AuctionItem item) {
    _itemRef.push().set(item.toJson());
  }

  void placeBid(String itemId, Bid bid) {
    _bidsRef.child(itemId).push().set(bid.toJson());
  }

  void deleteAuctionItem(String itemId) {
    _itemRef.child(itemId).remove();
  }
}
