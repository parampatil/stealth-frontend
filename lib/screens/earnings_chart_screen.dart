import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:stealth_frontend/generated/health.pbgrpc.dart';
import 'package:stealth_frontend/widgets/earnings_chart.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  final client = HealthServiceClient(
    grpc.ClientChannel(
      '192.168.0.181', // Replace with your gRPC server address
      port: 50051, // Replace with your gRPC server port
      options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.insecure()),
    ),
  );

  late Future<List<Earning>> earningsFuture;

  @override
  void initState() {
    super.initState();
    earningsFuture = _fetchEarnings();
  }

  Future<List<Earning>> _fetchEarnings() async {
    try {
      final request = GetEarningsRequest()..uid = 'test_uid'; // Replace 'test_uid' with actual user ID
      final response = await client.getEarnings(request);
      return response.earnings;
    } catch (e) {
      log('Error fetching earnings: $e');
      return [];
    }
  }

  Future<void> _generateDemoData() async {
    try {
      final request = GenerateDemoDataRequest()..uid = 'test_uid'; // Replace 'test_uid' with actual user ID
      await client.generateDemoData(request);
      setState(() {
        earningsFuture = _fetchEarnings();
      });
    } catch (e) {
      log('Error generating demo data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Earnings')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 300, // Adjust height as needed
              child: FutureBuilder<List<Earning>>(
                future: earningsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No earnings found.'));
                  }

                  final earnings = snapshot.data!;
                  return EarningsChart(earnings: earnings);  // Pass earnings directly
                },
              ),
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
                }

                final earnings = snapshot.data!;
                return ListView.builder(
                  itemCount: earnings.length,
                  itemBuilder: (context, index) {
                    final earning = earnings[index];
                    return ListTile(
                      title: Text('Earning ID: ${earning.earningId}'),
                      subtitle: Text(
                          'Amount: \$${earning.amount.toStringAsFixed(2)}\nDate: ${earning.date.toDateTime()}'),
                    );
                  },
                );
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