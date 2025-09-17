// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stu_auth_resp_vo.dart';

class StudentInfoVOMapper extends ClassMapperBase<StudentInfoVO> {
  StudentInfoVOMapper._();

  static StudentInfoVOMapper? _instance;
  static StudentInfoVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentInfoVOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StudentInfoVO';

  static int _$siteId(StudentInfoVO v) => v.siteId;
  static const Field<StudentInfoVO, int> _f$siteId = Field('siteId', _$siteId);
  static String _$loginId(StudentInfoVO v) => v.loginId;
  static const Field<StudentInfoVO, String> _f$loginId =
      Field('loginId', _$loginId);
  static bool _$invalidFlag(StudentInfoVO v) => v.invalidFlag;
  static const Field<StudentInfoVO, bool> _f$invalidFlag =
      Field('invalidFlag', _$invalidFlag);
  static String? _$email(StudentInfoVO v) => v.email;
  static const Field<StudentInfoVO, String> _f$email =
      Field('email', _$email, opt: true);
  static String _$telCodeId(StudentInfoVO v) => v.telCodeId;
  static const Field<StudentInfoVO, String> _f$telCodeId =
      Field('telCodeId', _$telCodeId);
  static String? _$mobile(StudentInfoVO v) => v.mobile;
  static const Field<StudentInfoVO, String> _f$mobile =
      Field('mobile', _$mobile, opt: true);
  static bool? _$parentFlag(StudentInfoVO v) => v.parentFlag;
  static const Field<StudentInfoVO, bool> _f$parentFlag =
      Field('parentFlag', _$parentFlag, opt: true);
  static int? _$parentStudentId(StudentInfoVO v) => v.parentStudentId;
  static const Field<StudentInfoVO, int> _f$parentStudentId =
      Field('parentStudentId', _$parentStudentId, opt: true);
  static String? _$fullName(StudentInfoVO v) => v.fullName;
  static const Field<StudentInfoVO, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);
  static String? _$nickname(StudentInfoVO v) => v.nickname;
  static const Field<StudentInfoVO, String> _f$nickname =
      Field('nickname', _$nickname, opt: true);
  static String? _$imageFile(StudentInfoVO v) => v.imageFile;
  static const Field<StudentInfoVO, String> _f$imageFile =
      Field('imageFile', _$imageFile, opt: true);
  static int? _$genderId(StudentInfoVO v) => v.genderId;
  static const Field<StudentInfoVO, int> _f$genderId =
      Field('genderId', _$genderId, opt: true);
  static String? _$studentNumber(StudentInfoVO v) => v.studentNumber;
  static const Field<StudentInfoVO, String> _f$studentNumber =
      Field('studentNumber', _$studentNumber, opt: true);
  static int? _$age(StudentInfoVO v) => v.age;
  static const Field<StudentInfoVO, int> _f$age =
      Field('age', _$age, opt: true);
  static String? _$loginIp(StudentInfoVO v) => v.loginIp;
  static const Field<StudentInfoVO, String> _f$loginIp =
      Field('loginIp', _$loginIp, opt: true);
  static int? _$loginDate(StudentInfoVO v) => v.loginDate;
  static const Field<StudentInfoVO, int> _f$loginDate =
      Field('loginDate', _$loginDate, opt: true);
  static String? _$tempToken(StudentInfoVO v) => v.tempToken;
  static const Field<StudentInfoVO, String> _f$tempToken =
      Field('tempToken', _$tempToken, opt: true);

  @override
  final MappableFields<StudentInfoVO> fields = const {
    #siteId: _f$siteId,
    #loginId: _f$loginId,
    #invalidFlag: _f$invalidFlag,
    #email: _f$email,
    #telCodeId: _f$telCodeId,
    #mobile: _f$mobile,
    #parentFlag: _f$parentFlag,
    #parentStudentId: _f$parentStudentId,
    #fullName: _f$fullName,
    #nickname: _f$nickname,
    #imageFile: _f$imageFile,
    #genderId: _f$genderId,
    #studentNumber: _f$studentNumber,
    #age: _f$age,
    #loginIp: _f$loginIp,
    #loginDate: _f$loginDate,
    #tempToken: _f$tempToken,
  };
  @override
  final bool ignoreNull = true;

  static StudentInfoVO _instantiate(DecodingData data) {
    return StudentInfoVO(
        siteId: data.dec(_f$siteId),
        loginId: data.dec(_f$loginId),
        invalidFlag: data.dec(_f$invalidFlag),
        email: data.dec(_f$email),
        telCodeId: data.dec(_f$telCodeId),
        mobile: data.dec(_f$mobile),
        parentFlag: data.dec(_f$parentFlag),
        parentStudentId: data.dec(_f$parentStudentId),
        fullName: data.dec(_f$fullName),
        nickname: data.dec(_f$nickname),
        imageFile: data.dec(_f$imageFile),
        genderId: data.dec(_f$genderId),
        studentNumber: data.dec(_f$studentNumber),
        age: data.dec(_f$age),
        loginIp: data.dec(_f$loginIp),
        loginDate: data.dec(_f$loginDate),
        tempToken: data.dec(_f$tempToken));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentInfoVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StudentInfoVO>(map);
  }

  static StudentInfoVO fromJson(String json) {
    return ensureInitialized().decodeJson<StudentInfoVO>(json);
  }
}

