import 'package:flutter/material.dart';
import 'package:stealth_frontend/api/grpc_client.dart';
import 'package:stealth_frontend/models/earning_model.dart';

class EarningsProvider with ChangeNotifier {
  List<Earning> _earnings = [];
  List<Earning> get earnings => _earnings;

  Future<void> fetchEarningsWithoutNotify(String uid) async {
    final grpcClient = GrpcClient();
    await grpcClient.init();
    final response = await grpcClient.getEarnings(uid);
    _earnings = response.earnings.map((e) => Earning(
      earningId: e.earningId,
      amount: e.amount,
      date: e.date.toDateTime(),
    )).toList();
  }

  Future<void> generateDemoDataWithoutNotify(String uid) async {
    final grpcClient = GrpcClient();
    await grpcClient.init();
    await grpcClient.generateDemoData(uid);
    await fetchEarningsWithoutNotify(uid);
  }
}