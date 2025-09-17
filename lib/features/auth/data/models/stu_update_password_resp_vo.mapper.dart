// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stu_update_password_resp_vo.dart';

class StuUpdatePasswordRespVOMapper
    extends ClassMapperBase<StuUpdatePasswordRespVO> {
  StuUpdatePasswordRespVOMapper._();

  static StuUpdatePasswordRespVOMapper? _instance;
  static StuUpdatePasswordRespVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StuUpdatePasswordRespVOMapper._());
      StudentAccessTokenVOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StuUpdatePasswordRespVO';

  static StudentAccessTokenVO? _$token(StuUpdatePasswordRespVO v) => v.token;
  static const Field<StuUpdatePasswordRespVO, StudentAccessTokenVO> _f$token =
      Field('token', _$token, opt: true);

  @override
  final MappableFields<StuUpdatePasswordRespVO> fields = const {
    #token: _f$token,
  };
  @override
  final bool ignoreNull = true;

  static StuUpdatePasswordRespVO _instantiate(DecodingData data) {
    return StuUpdatePasswordRespVO(token: data.dec(_f$token));
  }

  @override
  final Function instantiate = _instantiate;

  static StuUpdatePasswordRespVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StuUpdatePasswordRespVO>(map);
  }

  static StuUpdatePasswordRespVO fromJson(String json) {
    return ensureInitialized().decodeJson<StuUpdatePasswordRespVO>(json);
  }
}

mixin StuUpdatePasswordRespVOMappable {
  String toJson() {
    return StuUpdatePasswordRespVOMapper.ensureInitialized()
        .encodeJson<StuUpdatePasswordRespVO>(this as StuUpdatePasswordRespVO);
  }

  Map<String, dynamic> toMap() {
    return StuUpdatePasswordRespVOMapper.ensureInitialized()
        .encodeMap<StuUpdatePasswordRespVO>(this as StuUpdatePasswordRespVO);
  }

  StuUpdatePasswordRespVOCopyWith<StuUpdatePasswordRespVO,
          StuUpdatePasswordRespVO, StuUpdatePasswordRespVO>
      get copyWith => _StuUpdatePasswordRespVOCopyWithImpl<
              StuUpdatePasswordRespVO, StuUpdatePasswordRespVO>(
          this as StuUpdatePasswordRespVO, $identity, $identity);
  @override
  String toString() {
    return StuUpdatePasswordRespVOMapper.ensureInitialized()
        .stringifyValue(this as StuUpdatePasswordRespVO);
  }

  @override
  bool operator ==(Object other) {
    return StuUpdatePasswordRespVOMapper.ensureInitialized()
        .equalsValue(this as StuUpdatePasswordRespVO, other);
  }

  @override
  int get hashCode {
    return StuUpdatePasswordRespVOMapper.ensureInitialized()
        .hashValue(this as StuUpdatePasswordRespVO);
  }
}

extension StuUpdatePasswordRespVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StuUpdatePasswordRespVO, $Out> {
  StuUpdatePasswordRespVOCopyWith<$R, StuUpdatePasswordRespVO, $Out>
      get $asStuUpdatePasswordRespVO => $base.as((v, t, t2) =>
          _StuUpdatePasswordRespVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StuUpdatePasswordRespVOCopyWith<
    $R,
    $In extends StuUpdatePasswordRespVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, StudentAccessTokenVO>?
      get token;
  $R call({StudentAccessTokenVO? token});
  StuUpdatePasswordRespVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StuUpdatePasswordRespVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StuUpdatePasswordRespVO, $Out>
    implements
        StuUpdatePasswordRespVOCopyWith<$R, StuUpdatePasswordRespVO, $Out> {
  _StuUpdatePasswordRespVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StuUpdatePasswordRespVO> $mapper =
      StuUpdatePasswordRespVOMapper.ensureInitialized();
  @override
  StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, StudentAccessTokenVO>?
      get token => $value.token?.copyWith.$chain((v) => call(token: v));
  @override
  $R call({Object? token = $none}) =>
      $apply(FieldCopyWithData({if (token != $none) #token: token}));
  @override
  StuUpdatePasswordRespVO $make(CopyWithData data) =>
      StuUpdatePasswordRespVO(token: data.get(#token, or: $value.token));

  @override
  StuUpdatePasswordRespVOCopyWith<$R2, StuUpdatePasswordRespVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StuUpdatePasswordRespVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