mixin StudentInfoVOMappable {
  String toJson() {
    return StudentInfoVOMapper.ensureInitialized()
        .encodeJson<StudentInfoVO>(this as StudentInfoVO);
  }

  Map<String, dynamic> toMap() {
    return StudentInfoVOMapper.ensureInitialized()
        .encodeMap<StudentInfoVO>(this as StudentInfoVO);
  }

  StudentInfoVOCopyWith<StudentInfoVO, StudentInfoVO, StudentInfoVO>
      get copyWith => _StudentInfoVOCopyWithImpl<StudentInfoVO, StudentInfoVO>(
          this as StudentInfoVO, $identity, $identity);
  @override
  String toString() {
    return StudentInfoVOMapper.ensureInitialized()
        .stringifyValue(this as StudentInfoVO);
  }

  @override
  bool operator ==(Object other) {
    return StudentInfoVOMapper.ensureInitialized()
        .equalsValue(this as StudentInfoVO, other);
  }

  @override
  int get hashCode {
    return StudentInfoVOMapper.ensureInitialized()
        .hashValue(this as StudentInfoVO);
  }
}

extension StudentInfoVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StudentInfoVO, $Out> {
  StudentInfoVOCopyWith<$R, StudentInfoVO, $Out> get $asStudentInfoVO =>
      $base.as((v, t, t2) => _StudentInfoVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StudentInfoVOCopyWith<$R, $In extends StudentInfoVO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? siteId,
      String? loginId,
      bool? invalidFlag,
      String? email,
      String? telCodeId,
      String? mobile,
      bool? parentFlag,
      int? parentStudentId,
      String? fullName,
      String? nickname,
      String? imageFile,
      int? genderId,
      String? studentNumber,
      int? age,
      String? loginIp,
      int? loginDate,
      String? tempToken});
  StudentInfoVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StudentInfoVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StudentInfoVO, $Out>
    implements StudentInfoVOCopyWith<$R, StudentInfoVO, $Out> {
  _StudentInfoVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentInfoVO> $mapper =
      StudentInfoVOMapper.ensureInitialized();
  @override
  $R call(
          {int? siteId,
          String? loginId,
          bool? invalidFlag,
          Object? email = $none,
          String? telCodeId,
          Object? mobile = $none,
          Object? parentFlag = $none,
          Object? parentStudentId = $none,
          Object? fullName = $none,
          Object? nickname = $none,
          Object? imageFile = $none,
          Object? genderId = $none,
          Object? studentNumber = $none,
          Object? age = $none,
          Object? loginIp = $none,
          Object? loginDate = $none,
          Object? tempToken = $none}) =>
      $apply(FieldCopyWithData({
        if (siteId != null) #siteId: siteId,
        if (loginId != null) #loginId: loginId,
        if (invalidFlag != null) #invalidFlag: invalidFlag,
        if (email != $none) #email: email,
        if (telCodeId != null) #telCodeId: telCodeId,
        if (mobile != $none) #mobile: mobile,
        if (parentFlag != $none) #parentFlag: parentFlag,
        if (parentStudentId != $none) #parentStudentId: parentStudentId,
        if (fullName != $none) #fullName: fullName,
        if (nickname != $none) #nickname: nickname,
        if (imageFile != $none) #imageFile: imageFile,
        if (genderId != $none) #genderId: genderId,
        if (studentNumber != $none) #studentNumber: studentNumber,
        if (age != $none) #age: age,
        if (loginIp != $none) #loginIp: loginIp,
        if (loginDate != $none) #loginDate: loginDate,
        if (tempToken != $none) #tempToken: tempToken
      }));
  @override
  StudentInfoVO $make(CopyWithData data) => StudentInfoVO(
      siteId: data.get(#siteId, or: $value.siteId),
      loginId: data.get(#loginId, or: $value.loginId),
      invalidFlag: data.get(#invalidFlag, or: $value.invalidFlag),
      email: data.get(#email, or: $value.email),
      telCodeId: data.get(#telCodeId, or: $value.telCodeId),
      mobile: data.get(#mobile, or: $value.mobile),
      parentFlag: data.get(#parentFlag, or: $value.parentFlag),
      parentStudentId: data.get(#parentStudentId, or: $value.parentStudentId),
      fullName: data.get(#fullName, or: $value.fullName),
      nickname: data.get(#nickname, or: $value.nickname),
      imageFile: data.get(#imageFile, or: $value.imageFile),
      genderId: data.get(#genderId, or: $value.genderId),
      studentNumber: data.get(#studentNumber, or: $value.studentNumber),
      age: data.get(#age, or: $value.age),
      loginIp: data.get(#loginIp, or: $value.loginIp),
      loginDate: data.get(#loginDate, or: $value.loginDate),
      tempToken: data.get(#tempToken, or: $value.tempToken));

  @override
  StudentInfoVOCopyWith<$R2, StudentInfoVO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StudentInfoVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StudentAccessTokenVOMapper extends ClassMapperBase<StudentAccessTokenVO> {
  StudentAccessTokenVOMapper._();

  static StudentAccessTokenVOMapper? _instance;
  static StudentAccessTokenVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentAccessTokenVOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StudentAccessTokenVO';

  static String _$accessToken(StudentAccessTokenVO v) => v.accessToken;
  static const Field<StudentAccessTokenVO, String> _f$accessToken =
      Field('accessToken', _$accessToken, key: r'access_token');
  static String _$tokenType(StudentAccessTokenVO v) => v.tokenType;
  static const Field<StudentAccessTokenVO, String> _f$tokenType =
      Field('tokenType', _$tokenType, key: r'token_type');
  static int _$expiresIn(StudentAccessTokenVO v) => v.expiresIn;
  static const Field<StudentAccessTokenVO, int> _f$expiresIn =
      Field('expiresIn', _$expiresIn, key: r'expires_in');
  static String _$refreshToken(StudentAccessTokenVO v) => v.refreshToken;
  static const Field<StudentAccessTokenVO, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken, key: r'refresh_token');
  static String? _$qqeToken(StudentAccessTokenVO v) => v.qqeToken;
  static const Field<StudentAccessTokenVO, String> _f$qqeToken =
      Field('qqeToken', _$qqeToken, key: r'qqe_token', opt: true);
  static String? _$qqeJwtToken(StudentAccessTokenVO v) => v.qqeJwtToken;
  static const Field<StudentAccessTokenVO, String> _f$qqeJwtToken =
      Field('qqeJwtToken', _$qqeJwtToken, key: r'qqe_jwt_token', opt: true);

  @override
  final MappableFields<StudentAccessTokenVO> fields = const {
    #accessToken: _f$accessToken,
    #tokenType: _f$tokenType,
    #expiresIn: _f$expiresIn,
    #refreshToken: _f$refreshToken,
    #qqeToken: _f$qqeToken,
    #qqeJwtToken: _f$qqeJwtToken,
  };
  @override
  final bool ignoreNull = true;

  static StudentAccessTokenVO _instantiate(DecodingData data) {
    return StudentAccessTokenVO(
        accessToken: data.dec(_f$accessToken),
        tokenType: data.dec(_f$tokenType),
        expiresIn: data.dec(_f$expiresIn),
        refreshToken: data.dec(_f$refreshToken),
        qqeToken: data.dec(_f$qqeToken),
        qqeJwtToken: data.dec(_f$qqeJwtToken));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentAccessTokenVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StudentAccessTokenVO>(map);
  }

  static StudentAccessTokenVO fromJson(String json) {
    return ensureInitialized().decodeJson<StudentAccessTokenVO>(json);
  }
}

mixin StudentAccessTokenVOMappable {
  String toJson() {
    return StudentAccessTokenVOMapper.ensureInitialized()
        .encodeJson<StudentAccessTokenVO>(this as StudentAccessTokenVO);
  }

  Map<String, dynamic> toMap() {
    return StudentAccessTokenVOMapper.ensureInitialized()
        .encodeMap<StudentAccessTokenVO>(this as StudentAccessTokenVO);
  }

  StudentAccessTokenVOCopyWith<StudentAccessTokenVO, StudentAccessTokenVO,
      StudentAccessTokenVO> get copyWith => _StudentAccessTokenVOCopyWithImpl<
          StudentAccessTokenVO, StudentAccessTokenVO>(
      this as StudentAccessTokenVO, $identity, $identity);
  @override
  String toString() {
    return StudentAccessTokenVOMapper.ensureInitialized()
        .stringifyValue(this as StudentAccessTokenVO);
  }

  @override
  bool operator ==(Object other) {
    return StudentAccessTokenVOMapper.ensureInitialized()
        .equalsValue(this as StudentAccessTokenVO, other);
  }

  @override
  int get hashCode {
    return StudentAccessTokenVOMapper.ensureInitialized()
        .hashValue(this as StudentAccessTokenVO);
  }
}

extension StudentAccessTokenVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StudentAccessTokenVO, $Out> {
  StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, $Out>
      get $asStudentAccessTokenVO => $base.as(
          (v, t, t2) => _StudentAccessTokenVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StudentAccessTokenVOCopyWith<
    $R,
    $In extends StudentAccessTokenVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? accessToken,
      String? tokenType,
      int? expiresIn,
      String? refreshToken,
      String? qqeToken,
      String? qqeJwtToken});
  StudentAccessTokenVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StudentAccessTokenVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StudentAccessTokenVO, $Out>
    implements StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, $Out> {
  _StudentAccessTokenVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentAccessTokenVO> $mapper =
      StudentAccessTokenVOMapper.ensureInitialized();
  @override
  $R call(
          {String? accessToken,
          String? tokenType,
          int? expiresIn,
          String? refreshToken,
          Object? qqeToken = $none,
          Object? qqeJwtToken = $none}) =>
      $apply(FieldCopyWithData({
        if (accessToken != null) #accessToken: accessToken,
        if (tokenType != null) #tokenType: tokenType,
        if (expiresIn != null) #expiresIn: expiresIn,
        if (refreshToken != null) #refreshToken: refreshToken,
        if (qqeToken != $none) #qqeToken: qqeToken,
        if (qqeJwtToken != $none) #qqeJwtToken: qqeJwtToken
      }));
  @override
  StudentAccessTokenVO $make(CopyWithData data) => StudentAccessTokenVO(
      accessToken: data.get(#accessToken, or: $value.accessToken),
      tokenType: data.get(#tokenType, or: $value.tokenType),
      expiresIn: data.get(#expiresIn, or: $value.expiresIn),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken),
      qqeToken: data.get(#qqeToken, or: $value.qqeToken),
      qqeJwtToken: data.get(#qqeJwtToken, or: $value.qqeJwtToken));

  @override
  StudentAccessTokenVOCopyWith<$R2, StudentAccessTokenVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StudentAccessTokenVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StuAuthRespVOMapper extends ClassMapperBase<StuAuthRespVO> {
  StuAuthRespVOMapper._();

  static StuAuthRespVOMapper? _instance;
  static StuAuthRespVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StuAuthRespVOMapper._());
      StudentInfoVOMapper.ensureInitialized();
      StudentAccessTokenVOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StuAuthRespVO';

  static bool _$multiple(StuAuthRespVO v) => v.multiple;
  static const Field<StuAuthRespVO, bool> _f$multiple =
      Field('multiple', _$multiple);
  static bool _$registerFlag(StuAuthRespVO v) => v.registerFlag;
  static const Field<StuAuthRespVO, bool> _f$registerFlag =
      Field('registerFlag', _$registerFlag);
  static List<StudentInfoVO>? _$students(StuAuthRespVO v) => v.students;
  static const Field<StuAuthRespVO, List<StudentInfoVO>> _f$students =
      Field('students', _$students, opt: true);
  static StudentAccessTokenVO? _$token(StuAuthRespVO v) => v.token;
  static const Field<StuAuthRespVO, StudentAccessTokenVO> _f$token =
      Field('token', _$token, opt: true);
  static int? _$socialType(StuAuthRespVO v) => v.socialType;
  static const Field<StuAuthRespVO, int> _f$socialType =
      Field('socialType', _$socialType, opt: true);
  static String? _$socialOpenid(StuAuthRespVO v) => v.socialOpenid;
  static const Field<StuAuthRespVO, String> _f$socialOpenid =
      Field('socialOpenid', _$socialOpenid, opt: true);

  @override
  final MappableFields<StuAuthRespVO> fields = const {
    #multiple: _f$multiple,
    #registerFlag: _f$registerFlag,
    #students: _f$students,
    #token: _f$token,
    #socialType: _f$socialType,
    #socialOpenid: _f$socialOpenid,
  };
  @override
  final bool ignoreNull = true;

  static StuAuthRespVO _instantiate(DecodingData data) {
    return StuAuthRespVO(
        multiple: data.dec(_f$multiple),
        registerFlag: data.dec(_f$registerFlag),
        students: data.dec(_f$students),
        token: data.dec(_f$token),
        socialType: data.dec(_f$socialType),
        socialOpenid: data.dec(_f$socialOpenid));
  }

  @override
  final Function instantiate = _instantiate;

  static StuAuthRespVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StuAuthRespVO>(map);
  }

  static StuAuthRespVO fromJson(String json) {
    return ensureInitialized().decodeJson<StuAuthRespVO>(json);
  }
}

mixin StuAuthRespVOMappable {
  String toJson() {
    return StuAuthRespVOMapper.ensureInitialized()
        .encodeJson<StuAuthRespVO>(this as StuAuthRespVO);
  }

  Map<String, dynamic> toMap() {
    return StuAuthRespVOMapper.ensureInitialized()
        .encodeMap<StuAuthRespVO>(this as StuAuthRespVO);
  }

  StuAuthRespVOCopyWith<StuAuthRespVO, StuAuthRespVO, StuAuthRespVO>
      get copyWith => _StuAuthRespVOCopyWithImpl<StuAuthRespVO, StuAuthRespVO>(
          this as StuAuthRespVO, $identity, $identity);
  @override
  String toString() {
    return StuAuthRespVOMapper.ensureInitialized()
        .stringifyValue(this as StuAuthRespVO);
  }

  @override
  bool operator ==(Object other) {
    return StuAuthRespVOMapper.ensureInitialized()
        .equalsValue(this as StuAuthRespVO, other);
  }

  @override
  int get hashCode {
    return StuAuthRespVOMapper.ensureInitialized()
        .hashValue(this as StuAuthRespVO);
  }
}

extension StuAuthRespVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StuAuthRespVO, $Out> {
  StuAuthRespVOCopyWith<$R, StuAuthRespVO, $Out> get $asStuAuthRespVO =>
      $base.as((v, t, t2) => _StuAuthRespVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StuAuthRespVOCopyWith<$R, $In extends StuAuthRespVO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, StudentInfoVO,
      StudentInfoVOCopyWith<$R, StudentInfoVO, StudentInfoVO>>? get students;
  StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, StudentAccessTokenVO>?
      get token;
  $R call(
      {bool? multiple,
      bool? registerFlag,
      List<StudentInfoVO>? students,
      StudentAccessTokenVO? token,
      int? socialType,
      String? socialOpenid});
  StuAuthRespVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StuAuthRespVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StuAuthRespVO, $Out>
    implements StuAuthRespVOCopyWith<$R, StuAuthRespVO, $Out> {
  _StuAuthRespVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StuAuthRespVO> $mapper =
      StuAuthRespVOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, StudentInfoVO,
          StudentInfoVOCopyWith<$R, StudentInfoVO, StudentInfoVO>>?
      get students => $value.students != null
          ? ListCopyWith($value.students!, (v, t) => v.copyWith.$chain(t),
              (v) => call(students: v))
          : null;
  @override
  StudentAccessTokenVOCopyWith<$R, StudentAccessTokenVO, StudentAccessTokenVO>?
      get token => $value.token?.copyWith.$chain((v) => call(token: v));
  @override
  $R call(
          {bool? multiple,
          bool? registerFlag,
          Object? students = $none,
          Object? token = $none,
          Object? socialType = $none,
          Object? socialOpenid = $none}) =>
      $apply(FieldCopyWithData({
        if (multiple != null) #multiple: multiple,
        if (registerFlag != null) #registerFlag: registerFlag,
        if (students != $none) #students: students,
        if (token != $none) #token: token,
        if (socialType != $none) #socialType: socialType,
        if (socialOpenid != $none) #socialOpenid: socialOpenid
      }));
  @override
  StuAuthRespVO $make(CopyWithData data) => StuAuthRespVO(
      multiple: data.get(#multiple, or: $value.multiple),
      registerFlag: data.get(#registerFlag, or: $value.registerFlag),
      students: data.get(#students, or: $value.students),
      token: data.get(#token, or: $value.token),
      socialType: data.get(#socialType, or: $value.socialType),
      socialOpenid: data.get(#socialOpenid, or: $value.socialOpenid));

  @override
  StuAuthRespVOCopyWith<$R2, StuAuthRespVO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StuAuthRespVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
