import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'api_service.dart';

class GraphScreen extends StatefulWidget {
  final String ticker;

  GraphScreen(this.ticker);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late Future<List<Map<String, dynamic>>> futureEarnings;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureEarnings = apiService.fetchEarningsData(widget.ticker);
  }

  void _fetchEarningsTranscript(String ticker, String pricedate) async {
    var dateParts = pricedate.split('-');
    if (dateParts.length == 3) {
      String year = dateParts[0];
      // Calculate quarter based on month
      int month = int.parse(dateParts[1]);
      int quarter = ((month - 1) ~/ 3) + 1;

      try {
        var transcript = await apiService.fetchEarningsTranscript(ticker, int.parse(year), quarter);
        
        // Display the transcript in a dialog
        String transcriptText = transcript['transcript'] ?? 'No transcript available';
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Earnings Transcript for Q$quarter $year'),
              content: SingleChildScrollView(
                child: Text(transcriptText),
              ),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error fetching transcript: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Earnings for ${widget.ticker}")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureEarnings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final earningsData = snapshot.data!;
          List<double> estimated = [];
          List<double> actual = [];
          List<String> labels = [];

          for (var data in earningsData) {
            estimated.add((data['estimated_eps'] ?? 0.0) as double);
            actual.add((data['actual_eps'] ?? 0.0) as double);
            labels.add(data['pricedate'] ?? 'Unknown');
          }

          return LineChart(LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            borderData: FlBorderData(show: true),
            minX: 0,
            maxX: (labels.length - 1).toDouble(),
            minY: 0,
            maxY: (estimated.isNotEmpty
                ? (estimated.reduce((a, b) => a > b ? a : b) * 1.1)
                : 1.0),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(estimated.length, (index) => FlSpot(index.toDouble(), estimated[index])),
                isCurved: true,
                color: Colors.blue,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(show: true),
              ),
              LineChartBarData(
                spots: List.generate(actual.length, (index) => FlSpot(index.toDouble(), actual[index])),
                isCurved: true,
                color: Colors.red,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(show: true),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.blueAccent,
              ),
              touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                if (event is FlTapUpEvent && touchResponse != null && touchResponse.lineBarSpots != null) {
                  final spot = touchResponse.lineBarSpots![0];
                  String selectedPricedate = labels[spot.x.toInt()];
                  _fetchEarningsTranscript(widget.ticker, selectedPricedate);
                }
              },
            ),
          ));
        },
      ),
    );
  }
}
