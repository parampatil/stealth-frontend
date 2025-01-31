import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stealth_frontend/models/earning_model.dart';

class EarningsTable extends StatelessWidget {
  final List<LocalEarning> earnings;

  const EarningsTable({super.key, required this.earnings});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(
                label: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                tooltip: 'The date of the earning',
              ),
              DataColumn(
                label: Text(
                  'Amount',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                tooltip: 'The amount earned',
                numeric: true,
              ),
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                tooltip: 'Earning ID',
              ),
            ],
            rows: earnings.map((earning) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      DateFormat('MMM dd, yyyy').format(earning.date),
                    ),
                  ),
                  DataCell(
                    Text(
                      NumberFormat.currency(symbol: '\$').format(earning.amount),
                      style: TextStyle(
                        color: earning.amount >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      earning.earningId,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
