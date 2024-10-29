// input_screen.dart
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController _tickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Company Ticker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tickerController,
              decoration: InputDecoration(labelText: 'Ticker Symbol (e.g., AAPL)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_tickerController.text.isNotEmpty) {
                  Navigator.pushNamed(context, '/graph', arguments: _tickerController.text);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
