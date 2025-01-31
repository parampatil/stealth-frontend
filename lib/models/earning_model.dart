import 'package:stealth_frontend/generated/health.pb.dart' as health;

class LocalEarning {
  final String earningId;
  final double amount;
  final DateTime date;

  LocalEarning({
    required this.earningId,
    required this.amount,
    required this.date,
  });

  factory LocalEarning.fromProto(health.Earning proto) {
    return LocalEarning(
      earningId: proto.earningId,
      amount: proto.amount,
      date: DateTime.fromMillisecondsSinceEpoch(proto.date.seconds.toInt() * 1000, isUtc: true).toLocal(),
    );
  }
}