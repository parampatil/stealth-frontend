import 'dart:developer';
import 'package:grpc/grpc.dart' as grpc;
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/generated/health.pbgrpc.dart';
import 'package:stealth_frontend/models/earning_model.dart';
import 'package:stealth_frontend/providers/user_auth_provider.dart';

class EarningsUtils {
  // Fetch earnings from the server
  static Future<List<LocalEarning>> fetchEarnings(UserAuthProvider userAuthProvider) async {
    final client = HealthServiceClient(
      grpc.ClientChannel(
        Constants.backendUrl,
        port: 443,
        options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.secure()),
      ),
    );
    try {
      final request = GetEarningsRequest()..uid = userAuthProvider.userModel!.uid;
      final response = await client.getEarnings(request);
      return response.earnings.map((e) => LocalEarning.fromProto(e)).toList();
    } catch (e) {
      log('Error fetching earnings: $e');
      return [];
    }
  }

  // Generate demo data on the server
  static Future<void> generateDemoData(UserAuthProvider userAuthProvider) async {
    final client = HealthServiceClient(
      grpc.ClientChannel(
        Constants.backendUrl,
        port: 443,
        options: const grpc.ChannelOptions(credentials: grpc.ChannelCredentials.secure()),
      ),
    );
    try {
      final request = GenerateDemoDataRequest()..uid = userAuthProvider.userModel!.uid;
      await client.generateDemoData(request);
    } catch (e) {
      log('Error generating demo data: $e');
    }
  }

  // Filter earnings based on selected year or date range
  static List<LocalEarning> filterEarnings({
    required List<LocalEarning> earnings,
    int? selectedYear,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    if (selectedYear != null) {
      return earnings.where((e) => e.date.year == selectedYear).toList();
    } else if (startDate != null && endDate != null) {
      return earnings.where((e) => e.date.isAfter(startDate) && e.date.isBefore(endDate)).toList();
    }
    return earnings;
  }

  // Sort earnings based on the selected column and order
  static List<LocalEarning> sortEarnings({
    required List<LocalEarning> earnings,
    String? sortColumn,
    bool isAscending = true,
  }) {
    if (sortColumn != null) {
      earnings.sort((a, b) {
        int comparison;
        switch (sortColumn) {
          case 'date':
            comparison = a.date.compareTo(b.date);
            break;
          case 'amount':
            comparison = a.amount.compareTo(b.amount);
            break;
          case 'id':
            comparison = a.earningId.compareTo(b.earningId);
            break;
          default:
            return 0;
        }
        return isAscending ? comparison : -comparison;
      });
    }
    return earnings;
  }
}