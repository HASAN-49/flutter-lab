import 'package:flutter/material.dart';
import 'upload_item.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadItemScreen()),
            );
          },
          child: Text('Upload New Item'),
        ),
      ),
    );
  }
}
