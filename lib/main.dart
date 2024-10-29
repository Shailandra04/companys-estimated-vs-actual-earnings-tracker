import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'graph_screen.dart';
import 'transcript_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earnings Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/graph': (context) => GraphScreen(ModalRoute.of(context)!.settings.arguments as String),
        '/transcript': (context) => TranscriptScreen(ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
