// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stu_password_auth_req_vo.dart';

class StuPasswordAuthReqVOMapper extends ClassMapperBase<StuPasswordAuthReqVO> {
  StuPasswordAuthReqVOMapper._();

  static StuPasswordAuthReqVOMapper? _instance;
  static StuPasswordAuthReqVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StuPasswordAuthReqVOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StuPasswordAuthReqVO';

  static String _$username(StuPasswordAuthReqVO v) => v.username;
  static const Field<StuPasswordAuthReqVO, String> _f$username =
      Field('username', _$username);
  static String _$password(StuPasswordAuthReqVO v) => v.password;
  static const Field<StuPasswordAuthReqVO, String> _f$password =
      Field('password', _$password);

  @override
  final MappableFields<StuPasswordAuthReqVO> fields = const {
    #username: _f$username,
    #password: _f$password,
  };
  @override
  final bool ignoreNull = true;

  static StuPasswordAuthReqVO _instantiate(DecodingData data) {
    return StuPasswordAuthReqVO(
        username: data.dec(_f$username), password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static StuPasswordAuthReqVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StuPasswordAuthReqVO>(map);
  }

  static StuPasswordAuthReqVO fromJson(String json) {
    return ensureInitialized().decodeJson<StuPasswordAuthReqVO>(json);
  }
}

mixin StuPasswordAuthReqVOMappable {
  String toJson() {
    return StuPasswordAuthReqVOMapper.ensureInitialized()
        .encodeJson<StuPasswordAuthReqVO>(this as StuPasswordAuthReqVO);
  }

  Map<String, dynamic> toMap() {
    return StuPasswordAuthReqVOMapper.ensureInitialized()
        .encodeMap<StuPasswordAuthReqVO>(this as StuPasswordAuthReqVO);
  }

  StuPasswordAuthReqVOCopyWith<StuPasswordAuthReqVO, StuPasswordAuthReqVO,
      StuPasswordAuthReqVO> get copyWith => _StuPasswordAuthReqVOCopyWithImpl<
          StuPasswordAuthReqVO, StuPasswordAuthReqVO>(
      this as StuPasswordAuthReqVO, $identity, $identity);
  @override
  String toString() {
    return StuPasswordAuthReqVOMapper.ensureInitialized()
        .stringifyValue(this as StuPasswordAuthReqVO);
  }

  @override
  bool operator ==(Object other) {
    return StuPasswordAuthReqVOMapper.ensureInitialized()
        .equalsValue(this as StuPasswordAuthReqVO, other);
  }

  @override
  int get hashCode {
    return StuPasswordAuthReqVOMapper.ensureInitialized()
        .hashValue(this as StuPasswordAuthReqVO);
  }
}

extension StuPasswordAuthReqVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StuPasswordAuthReqVO, $Out> {
  StuPasswordAuthReqVOCopyWith<$R, StuPasswordAuthReqVO, $Out>
      get $asStuPasswordAuthReqVO => $base.as(
          (v, t, t2) => _StuPasswordAuthReqVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StuPasswordAuthReqVOCopyWith<
    $R,
    $In extends StuPasswordAuthReqVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? password});
  StuPasswordAuthReqVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StuPasswordAuthReqVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StuPasswordAuthReqVO, $Out>
    implements StuPasswordAuthReqVOCopyWith<$R, StuPasswordAuthReqVO, $Out> {
  _StuPasswordAuthReqVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StuPasswordAuthReqVO> $mapper =
      StuPasswordAuthReqVOMapper.ensureInitialized();
  @override
  $R call({String? username, String? password}) => $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (password != null) #password: password
      }));
  @override
  StuPasswordAuthReqVO $make(CopyWithData data) => StuPasswordAuthReqVO(
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password));

  @override
  StuPasswordAuthReqVOCopyWith<$R2, StuPasswordAuthReqVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StuPasswordAuthReqVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
