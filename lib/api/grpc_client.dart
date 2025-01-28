import 'package:grpc/grpc.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/generated/health.pbgrpc.dart';

class GrpcClient {
  ClientChannel? channel;
  HealthServiceClient? stub;

  Future<void> init() async {
    channel = ClientChannel(
      Constants.backendUrl, // Your backend URL
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = HealthServiceClient(channel!);
  }

  Future<GetEarningsResponse> getEarnings(String uid) async {
    final request = GetEarningsRequest()..uid = uid;
    return await stub!.getEarnings(request);
  }

  Future<void> generateDemoData(String uid) async {
    final request = GenerateDemoDataRequest()..uid = uid;
    await stub!.generateDemoData(request);
  }
}