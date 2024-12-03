import 'package:flutter/material.dart';
import 'services/database_service.dart';
import 'auction_item.dart';

class UploadItemScreen extends StatefulWidget {
  @override
  _UploadItemScreenState createState() => _UploadItemScreenState();
}

class _UploadItemScreenState extends State<UploadItemScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  void _uploadItem() {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    if (name.isNotEmpty && price > 0) {
      final newItem = AuctionItem(id: '', name: name, startingBid: price);
      DatabaseService().uploadItem(newItem);
      Navigator.pop(context);
    } else {
      // Show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Starting Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadItem,
              child: Text('Upload Item'),
            ),
          ],
        ),
      ),
    );
  }
}
