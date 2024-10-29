import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // API endpoints
  final String earningsCalendarUrl = 'https://api.api-ninjas.com/v1/earningscalendar';
  final String earningsTranscriptUrl = 'https://api.api-ninjas.com/v1/earningstranscript';

  // Your API key
  final String apiKey = 'Qpn9jXsJSbgk7Zwvx/w30w==tJLoSKCeSUfidSQ0'; // Your API key

  // Fetch earnings data for the given ticker
  Future<List<Map<String, dynamic>>> fetchEarningsData(String ticker) async {
    final response = await http.get(
      Uri.parse('$earningsCalendarUrl?ticker=$ticker'),
      headers: {
        'X-Api-Key': apiKey, // Set your API key in the headers
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load earnings data: ${response.reasonPhrase}');
    }
  }

  // Fetch earnings transcript for the given ticker, year, and quarter
  Future<Map<String, dynamic>> fetchEarningsTranscript(String ticker, int year, int quarter) async {
    final response = await http.get(
      Uri.parse('$earningsTranscriptUrl?ticker=$ticker&year=$year&quarter=$quarter'),
      headers: {
        'X-Api-Key': apiKey, // Set your API key in the headers
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the single map directly
    } else {
      throw Exception('Failed to load earnings transcript: ${response.reasonPhrase}');
    }
  }
}
