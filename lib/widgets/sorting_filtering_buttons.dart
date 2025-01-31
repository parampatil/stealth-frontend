import 'package:flutter/material.dart';

class SortingFilteringButtons extends StatelessWidget {
  final int? selectedYear;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? sortColumn;
  final bool isAscending;
  final Function(int?) onYearSelected;
  final Function(DateTime?, DateTime?) onDateRangeSelected;
  final Function(String?) onSortColumnSelected;
  final Function() onResetFilters;
  final bool showDateRangeButton;
  final bool showResetButton;
  final bool showYearDropdown;
  final bool showSortDropdown;

  const SortingFilteringButtons({
    super.key,
    this.selectedYear,
    this.startDate,
    this.endDate,
    this.sortColumn,
    this.isAscending = true,
    required this.onYearSelected,
    required this.onDateRangeSelected,
    required this.onSortColumnSelected,
    required this.onResetFilters,
    this.showDateRangeButton = true,
    this.showResetButton = true,
    this.showYearDropdown = true,
    this.showSortDropdown = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      alignment: WrapAlignment.spaceAround,
      children: [
        if (showDateRangeButton)
          ElevatedButton(
            onPressed: () async {
              final picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDateRange: startDate != null && endDate != null
                    ? DateTimeRange(start: startDate!, end: endDate!)
                    : null,
              );
              if (picked != null) {
                onDateRangeSelected(picked.start, picked.end);
              }
            },
            child: const Text('Select Date Range'),
          ),
        if (showResetButton)
          ElevatedButton(
            onPressed: onResetFilters,
            child: const Text('Reset Filters'),
          ),
        if (showYearDropdown)
          DropdownButton<int>(
            hint: const Text('Select Year'),
            value: selectedYear,
            items: List.generate(10, (index) => DateTime.now().year - index)
                .map((year) => DropdownMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    ))
                .toList(),
            onChanged: onYearSelected,
          ),
        if (showSortDropdown)
          DropdownButton<String>(
            hint: const Text('Sort By'),
            value: sortColumn,
            items: const [
              DropdownMenuItem(value: 'date', child: Text('Date')),
              DropdownMenuItem(value: 'amount', child: Text('Amount')),
              DropdownMenuItem(value: 'id', child: Text('ID')),
            ],
            onChanged: onSortColumnSelected,
          ),
      ],
    );
  }
}