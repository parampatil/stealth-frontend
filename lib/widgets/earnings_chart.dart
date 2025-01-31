import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stealth_frontend/models/earning_model.dart';

class EarningsChart extends StatelessWidget {
  final List<LocalEarning> earnings;

  const EarningsChart({super.key, required this.earnings});

  List<DateTime> _generateMonthYearList(DateTime startDate, DateTime endDate) {
    List<DateTime> monthYearList = [];
    DateTime current = DateTime(startDate.year, startDate.month, 1);
    final end = DateTime(endDate.year, endDate.month, 1);

    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      monthYearList.add(current);
      current = DateTime(
        current.month == 12 ? current.year + 1 : current.year,
        current.month == 12 ? 1 : current.month + 1,
        1,
      );
    }
    return monthYearList;
  }

  @override
  Widget build(BuildContext context) {
    final sortedEarnings = List<LocalEarning>.from(earnings)
      ..sort((a, b) => a.date.compareTo(b.date));

    final minDate = sortedEarnings.first.date;
    final maxDate = sortedEarnings.last.date;
    final monthYearList = _generateMonthYearList(minDate, maxDate);

    // Calculate width based on number of months
    final chartWidth = monthYearList.length * 50.0; // 80 pixels per month

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Earnings Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: chartWidth,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey.shade200,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 80,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < monthYearList.length) {
                                final date = monthYearList[index];
                                return SideTitleWidget(
                                  meta: meta,
                                  angle: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${DateFormat.MMM().format(date)}\n${date.year}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 45,
                            interval: _calculateYAxisInterval(sortedEarnings),
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  NumberFormat.compact().format(value),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                          left: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: sortedEarnings.map((e) {
                            final monthIndex = monthYearList.indexWhere(
                                (date) =>
                                    date.year == e.date.year &&
                                    date.month == e.date.month);
                            return FlSpot(monthIndex.toDouble(), e.amount);
                          }).toList(),
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 4,
                                color: Colors.white,
                                strokeWidth: 2,
                                strokeColor: Colors.blue,
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.blue.withOpacity(0.2),
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (List<LineBarSpot> touchedSpots) {
                            return touchedSpots.map((spot) {
                              final date = monthYearList[spot.x.toInt()];
                              return LineTooltipItem(
                                '${DateFormat.yMMMM().format(date)}\n',
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: NumberFormat.currency(symbol: '\$')
                                        .format(spot.y),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            }).toList();
                          },
                        ),
                      ),
                      minX: 0,
                      maxX: (monthYearList.length - 1).toDouble(),
                      minY: 0,
                      maxY: _calculateMaxY(sortedEarnings),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateYAxisInterval(List<LocalEarning> earnings) {
    final maxAmount = earnings.map((e) => e.amount).reduce((a, b) => a > b ? a : b);
    return maxAmount / 5;
  }

  double _calculateMaxY(List<LocalEarning> earnings) {
    final maxAmount = earnings.map((e) => e.amount).reduce((a, b) => a > b ? a : b);
    return maxAmount * 1.2;
  }
}
