// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stu_mobile_code_auth_req_vo.dart';

class StuMobileCodeAuthReqVOMapper
    extends ClassMapperBase<StuMobileCodeAuthReqVO> {
  StuMobileCodeAuthReqVOMapper._();

  static StuMobileCodeAuthReqVOMapper? _instance;
  static StuMobileCodeAuthReqVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StuMobileCodeAuthReqVOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StuMobileCodeAuthReqVO';

  static String _$telCode(StuMobileCodeAuthReqVO v) => v.telCode;
  static const Field<StuMobileCodeAuthReqVO, String> _f$telCode =
      Field('telCode', _$telCode);
  static String _$mobile(StuMobileCodeAuthReqVO v) => v.mobile;
  static const Field<StuMobileCodeAuthReqVO, String> _f$mobile =
      Field('mobile', _$mobile);
  static String _$code(StuMobileCodeAuthReqVO v) => v.code;
  static const Field<StuMobileCodeAuthReqVO, String> _f$code =
      Field('code', _$code);
  static int _$registerSiteId(StuMobileCodeAuthReqVO v) => v.registerSiteId;
  static const Field<StuMobileCodeAuthReqVO, int> _f$registerSiteId =
      Field('registerSiteId', _$registerSiteId);
  static int? _$socialType(StuMobileCodeAuthReqVO v) => v.socialType;
  static const Field<StuMobileCodeAuthReqVO, int> _f$socialType =
      Field('socialType', _$socialType, opt: true);
  static String? _$socialOpenid(StuMobileCodeAuthReqVO v) => v.socialOpenid;
  static const Field<StuMobileCodeAuthReqVO, String> _f$socialOpenid =
      Field('socialOpenid', _$socialOpenid, opt: true);

  @override
  final MappableFields<StuMobileCodeAuthReqVO> fields = const {
    #telCode: _f$telCode,
    #mobile: _f$mobile,
    #code: _f$code,
    #registerSiteId: _f$registerSiteId,
    #socialType: _f$socialType,
    #socialOpenid: _f$socialOpenid,
  };
  @override
  final bool ignoreNull = true;

  static StuMobileCodeAuthReqVO _instantiate(DecodingData data) {
    return StuMobileCodeAuthReqVO(
        telCode: data.dec(_f$telCode),
        mobile: data.dec(_f$mobile),
        code: data.dec(_f$code),
        registerSiteId: data.dec(_f$registerSiteId),
        socialType: data.dec(_f$socialType),
        socialOpenid: data.dec(_f$socialOpenid));
  }

  @override
  final Function instantiate = _instantiate;

  static StuMobileCodeAuthReqVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StuMobileCodeAuthReqVO>(map);
  }

  static StuMobileCodeAuthReqVO fromJson(String json) {
    return ensureInitialized().decodeJson<StuMobileCodeAuthReqVO>(json);
  }
}

mixin StuMobileCodeAuthReqVOMappable {
  String toJson() {
    return StuMobileCodeAuthReqVOMapper.ensureInitialized()
        .encodeJson<StuMobileCodeAuthReqVO>(this as StuMobileCodeAuthReqVO);
  }

  Map<String, dynamic> toMap() {
    return StuMobileCodeAuthReqVOMapper.ensureInitialized()
        .encodeMap<StuMobileCodeAuthReqVO>(this as StuMobileCodeAuthReqVO);
  }

  StuMobileCodeAuthReqVOCopyWith<StuMobileCodeAuthReqVO, StuMobileCodeAuthReqVO,
          StuMobileCodeAuthReqVO>
      get copyWith => _StuMobileCodeAuthReqVOCopyWithImpl<
              StuMobileCodeAuthReqVO, StuMobileCodeAuthReqVO>(
          this as StuMobileCodeAuthReqVO, $identity, $identity);
  @override
  String toString() {
    return StuMobileCodeAuthReqVOMapper.ensureInitialized()
        .stringifyValue(this as StuMobileCodeAuthReqVO);
  }

  @override
  bool operator ==(Object other) {
    return StuMobileCodeAuthReqVOMapper.ensureInitialized()
        .equalsValue(this as StuMobileCodeAuthReqVO, other);
  }

  @override
  int get hashCode {
    return StuMobileCodeAuthReqVOMapper.ensureInitialized()
        .hashValue(this as StuMobileCodeAuthReqVO);
  }
}

extension StuMobileCodeAuthReqVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StuMobileCodeAuthReqVO, $Out> {
  StuMobileCodeAuthReqVOCopyWith<$R, StuMobileCodeAuthReqVO, $Out>
      get $asStuMobileCodeAuthReqVO => $base.as((v, t, t2) =>
          _StuMobileCodeAuthReqVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StuMobileCodeAuthReqVOCopyWith<
    $R,
    $In extends StuMobileCodeAuthReqVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? telCode,
      String? mobile,
      String? code,
      int? registerSiteId,
      int? socialType,
      String? socialOpenid});
  StuMobileCodeAuthReqVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StuMobileCodeAuthReqVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StuMobileCodeAuthReqVO, $Out>
    implements
        StuMobileCodeAuthReqVOCopyWith<$R, StuMobileCodeAuthReqVO, $Out> {
  _StuMobileCodeAuthReqVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StuMobileCodeAuthReqVO> $mapper =
      StuMobileCodeAuthReqVOMapper.ensureInitialized();
  @override
  $R call(
          {String? telCode,
          String? mobile,
          String? code,
          int? registerSiteId,
          Object? socialType = $none,
          Object? socialOpenid = $none}) =>
      $apply(FieldCopyWithData({
        if (telCode != null) #telCode: telCode,
        if (mobile != null) #mobile: mobile,
        if (code != null) #code: code,
        if (registerSiteId != null) #registerSiteId: registerSiteId,
        if (socialType != $none) #socialType: socialType,
        if (socialOpenid != $none) #socialOpenid: socialOpenid
      }));
  @override
  StuMobileCodeAuthReqVO $make(CopyWithData data) => StuMobileCodeAuthReqVO(
      telCode: data.get(#telCode, or: $value.telCode),
      mobile: data.get(#mobile, or: $value.mobile),
      code: data.get(#code, or: $value.code),
      registerSiteId: data.get(#registerSiteId, or: $value.registerSiteId),
      socialType: data.get(#socialType, or: $value.socialType),
      socialOpenid: data.get(#socialOpenid, or: $value.socialOpenid));

  @override
  StuMobileCodeAuthReqVOCopyWith<$R2, StuMobileCodeAuthReqVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StuMobileCodeAuthReqVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
