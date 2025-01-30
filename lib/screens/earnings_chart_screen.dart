import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:provider/provider.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/generated/health.pbgrpc.dart';
import 'package:stealth_frontend/widgets/earnings_chart.dart';
import 'package:stealth_frontend/generated/health.pb.dart' as health;
import 'package:stealth_frontend/providers/user_auth_provider.dart';

class EarningsChartScreen extends StatefulWidget {
  const EarningsChartScreen({super.key});

  @override
  _EarningsChartScreenState createState() => _EarningsChartScreenState();
}

class _EarningsChartScreenState extends State<EarningsChartScreen> {
  late UserAuthProvider userAuthProvider;
  late Future<List<Earning>> earningsFuture;
  int? selectedYear;
  DateTime? startDate;
  DateTime? endDate;
  late HealthServiceClient client;

  @override
  void initState() {
    super.initState();
    userAuthProvider = Provider.of<UserAuthProvider>(context, listen: false);
  client = HealthServiceClient(
    grpc.ClientChannel(
      Constants.backendUrl,
      port: 443, // Default port for HTTPS
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.secure()),
    ),
  );
    earningsFuture = _fetchEarnings();
  }

  Future<List<Earning>> _fetchEarnings() async {
    try {
      final request = GetEarningsRequest()..uid = userAuthProvider.userModel!.uid;
      final response = await client.getEarnings(request);
      return response.earnings.map((e) => Earning.fromProto(e)).toList();
    } catch (e) {
      log('Error fetching earnings: $e');
      return [];
    }
  }

  Future<void> _generateDemoData() async {
    try {
      final request = GenerateDemoDataRequest()..uid = userAuthProvider.userModel!.uid;
      await client.generateDemoData(request);
      setState(() {
        earningsFuture = _fetchEarnings();
      });
    } catch (e) {
      log('Error generating demo data: $e');
    }
  }

  List<Earning> _filterEarnings(List<Earning> earnings) {
    if (selectedYear != null) {
      return earnings.where((e) => e.date.year == selectedYear).toList();
    } else if (startDate != null && endDate != null) {
      return earnings.where((e) => e.date.isAfter(startDate!) && e.date.isBefore(endDate!)).toList();
    }
    return earnings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Earnings Chart')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                DropdownButton<int>(
                  hint: Text('Select Year'),
                  value: selectedYear,
                  items: List.generate(10, (index) => DateTime.now().year - index)
                      .map((year) => DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value;
                      startDate = null;
                      endDate = null;
                    });
                  },
                ),
                SizedBox(width: 16),
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
                      setState(() {
                        startDate = picked.start;
                        endDate = picked.end;
                        selectedYear = null;
                      });
                    }
                  },
                  child: Text('Select Date Range'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Earning>>(
              future: earningsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No earnings found.'));
                } else {
                  final filteredEarnings = _filterEarnings(snapshot.data!);
                  return EarningsChart(earnings: filteredEarnings);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _generateDemoData,
              child: Text('Generate Demo Data'),
            ),
          ),
        ],
      ),
    );
  }
}

class Earning {
  final String earningId;
  final double amount;
  final DateTime date;

  Earning({
    required this.earningId,
    required this.amount,
    required this.date,
  });

  factory Earning.fromProto(health.Earning proto) {
    return Earning(
      earningId: proto.earningId,
      amount: proto.amount,
      date: DateTime.fromMillisecondsSinceEpoch(proto.date.seconds.toInt() * 1000, isUtc: true).toLocal(),
    );
  }
}