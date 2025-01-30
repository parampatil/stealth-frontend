import 'package:grpc/grpc.dart';
import 'package:stealth_frontend/constants.dart';
import 'package:stealth_frontend/generated/health.pbgrpc.dart';

class GrpcClient {
  ClientChannel? channel;
  HealthServiceClient? stub;

  Future<void> init() async {
    channel = ClientChannel(
      Constants.backendUrl,
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = HealthServiceClient(channel!);
  }

  Future<GetEarningsResponse> getEarnings(GetEarningsRequest request) async {
    return await stub!.getEarnings(request);
  }

  Future<void> generateDemoData(GenerateDemoDataRequest request) async {
    await stub!.generateDemoData(request);
  }
}