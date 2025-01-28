//
//  Generated code. Do not modify.
//  source: health.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'health.pb.dart' as $0;

export 'health.pb.dart';

@$pb.GrpcServiceName('health.HealthService')
class HealthServiceClient extends $grpc.Client {
  static final _$check = $grpc.ClientMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
      '/health.HealthService/Check',
      ($0.HealthCheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HealthCheckResponse.fromBuffer(value));
  static final _$greet = $grpc.ClientMethod<$0.GreetingRequest, $0.GreetingResponse>(
      '/health.HealthService/Greet',
      ($0.GreetingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GreetingResponse.fromBuffer(value));
  static final _$getEarnings = $grpc.ClientMethod<$0.GetEarningsRequest, $0.GetEarningsResponse>(
      '/health.HealthService/GetEarnings',
      ($0.GetEarningsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetEarningsResponse.fromBuffer(value));
  static final _$createEarning = $grpc.ClientMethod<$0.CreateEarningRequest, $0.CreateEarningResponse>(
      '/health.HealthService/CreateEarning',
      ($0.CreateEarningRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateEarningResponse.fromBuffer(value));
  static final _$generateDemoData = $grpc.ClientMethod<$0.GenerateDemoDataRequest, $0.GenerateDemoDataResponse>(
      '/health.HealthService/GenerateDemoData',
      ($0.GenerateDemoDataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GenerateDemoDataResponse.fromBuffer(value));

  HealthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.HealthCheckResponse> check($0.HealthCheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  $grpc.ResponseFuture<$0.GreetingResponse> greet($0.GreetingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$greet, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetEarningsResponse> getEarnings($0.GetEarningsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEarnings, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateEarningResponse> createEarning($0.CreateEarningRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEarning, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenerateDemoDataResponse> generateDemoData($0.GenerateDemoDataRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateDemoData, request, options: options);
  }
}

@$pb.GrpcServiceName('health.HealthService')
abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'health.HealthService';

  HealthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HealthCheckRequest.fromBuffer(value),
        ($0.HealthCheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GreetingRequest, $0.GreetingResponse>(
        'Greet',
        greet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GreetingRequest.fromBuffer(value),
        ($0.GreetingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEarningsRequest, $0.GetEarningsResponse>(
        'GetEarnings',
        getEarnings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetEarningsRequest.fromBuffer(value),
        ($0.GetEarningsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateEarningRequest, $0.CreateEarningResponse>(
        'CreateEarning',
        createEarning_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateEarningRequest.fromBuffer(value),
        ($0.CreateEarningResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateDemoDataRequest, $0.GenerateDemoDataResponse>(
        'GenerateDemoData',
        generateDemoData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GenerateDemoDataRequest.fromBuffer(value),
        ($0.GenerateDemoDataResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HealthCheckResponse> check_Pre($grpc.ServiceCall call, $async.Future<$0.HealthCheckRequest> request) async {
    return check(call, await request);
  }

  $async.Future<$0.GreetingResponse> greet_Pre($grpc.ServiceCall call, $async.Future<$0.GreetingRequest> request) async {
    return greet(call, await request);
  }

  $async.Future<$0.GetEarningsResponse> getEarnings_Pre($grpc.ServiceCall call, $async.Future<$0.GetEarningsRequest> request) async {
    return getEarnings(call, await request);
  }

  $async.Future<$0.CreateEarningResponse> createEarning_Pre($grpc.ServiceCall call, $async.Future<$0.CreateEarningRequest> request) async {
    return createEarning(call, await request);
  }

  $async.Future<$0.GenerateDemoDataResponse> generateDemoData_Pre($grpc.ServiceCall call, $async.Future<$0.GenerateDemoDataRequest> request) async {
    return generateDemoData(call, await request);
  }

  $async.Future<$0.HealthCheckResponse> check($grpc.ServiceCall call, $0.HealthCheckRequest request);
  $async.Future<$0.GreetingResponse> greet($grpc.ServiceCall call, $0.GreetingRequest request);
  $async.Future<$0.GetEarningsResponse> getEarnings($grpc.ServiceCall call, $0.GetEarningsRequest request);
  $async.Future<$0.CreateEarningResponse> createEarning($grpc.ServiceCall call, $0.CreateEarningRequest request);
  $async.Future<$0.GenerateDemoDataResponse> generateDemoData($grpc.ServiceCall call, $0.GenerateDemoDataRequest request);
}
