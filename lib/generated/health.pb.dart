//
//  Generated code. Do not modify.
//  source: health.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

class HealthCheckRequest extends $pb.GeneratedMessage {
  factory HealthCheckRequest() => create();
  HealthCheckRequest._() : super();
  factory HealthCheckRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckRequest clone() => HealthCheckRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckRequest copyWith(void Function(HealthCheckRequest) updates) => super.copyWith((message) => updates(message as HealthCheckRequest)) as HealthCheckRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckRequest create() => HealthCheckRequest._();
  HealthCheckRequest createEmptyInstance() => create();
  static $pb.PbList<HealthCheckRequest> createRepeated() => $pb.PbList<HealthCheckRequest>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckRequest>(create);
  static HealthCheckRequest? _defaultInstance;
}

class HealthCheckResponse extends $pb.GeneratedMessage {
  factory HealthCheckResponse({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  HealthCheckResponse._() : super();
  factory HealthCheckResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckResponse clone() => HealthCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckResponse copyWith(void Function(HealthCheckResponse) updates) => super.copyWith((message) => updates(message as HealthCheckResponse)) as HealthCheckResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckResponse create() => HealthCheckResponse._();
  HealthCheckResponse createEmptyInstance() => create();
  static $pb.PbList<HealthCheckResponse> createRepeated() => $pb.PbList<HealthCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckResponse>(create);
  static HealthCheckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GreetingRequest extends $pb.GeneratedMessage {
  factory GreetingRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GreetingRequest._() : super();
  factory GreetingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GreetingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetingRequest clone() => GreetingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetingRequest copyWith(void Function(GreetingRequest) updates) => super.copyWith((message) => updates(message as GreetingRequest)) as GreetingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GreetingRequest create() => GreetingRequest._();
  GreetingRequest createEmptyInstance() => create();
  static $pb.PbList<GreetingRequest> createRepeated() => $pb.PbList<GreetingRequest>();
  @$core.pragma('dart2js:noInline')
  static GreetingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetingRequest>(create);
  static GreetingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class GreetingResponse extends $pb.GeneratedMessage {
  factory GreetingResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  GreetingResponse._() : super();
  factory GreetingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GreetingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetingResponse clone() => GreetingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetingResponse copyWith(void Function(GreetingResponse) updates) => super.copyWith((message) => updates(message as GreetingResponse)) as GreetingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GreetingResponse create() => GreetingResponse._();
  GreetingResponse createEmptyInstance() => create();
  static $pb.PbList<GreetingResponse> createRepeated() => $pb.PbList<GreetingResponse>();
  @$core.pragma('dart2js:noInline')
  static GreetingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetingResponse>(create);
  static GreetingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Earning extends $pb.GeneratedMessage {
  factory Earning({
    $core.String? earningId,
    $core.double? amount,
    $1.Timestamp? date,
  }) {
    final $result = create();
    if (earningId != null) {
      $result.earningId = earningId;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  Earning._() : super();
  factory Earning.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Earning.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Earning', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'earningId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'date', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Earning clone() => Earning()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Earning copyWith(void Function(Earning) updates) => super.copyWith((message) => updates(message as Earning)) as Earning;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Earning create() => Earning._();
  Earning createEmptyInstance() => create();
  static $pb.PbList<Earning> createRepeated() => $pb.PbList<Earning>();
  @$core.pragma('dart2js:noInline')
  static Earning getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Earning>(create);
  static Earning? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get earningId => $_getSZ(0);
  @$pb.TagNumber(1)
  set earningId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEarningId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEarningId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get date => $_getN(2);
  @$pb.TagNumber(3)
  set date($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureDate() => $_ensure(2);
}

class GetEarningsRequest extends $pb.GeneratedMessage {
  factory GetEarningsRequest({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  GetEarningsRequest._() : super();
  factory GetEarningsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEarningsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEarningsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEarningsRequest clone() => GetEarningsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEarningsRequest copyWith(void Function(GetEarningsRequest) updates) => super.copyWith((message) => updates(message as GetEarningsRequest)) as GetEarningsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEarningsRequest create() => GetEarningsRequest._();
  GetEarningsRequest createEmptyInstance() => create();
  static $pb.PbList<GetEarningsRequest> createRepeated() => $pb.PbList<GetEarningsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEarningsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEarningsRequest>(create);
  static GetEarningsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GetEarningsResponse extends $pb.GeneratedMessage {
  factory GetEarningsResponse({
    $core.Iterable<Earning>? earnings,
  }) {
    final $result = create();
    if (earnings != null) {
      $result.earnings.addAll(earnings);
    }
    return $result;
  }
  GetEarningsResponse._() : super();
  factory GetEarningsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEarningsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEarningsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..pc<Earning>(1, _omitFieldNames ? '' : 'earnings', $pb.PbFieldType.PM, subBuilder: Earning.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetEarningsResponse clone() => GetEarningsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetEarningsResponse copyWith(void Function(GetEarningsResponse) updates) => super.copyWith((message) => updates(message as GetEarningsResponse)) as GetEarningsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEarningsResponse create() => GetEarningsResponse._();
  GetEarningsResponse createEmptyInstance() => create();
  static $pb.PbList<GetEarningsResponse> createRepeated() => $pb.PbList<GetEarningsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEarningsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEarningsResponse>(create);
  static GetEarningsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Earning> get earnings => $_getList(0);
}

class CreateEarningRequest extends $pb.GeneratedMessage {
  factory CreateEarningRequest({
    $core.String? uid,
    Earning? earning,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (earning != null) {
      $result.earning = earning;
    }
    return $result;
  }
  CreateEarningRequest._() : super();
  factory CreateEarningRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEarningRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEarningRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOM<Earning>(2, _omitFieldNames ? '' : 'earning', subBuilder: Earning.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEarningRequest clone() => CreateEarningRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEarningRequest copyWith(void Function(CreateEarningRequest) updates) => super.copyWith((message) => updates(message as CreateEarningRequest)) as CreateEarningRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEarningRequest create() => CreateEarningRequest._();
  CreateEarningRequest createEmptyInstance() => create();
  static $pb.PbList<CreateEarningRequest> createRepeated() => $pb.PbList<CreateEarningRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateEarningRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEarningRequest>(create);
  static CreateEarningRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  Earning get earning => $_getN(1);
  @$pb.TagNumber(2)
  set earning(Earning v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEarning() => $_has(1);
  @$pb.TagNumber(2)
  void clearEarning() => clearField(2);
  @$pb.TagNumber(2)
  Earning ensureEarning() => $_ensure(1);
}

class CreateEarningResponse extends $pb.GeneratedMessage {
  factory CreateEarningResponse({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  CreateEarningResponse._() : super();
  factory CreateEarningResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEarningResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEarningResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEarningResponse clone() => CreateEarningResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEarningResponse copyWith(void Function(CreateEarningResponse) updates) => super.copyWith((message) => updates(message as CreateEarningResponse)) as CreateEarningResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEarningResponse create() => CreateEarningResponse._();
  CreateEarningResponse createEmptyInstance() => create();
  static $pb.PbList<CreateEarningResponse> createRepeated() => $pb.PbList<CreateEarningResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateEarningResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEarningResponse>(create);
  static CreateEarningResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GenerateDemoDataRequest extends $pb.GeneratedMessage {
  factory GenerateDemoDataRequest({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  GenerateDemoDataRequest._() : super();
  factory GenerateDemoDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateDemoDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateDemoDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateDemoDataRequest clone() => GenerateDemoDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateDemoDataRequest copyWith(void Function(GenerateDemoDataRequest) updates) => super.copyWith((message) => updates(message as GenerateDemoDataRequest)) as GenerateDemoDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDemoDataRequest create() => GenerateDemoDataRequest._();
  GenerateDemoDataRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateDemoDataRequest> createRepeated() => $pb.PbList<GenerateDemoDataRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateDemoDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateDemoDataRequest>(create);
  static GenerateDemoDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GenerateDemoDataResponse extends $pb.GeneratedMessage {
  factory GenerateDemoDataResponse({
    $core.String? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  GenerateDemoDataResponse._() : super();
  factory GenerateDemoDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateDemoDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateDemoDataResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'health'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateDemoDataResponse clone() => GenerateDemoDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateDemoDataResponse copyWith(void Function(GenerateDemoDataResponse) updates) => super.copyWith((message) => updates(message as GenerateDemoDataResponse)) as GenerateDemoDataResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDemoDataResponse create() => GenerateDemoDataResponse._();
  GenerateDemoDataResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateDemoDataResponse> createRepeated() => $pb.PbList<GenerateDemoDataResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateDemoDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateDemoDataResponse>(create);
  static GenerateDemoDataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
