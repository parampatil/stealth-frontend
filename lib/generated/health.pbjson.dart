//
//  Generated code. Do not modify.
//  source: health.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use healthCheckRequestDescriptor instead')
const HealthCheckRequest$json = {
  '1': 'HealthCheckRequest',
};

/// Descriptor for `HealthCheckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckRequestDescriptor = $convert.base64Decode(
    'ChJIZWFsdGhDaGVja1JlcXVlc3Q=');

@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse$json = {
  '1': 'HealthCheckResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `HealthCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckResponseDescriptor = $convert.base64Decode(
    'ChNIZWFsdGhDaGVja1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use greetingRequestDescriptor instead')
const GreetingRequest$json = {
  '1': 'GreetingRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GreetingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetingRequestDescriptor = $convert.base64Decode(
    'Cg9HcmVldGluZ1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use greetingResponseDescriptor instead')
const GreetingResponse$json = {
  '1': 'GreetingResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `GreetingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetingResponseDescriptor = $convert.base64Decode(
    'ChBHcmVldGluZ1Jlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use earningDescriptor instead')
const Earning$json = {
  '1': 'Earning',
  '2': [
    {'1': 'earning_id', '3': 1, '4': 1, '5': 9, '10': 'earningId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'date', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
  ],
};

/// Descriptor for `Earning`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List earningDescriptor = $convert.base64Decode(
    'CgdFYXJuaW5nEh0KCmVhcm5pbmdfaWQYASABKAlSCWVhcm5pbmdJZBIWCgZhbW91bnQYAiABKA'
    'FSBmFtb3VudBIuCgRkYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZGF0'
    'ZQ==');

@$core.Deprecated('Use getEarningsRequestDescriptor instead')
const GetEarningsRequest$json = {
  '1': 'GetEarningsRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetEarningsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEarningsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRFYXJuaW5nc1JlcXVlc3QSEAoDdWlkGAEgASgJUgN1aWQ=');

@$core.Deprecated('Use getEarningsResponseDescriptor instead')
const GetEarningsResponse$json = {
  '1': 'GetEarningsResponse',
  '2': [
    {'1': 'earnings', '3': 1, '4': 3, '5': 11, '6': '.health.Earning', '10': 'earnings'},
  ],
};

/// Descriptor for `GetEarningsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEarningsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRFYXJuaW5nc1Jlc3BvbnNlEisKCGVhcm5pbmdzGAEgAygLMg8uaGVhbHRoLkVhcm5pbm'
    'dSCGVhcm5pbmdz');

@$core.Deprecated('Use createEarningRequestDescriptor instead')
const CreateEarningRequest$json = {
  '1': 'CreateEarningRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'earning', '3': 2, '4': 1, '5': 11, '6': '.health.Earning', '10': 'earning'},
  ],
};

/// Descriptor for `CreateEarningRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEarningRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVFYXJuaW5nUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZBIpCgdlYXJuaW5nGAIgAS'
    'gLMg8uaGVhbHRoLkVhcm5pbmdSB2Vhcm5pbmc=');

@$core.Deprecated('Use createEarningResponseDescriptor instead')
const CreateEarningResponse$json = {
  '1': 'CreateEarningResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `CreateEarningResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEarningResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVFYXJuaW5nUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use generateDemoDataRequestDescriptor instead')
const GenerateDemoDataRequest$json = {
  '1': 'GenerateDemoDataRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GenerateDemoDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDemoDataRequestDescriptor = $convert.base64Decode(
    'ChdHZW5lcmF0ZURlbW9EYXRhUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZA==');

@$core.Deprecated('Use generateDemoDataResponseDescriptor instead')
const GenerateDemoDataResponse$json = {
  '1': 'GenerateDemoDataResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `GenerateDemoDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDemoDataResponseDescriptor = $convert.base64Decode(
    'ChhHZW5lcmF0ZURlbW9EYXRhUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

