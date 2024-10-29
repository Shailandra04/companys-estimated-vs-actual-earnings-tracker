// transcript_screen.dart
import 'package:flutter/material.dart';


class TranscriptScreen extends StatefulWidget {
  final String quarter;

  TranscriptScreen(this.quarter);

  @override
  _TranscriptScreenState createState() => _TranscriptScreenState();
}

class _TranscriptScreenState extends State<TranscriptScreen> {
  late Future<String> futureTranscript;

  @override
  void initState() {
    super.initState();
    futureTranscript = fetchTranscript(widget.quarter);
  }

  Future<String> fetchTranscript(String quarter) async {
    // Fetch the transcript from the API (replace with actual API logic)
    return "Transcript for $quarter"; // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transcript")),
      body: FutureBuilder<String>(
        future: futureTranscript,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(snapshot.data ?? ""),
          );
        },
      ),
    );
  }
}
