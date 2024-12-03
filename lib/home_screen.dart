import 'package:flutter/material.dart';
import 'services/database_service.dart';
import 'auction_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ongoing Auctions')),
      body: StreamBuilder<List<AuctionItem>>(
        stream: DatabaseService().getAuctionItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No auctions available.'));
          }

          final auctionItems = snapshot.data!;

          return ListView.builder(
            itemCount: auctionItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(auctionItems[index].name),
                subtitle: Text('\$${auctionItems[index].startingBid}'),
                onTap: () {
                  // Navigate to auction detail screen
                },
              );
            },
          );
        },
      ),
    );
  }
}
