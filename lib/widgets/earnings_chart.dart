import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stealth_frontend/generated/health.pb.dart';

class EarningsChart extends StatelessWidget {
  final List<Earning> earnings;

  const EarningsChart({super.key, required this.earnings});  // Accept earnings as a parameter

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: earnings
                .map((e) =>
                    FlSpot(e.date.toDateTime().millisecondsSinceEpoch.toDouble(), e.amount))
                .toList(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}