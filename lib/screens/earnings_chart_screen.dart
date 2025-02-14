import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stealth_frontend/widgets/earnings_chart.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';
import 'package:stealth_frontend/models/earning_model.dart';
import 'package:stealth_frontend/utilities/earnings_utils.dart';
import 'package:stealth_frontend/widgets/sorting_filtering_buttons.dart';

class EarningsChartScreen extends StatefulWidget {
  const EarningsChartScreen({super.key});

  @override
  _EarningsChartScreenState createState() => _EarningsChartScreenState();
}

class _EarningsChartScreenState extends State<EarningsChartScreen> {
  late UserAuthProvider userAuthProvider;
  late Future<List<LocalEarning>> earningsFuture;
  int? selectedYear;
  DateTime? startDate;
  DateTime? endDate;
  String? sortColumn;
  bool isAscending = true;

  @override
  void initState() {
    super.initState();
    userAuthProvider = Provider.of<UserAuthProvider>(context, listen: false);
    earningsFuture = EarningsUtils.fetchEarnings(userAuthProvider);
  }

  Future<void> _generateDemoData() async {
    await EarningsUtils.generateDemoData(userAuthProvider);
    setState(() {
      earningsFuture = EarningsUtils.fetchEarnings(userAuthProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings Chart')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SortingFilteringButtons(
              showSortDropdown: false,
              selectedYear: selectedYear,
              startDate: startDate,
              endDate: endDate,
              sortColumn: sortColumn,
              isAscending: isAscending,
              onYearSelected: (year) {
                setState(() {
                  selectedYear = year;
                  startDate = null;
                  endDate = null;
                });
              },
              onDateRangeSelected: (start, end) {
                setState(() {
                  startDate = start;
                  endDate = end;
                  selectedYear = null;
                });
              },
              onSortColumnSelected: (column) {
                setState(() {
                  if (sortColumn == column) {
                    isAscending = !isAscending;
                  } else {
                    sortColumn = column;
                    isAscending = true;
                  }
                });
              },
              onResetFilters: () {
                setState(() {
                  startDate = null;
                  endDate = null;
                  selectedYear = null;
                  sortColumn = null;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<LocalEarning>>(
              future: earningsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No earnings found.'));
                } else {
                  var filteredEarnings = EarningsUtils.filterEarnings(
                    earnings: snapshot.data!,
                    selectedYear: selectedYear,
                    startDate: startDate,
                    endDate: endDate,
                  );
                  filteredEarnings = EarningsUtils.sortEarnings(
                    earnings: filteredEarnings,
                    sortColumn: sortColumn,
                    isAscending: isAscending,
                  );
                  if (filteredEarnings.isEmpty) {
                    return const Center(child: Text('No earnings found for the selected filter.'));
                  } else {
                    return EarningsChart(earnings: filteredEarnings);
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _generateDemoData,
              child: const Text('Generate Demo Data'),
            ),
          ),
        ],
      ),
    );
  }
}