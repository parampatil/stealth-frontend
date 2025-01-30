import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stealth_frontend/screens/earnings_chart_screen.dart';

class EarningsChart extends StatelessWidget {
  final List<Earning> earnings;

  const EarningsChart({super.key, required this.earnings});  // Accept earnings as a parameter

  @override
  Widget build(BuildContext context) {
    // Sort earnings by date
    final sortedEarnings = List<Earning>.from(earnings)
      ..sort((a, b) => a.date.compareTo(b.date));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the chart
        child: Container(
          width: sortedEarnings.length * 50.0, // Adjust the width as needed
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: sortedEarnings
                      .map((e) => FlSpot(e.date.millisecondsSinceEpoch.toDouble(), e.amount))
                      .toList(),
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,
                  belowBarData: BarAreaData(show: false),
                  dotData: FlDotData(show: true),
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                        final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                        final month = DateFormat.MMM().format(date); // Format as "Jan"
                        final year = DateFormat.y().format(date); // Format as "2023"
                        return SideTitleWidget(
                        meta: meta,
                        space: 8.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text(
                            month,
                            style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis, // Wrap text if necessary
                          ),
                          Text(
                            year,
                            style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis, // Wrap text if necessary
                          ),
                          ],
                        ),
                        );
                    },
                    reservedSize: 40,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(
                          value.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((spot) {
                      final date = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                      final monthYear = DateFormat.yMMM().format(date);
                      return LineTooltipItem(
                        '$monthYear\n${spot.y.toStringAsFixed(2)}',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
                touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                  if (event is FlTapUpEvent) {
                    // Handle tap event if needed
                  }
                },
                handleBuiltInTouches: true,
              ),
              minX: sortedEarnings.isNotEmpty ? sortedEarnings.first.date.millisecondsSinceEpoch.toDouble() : 0.0,
              maxX: sortedEarnings.isNotEmpty ? sortedEarnings.last.date.millisecondsSinceEpoch.toDouble() : 0.0,
              minY: sortedEarnings.isNotEmpty ? sortedEarnings.map((e) => e.amount).reduce((a, b) => a < b ? a : b) : 0.0,
              maxY: sortedEarnings.isNotEmpty ? sortedEarnings.map((e) => e.amount).reduce((a, b) => a > b ? a : b) : 0.0,
            ),
          ),
        ),
      ),
    );
  }
}