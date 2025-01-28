import 'package:stealth_frontend/generated/health.pb.dart' as health;

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