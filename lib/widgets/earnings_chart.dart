import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/providers/earnings_provider.dart';

class EarningsChart extends StatelessWidget {
  const EarningsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final earnings = Provider.of<EarningsProvider>(context).earnings;

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: earnings
                .map((e) =>
                    FlSpot(e.date.millisecondsSinceEpoch.toDouble(), e.amount))
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
