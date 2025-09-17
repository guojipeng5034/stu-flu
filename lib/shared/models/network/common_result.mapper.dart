// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'common_result.dart';

class CommonResultMapper extends ClassMapperBase<CommonResult> {
  CommonResultMapper._();

  static CommonResultMapper? _instance;
  static CommonResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommonResultMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommonResult';
  @override
  Function get typeFactory => <T>(f) => f<CommonResult<T>>();

  static int _$code(CommonResult v) => v.code;
  static const Field<CommonResult, int> _f$code = Field('code', _$code);
  static dynamic _$data(CommonResult v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<CommonResult, dynamic> _f$data =
      Field('data', _$data, opt: true, arg: _arg$data);
  static String? _$msg(CommonResult v) => v.msg;
  static const Field<CommonResult, String> _f$msg =
      Field('msg', _$msg, opt: true);

  @override
  final MappableFields<CommonResult> fields = const {
    #code: _f$code,
    #data: _f$data,
    #msg: _f$msg,
  };
  @override
  final bool ignoreNull = true;

  static CommonResult<T> _instantiate<T>(DecodingData data) {
    return CommonResult(
        code: data.dec(_f$code),
        data: data.dec(_f$data),
        msg: data.dec(_f$msg));
  }

  @override
  final Function instantiate = _instantiate;

  static CommonResult<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommonResult<T>>(map);
  }

  static CommonResult<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<CommonResult<T>>(json);
  }
}

mixin CommonResultMappable<T> {
  String toJson() {
    return CommonResultMapper.ensureInitialized()
        .encodeJson<CommonResult<T>>(this as CommonResult<T>);
  }

  Map<String, dynamic> toMap() {
    return CommonResultMapper.ensureInitialized()
        .encodeMap<CommonResult<T>>(this as CommonResult<T>);
  }

  CommonResultCopyWith<CommonResult<T>, CommonResult<T>, CommonResult<T>, T>
      get copyWith =>
          _CommonResultCopyWithImpl<CommonResult<T>, CommonResult<T>, T>(
              this as CommonResult<T>, $identity, $identity);
  @override
  String toString() {
    return CommonResultMapper.ensureInitialized()
        .stringifyValue(this as CommonResult<T>);
  }

  @override
  bool operator ==(Object other) {
    return CommonResultMapper.ensureInitialized()
        .equalsValue(this as CommonResult<T>, other);
  }

  @override
  int get hashCode {
    return CommonResultMapper.ensureInitialized()
        .hashValue(this as CommonResult<T>);
  }
}

extension CommonResultValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, CommonResult<T>, $Out> {
  CommonResultCopyWith<$R, CommonResult<T>, $Out, T> get $asCommonResult =>
      $base.as((v, t, t2) => _CommonResultCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class CommonResultCopyWith<$R, $In extends CommonResult<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? code, T? data, String? msg});
  CommonResultCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommonResultCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, CommonResult<T>, $Out>
    implements CommonResultCopyWith<$R, CommonResult<T>, $Out, T> {
  _CommonResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommonResult> $mapper =
      CommonResultMapper.ensureInitialized();
  @override
  $R call({int? code, Object? data = $none, Object? msg = $none}) =>
      $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (data != $none) #data: data,
        if (msg != $none) #msg: msg
      }));
  @override
  CommonResult<T> $make(CopyWithData data) => CommonResult(
      code: data.get(#code, or: $value.code),
      data: data.get(#data, or: $value.data),
      msg: data.get(#msg, or: $value.msg));

  @override
  CommonResultCopyWith<$R2, CommonResult<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommonResultCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}
