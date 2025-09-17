// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stu_forget_password_resp_vo.dart';

class StuForgetPasswordRespVOMapper
    extends ClassMapperBase<StuForgetPasswordRespVO> {
  StuForgetPasswordRespVOMapper._();

  static StuForgetPasswordRespVOMapper? _instance;
  static StuForgetPasswordRespVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StuForgetPasswordRespVOMapper._());
      StudentInfoVOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StuForgetPasswordRespVO';

  static List<StudentInfoVO>? _$students(StuForgetPasswordRespVO v) =>
      v.students;
  static const Field<StuForgetPasswordRespVO, List<StudentInfoVO>> _f$students =
      Field('students', _$students, opt: true);

  @override
  final MappableFields<StuForgetPasswordRespVO> fields = const {
    #students: _f$students,
  };
  @override
  final bool ignoreNull = true;

  static StuForgetPasswordRespVO _instantiate(DecodingData data) {
    return StuForgetPasswordRespVO(students: data.dec(_f$students));
  }

  @override
  final Function instantiate = _instantiate;

  static StuForgetPasswordRespVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StuForgetPasswordRespVO>(map);
  }

  static StuForgetPasswordRespVO fromJson(String json) {
    return ensureInitialized().decodeJson<StuForgetPasswordRespVO>(json);
  }
}

mixin StuForgetPasswordRespVOMappable {
  String toJson() {
    return StuForgetPasswordRespVOMapper.ensureInitialized()
        .encodeJson<StuForgetPasswordRespVO>(this as StuForgetPasswordRespVO);
  }

  Map<String, dynamic> toMap() {
    return StuForgetPasswordRespVOMapper.ensureInitialized()
        .encodeMap<StuForgetPasswordRespVO>(this as StuForgetPasswordRespVO);
  }

  StuForgetPasswordRespVOCopyWith<StuForgetPasswordRespVO,
          StuForgetPasswordRespVO, StuForgetPasswordRespVO>
      get copyWith => _StuForgetPasswordRespVOCopyWithImpl<
              StuForgetPasswordRespVO, StuForgetPasswordRespVO>(
          this as StuForgetPasswordRespVO, $identity, $identity);
  @override
  String toString() {
    return StuForgetPasswordRespVOMapper.ensureInitialized()
        .stringifyValue(this as StuForgetPasswordRespVO);
  }

  @override
  bool operator ==(Object other) {
    return StuForgetPasswordRespVOMapper.ensureInitialized()
        .equalsValue(this as StuForgetPasswordRespVO, other);
  }

  @override
  int get hashCode {
    return StuForgetPasswordRespVOMapper.ensureInitialized()
        .hashValue(this as StuForgetPasswordRespVO);
  }
}

extension StuForgetPasswordRespVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StuForgetPasswordRespVO, $Out> {
  StuForgetPasswordRespVOCopyWith<$R, StuForgetPasswordRespVO, $Out>
      get $asStuForgetPasswordRespVO => $base.as((v, t, t2) =>
          _StuForgetPasswordRespVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StuForgetPasswordRespVOCopyWith<
    $R,
    $In extends StuForgetPasswordRespVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, StudentInfoVO,
      StudentInfoVOCopyWith<$R, StudentInfoVO, StudentInfoVO>>? get students;
  $R call({List<StudentInfoVO>? students});
  StuForgetPasswordRespVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StuForgetPasswordRespVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StuForgetPasswordRespVO, $Out>
    implements
        StuForgetPasswordRespVOCopyWith<$R, StuForgetPasswordRespVO, $Out> {
  _StuForgetPasswordRespVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StuForgetPasswordRespVO> $mapper =
      StuForgetPasswordRespVOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, StudentInfoVO,
          StudentInfoVOCopyWith<$R, StudentInfoVO, StudentInfoVO>>?
      get students => $value.students != null
          ? ListCopyWith($value.students!, (v, t) => v.copyWith.$chain(t),
              (v) => call(students: v))
          : null;
  @override
  $R call({Object? students = $none}) =>
      $apply(FieldCopyWithData({if (students != $none) #students: students}));
  @override
  StuForgetPasswordRespVO $make(CopyWithData data) => StuForgetPasswordRespVO(
      students: data.get(#students, or: $value.students));

  @override
  StuForgetPasswordRespVOCopyWith<$R2, StuForgetPasswordRespVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StuForgetPasswordRespVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
