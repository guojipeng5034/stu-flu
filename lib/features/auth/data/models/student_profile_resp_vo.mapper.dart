// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'student_profile_resp_vo.dart';

class SocialUserMapper extends ClassMapperBase<SocialUser> {
  SocialUserMapper._();

  static SocialUserMapper? _instance;
  static SocialUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SocialUserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SocialUser';

  static int _$type(SocialUser v) => v.type;
  static const Field<SocialUser, int> _f$type = Field('type', _$type);
  static String _$openid(SocialUser v) => v.openid;
  static const Field<SocialUser, String> _f$openid = Field('openid', _$openid);
  static String? _$nickname(SocialUser v) => v.nickname;
  static const Field<SocialUser, String> _f$nickname =
      Field('nickname', _$nickname, opt: true);
  static String? _$avatar(SocialUser v) => v.avatar;
  static const Field<SocialUser, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final MappableFields<SocialUser> fields = const {
    #type: _f$type,
    #openid: _f$openid,
    #nickname: _f$nickname,
    #avatar: _f$avatar,
  };
  @override
  final bool ignoreNull = true;

  static SocialUser _instantiate(DecodingData data) {
    return SocialUser(
        type: data.dec(_f$type),
        openid: data.dec(_f$openid),
        nickname: data.dec(_f$nickname),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static SocialUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SocialUser>(map);
  }

  static SocialUser fromJson(String json) {
    return ensureInitialized().decodeJson<SocialUser>(json);
  }
}

mixin SocialUserMappable {
  String toJson() {
    return SocialUserMapper.ensureInitialized()
        .encodeJson<SocialUser>(this as SocialUser);
  }

  Map<String, dynamic> toMap() {
    return SocialUserMapper.ensureInitialized()
        .encodeMap<SocialUser>(this as SocialUser);
  }

  SocialUserCopyWith<SocialUser, SocialUser, SocialUser> get copyWith =>
      _SocialUserCopyWithImpl<SocialUser, SocialUser>(
          this as SocialUser, $identity, $identity);
  @override
  String toString() {
    return SocialUserMapper.ensureInitialized()
        .stringifyValue(this as SocialUser);
  }

  @override
  bool operator ==(Object other) {
    return SocialUserMapper.ensureInitialized()
        .equalsValue(this as SocialUser, other);
  }

  @override
  int get hashCode {
    return SocialUserMapper.ensureInitialized().hashValue(this as SocialUser);
  }
}

extension SocialUserValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SocialUser, $Out> {
  SocialUserCopyWith<$R, SocialUser, $Out> get $asSocialUser =>
      $base.as((v, t, t2) => _SocialUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SocialUserCopyWith<$R, $In extends SocialUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? type, String? openid, String? nickname, String? avatar});
  SocialUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SocialUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SocialUser, $Out>
    implements SocialUserCopyWith<$R, SocialUser, $Out> {
  _SocialUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SocialUser> $mapper =
      SocialUserMapper.ensureInitialized();
  @override
  $R call(
          {int? type,
          String? openid,
          Object? nickname = $none,
          Object? avatar = $none}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (openid != null) #openid: openid,
        if (nickname != $none) #nickname: nickname,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  SocialUser $make(CopyWithData data) => SocialUser(
      type: data.get(#type, or: $value.type),
      openid: data.get(#openid, or: $value.openid),
      nickname: data.get(#nickname, or: $value.nickname),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  SocialUserCopyWith<$R2, SocialUser, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SocialUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StudentDetailMapper extends ClassMapperBase<StudentDetail> {
  StudentDetailMapper._();

  static StudentDetailMapper? _instance;
  static StudentDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentDetailMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StudentDetail';

  static String? _$firstName(StudentDetail v) => v.firstName;
  static const Field<StudentDetail, String> _f$firstName =
      Field('firstName', _$firstName, opt: true);
  static String? _$middleName(StudentDetail v) => v.middleName;
  static const Field<StudentDetail, String> _f$middleName =
      Field('middleName', _$middleName, opt: true);
  static String? _$lastName(StudentDetail v) => v.lastName;
  static const Field<StudentDetail, String> _f$lastName =
      Field('lastName', _$lastName, opt: true);
  static String? _$fullName(StudentDetail v) => v.fullName;
  static const Field<StudentDetail, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);

  @override
  final MappableFields<StudentDetail> fields = const {
    #firstName: _f$firstName,
    #middleName: _f$middleName,
    #lastName: _f$lastName,
    #fullName: _f$fullName,
  };
  @override
  final bool ignoreNull = true;

  static StudentDetail _instantiate(DecodingData data) {
    return StudentDetail(
        firstName: data.dec(_f$firstName),
        middleName: data.dec(_f$middleName),
        lastName: data.dec(_f$lastName),
        fullName: data.dec(_f$fullName));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StudentDetail>(map);
  }

  static StudentDetail fromJson(String json) {
    return ensureInitialized().decodeJson<StudentDetail>(json);
  }
}

mixin StudentDetailMappable {
  String toJson() {
    return StudentDetailMapper.ensureInitialized()
        .encodeJson<StudentDetail>(this as StudentDetail);
  }

  Map<String, dynamic> toMap() {
    return StudentDetailMapper.ensureInitialized()
        .encodeMap<StudentDetail>(this as StudentDetail);
  }

  StudentDetailCopyWith<StudentDetail, StudentDetail, StudentDetail>
      get copyWith => _StudentDetailCopyWithImpl<StudentDetail, StudentDetail>(
          this as StudentDetail, $identity, $identity);
  @override
  String toString() {
    return StudentDetailMapper.ensureInitialized()
        .stringifyValue(this as StudentDetail);
  }

  @override
  bool operator ==(Object other) {
    return StudentDetailMapper.ensureInitialized()
        .equalsValue(this as StudentDetail, other);
  }

  @override
  int get hashCode {
    return StudentDetailMapper.ensureInitialized()
        .hashValue(this as StudentDetail);
  }
}

extension StudentDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StudentDetail, $Out> {
  StudentDetailCopyWith<$R, StudentDetail, $Out> get $asStudentDetail =>
      $base.as((v, t, t2) => _StudentDetailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StudentDetailCopyWith<$R, $In extends StudentDetail, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? firstName,
      String? middleName,
      String? lastName,
      String? fullName});
  StudentDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StudentDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StudentDetail, $Out>
    implements StudentDetailCopyWith<$R, StudentDetail, $Out> {
  _StudentDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentDetail> $mapper =
      StudentDetailMapper.ensureInitialized();
  @override
  $R call(
          {Object? firstName = $none,
          Object? middleName = $none,
          Object? lastName = $none,
          Object? fullName = $none}) =>
      $apply(FieldCopyWithData({
        if (firstName != $none) #firstName: firstName,
        if (middleName != $none) #middleName: middleName,
        if (lastName != $none) #lastName: lastName,
        if (fullName != $none) #fullName: fullName
      }));
  @override
  StudentDetail $make(CopyWithData data) => StudentDetail(
      firstName: data.get(#firstName, or: $value.firstName),
      middleName: data.get(#middleName, or: $value.middleName),
      lastName: data.get(#lastName, or: $value.lastName),
      fullName: data.get(#fullName, or: $value.fullName));

  @override
  StudentDetailCopyWith<$R2, StudentDetail, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StudentDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StudentProfileRespVOMapper extends ClassMapperBase<StudentProfileRespVO> {
  StudentProfileRespVOMapper._();

  static StudentProfileRespVOMapper? _instance;
  static StudentProfileRespVOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StudentProfileRespVOMapper._());
      SocialUserMapper.ensureInitialized();
      StudentDetailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StudentProfileRespVO';

  static int _$siteId(StudentProfileRespVO v) => v.siteId;
  static const Field<StudentProfileRespVO, int> _f$siteId =
      Field('siteId', _$siteId);
  static String _$loginId(StudentProfileRespVO v) => v.loginId;
  static const Field<StudentProfileRespVO, String> _f$loginId =
      Field('loginId', _$loginId);
  static String? _$nickname(StudentProfileRespVO v) => v.nickname;
  static const Field<StudentProfileRespVO, String> _f$nickname =
      Field('nickname', _$nickname, opt: true);
  static String? _$firstName(StudentProfileRespVO v) => v.firstName;
  static const Field<StudentProfileRespVO, String> _f$firstName =
      Field('firstName', _$firstName, opt: true);
  static String? _$middleName(StudentProfileRespVO v) => v.middleName;
  static const Field<StudentProfileRespVO, String> _f$middleName =
      Field('middleName', _$middleName, opt: true);
  static String? _$lastName(StudentProfileRespVO v) => v.lastName;
  static const Field<StudentProfileRespVO, String> _f$lastName =
      Field('lastName', _$lastName, opt: true);
  static String? _$fullName(StudentProfileRespVO v) => v.fullName;
  static const Field<StudentProfileRespVO, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);
  static String? _$email(StudentProfileRespVO v) => v.email;
  static const Field<StudentProfileRespVO, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$mobile(StudentProfileRespVO v) => v.mobile;
  static const Field<StudentProfileRespVO, String> _f$mobile =
      Field('mobile', _$mobile, opt: true);
  static int? _$genderId(StudentProfileRespVO v) => v.genderId;
  static const Field<StudentProfileRespVO, int> _f$genderId =
      Field('genderId', _$genderId, opt: true);
  static String? _$imageFile(StudentProfileRespVO v) => v.imageFile;
  static const Field<StudentProfileRespVO, String> _f$imageFile =
      Field('imageFile', _$imageFile, opt: true);
  static String? _$uid(StudentProfileRespVO v) => v.uid;
  static const Field<StudentProfileRespVO, String> _f$uid =
      Field('uid', _$uid, opt: true);
  static String? _$createTime(StudentProfileRespVO v) => v.createTime;
  static const Field<StudentProfileRespVO, String> _f$createTime =
      Field('createTime', _$createTime, opt: true);
  static bool? _$hasPasswdFlag(StudentProfileRespVO v) => v.hasPasswdFlag;
  static const Field<StudentProfileRespVO, bool> _f$hasPasswdFlag =
      Field('hasPasswdFlag', _$hasPasswdFlag, opt: true);
  static String? _$birthday(StudentProfileRespVO v) => v.birthday;
  static const Field<StudentProfileRespVO, String> _f$birthday =
      Field('birthday', _$birthday, opt: true);
  static bool? _$parentFlag(StudentProfileRespVO v) => v.parentFlag;
  static const Field<StudentProfileRespVO, bool> _f$parentFlag =
      Field('parentFlag', _$parentFlag, opt: true);
  static int? _$parentStudentId(StudentProfileRespVO v) => v.parentStudentId;
  static const Field<StudentProfileRespVO, int> _f$parentStudentId =
      Field('parentStudentId', _$parentStudentId, opt: true);
  static List<SocialUser>? _$socialUsers(StudentProfileRespVO v) =>
      v.socialUsers;
  static const Field<StudentProfileRespVO, List<SocialUser>> _f$socialUsers =
      Field('socialUsers', _$socialUsers, opt: true);
  static StudentDetail? _$detail(StudentProfileRespVO v) => v.detail;
  static const Field<StudentProfileRespVO, StudentDetail> _f$detail =
      Field('detail', _$detail, opt: true);
  static bool? _$isNeedFill(StudentProfileRespVO v) => v.isNeedFill;
  static const Field<StudentProfileRespVO, bool> _f$isNeedFill =
      Field('isNeedFill', _$isNeedFill, opt: true);

  @override
  final MappableFields<StudentProfileRespVO> fields = const {
    #siteId: _f$siteId,
    #loginId: _f$loginId,
    #nickname: _f$nickname,
    #firstName: _f$firstName,
    #middleName: _f$middleName,
    #lastName: _f$lastName,
    #fullName: _f$fullName,
    #email: _f$email,
    #mobile: _f$mobile,
    #genderId: _f$genderId,
    #imageFile: _f$imageFile,
    #uid: _f$uid,
    #createTime: _f$createTime,
    #hasPasswdFlag: _f$hasPasswdFlag,
    #birthday: _f$birthday,
    #parentFlag: _f$parentFlag,
    #parentStudentId: _f$parentStudentId,
    #socialUsers: _f$socialUsers,
    #detail: _f$detail,
    #isNeedFill: _f$isNeedFill,
  };
  @override
  final bool ignoreNull = true;

  static StudentProfileRespVO _instantiate(DecodingData data) {
    return StudentProfileRespVO(
        siteId: data.dec(_f$siteId),
        loginId: data.dec(_f$loginId),
        nickname: data.dec(_f$nickname),
        firstName: data.dec(_f$firstName),
        middleName: data.dec(_f$middleName),
        lastName: data.dec(_f$lastName),
        fullName: data.dec(_f$fullName),
        email: data.dec(_f$email),
        mobile: data.dec(_f$mobile),
        genderId: data.dec(_f$genderId),
        imageFile: data.dec(_f$imageFile),
        uid: data.dec(_f$uid),
        createTime: data.dec(_f$createTime),
        hasPasswdFlag: data.dec(_f$hasPasswdFlag),
        birthday: data.dec(_f$birthday),
        parentFlag: data.dec(_f$parentFlag),
        parentStudentId: data.dec(_f$parentStudentId),
        socialUsers: data.dec(_f$socialUsers),
        detail: data.dec(_f$detail),
        isNeedFill: data.dec(_f$isNeedFill));
  }

  @override
  final Function instantiate = _instantiate;

  static StudentProfileRespVO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StudentProfileRespVO>(map);
  }

  static StudentProfileRespVO fromJson(String json) {
    return ensureInitialized().decodeJson<StudentProfileRespVO>(json);
  }
}

mixin StudentProfileRespVOMappable {
  String toJson() {
    return StudentProfileRespVOMapper.ensureInitialized()
        .encodeJson<StudentProfileRespVO>(this as StudentProfileRespVO);
  }

  Map<String, dynamic> toMap() {
    return StudentProfileRespVOMapper.ensureInitialized()
        .encodeMap<StudentProfileRespVO>(this as StudentProfileRespVO);
  }

  StudentProfileRespVOCopyWith<StudentProfileRespVO, StudentProfileRespVO,
      StudentProfileRespVO> get copyWith => _StudentProfileRespVOCopyWithImpl<
          StudentProfileRespVO, StudentProfileRespVO>(
      this as StudentProfileRespVO, $identity, $identity);
  @override
  String toString() {
    return StudentProfileRespVOMapper.ensureInitialized()
        .stringifyValue(this as StudentProfileRespVO);
  }

  @override
  bool operator ==(Object other) {
    return StudentProfileRespVOMapper.ensureInitialized()
        .equalsValue(this as StudentProfileRespVO, other);
  }

  @override
  int get hashCode {
    return StudentProfileRespVOMapper.ensureInitialized()
        .hashValue(this as StudentProfileRespVO);
  }
}

extension StudentProfileRespVOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StudentProfileRespVO, $Out> {
  StudentProfileRespVOCopyWith<$R, StudentProfileRespVO, $Out>
      get $asStudentProfileRespVO => $base.as(
          (v, t, t2) => _StudentProfileRespVOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StudentProfileRespVOCopyWith<
    $R,
    $In extends StudentProfileRespVO,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SocialUser, SocialUserCopyWith<$R, SocialUser, SocialUser>>?
      get socialUsers;
  StudentDetailCopyWith<$R, StudentDetail, StudentDetail>? get detail;
  $R call(
      {int? siteId,
      String? loginId,
      String? nickname,
      String? firstName,
      String? middleName,
      String? lastName,
      String? fullName,
      String? email,
      String? mobile,
      int? genderId,
      String? imageFile,
      String? uid,
      String? createTime,
      bool? hasPasswdFlag,
      String? birthday,
      bool? parentFlag,
      int? parentStudentId,
      List<SocialUser>? socialUsers,
      StudentDetail? detail,
      bool? isNeedFill});
  StudentProfileRespVOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StudentProfileRespVOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StudentProfileRespVO, $Out>
    implements StudentProfileRespVOCopyWith<$R, StudentProfileRespVO, $Out> {
  _StudentProfileRespVOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StudentProfileRespVO> $mapper =
      StudentProfileRespVOMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SocialUser, SocialUserCopyWith<$R, SocialUser, SocialUser>>?
      get socialUsers => $value.socialUsers != null
          ? ListCopyWith($value.socialUsers!, (v, t) => v.copyWith.$chain(t),
              (v) => call(socialUsers: v))
          : null;
  @override
  StudentDetailCopyWith<$R, StudentDetail, StudentDetail>? get detail =>
      $value.detail?.copyWith.$chain((v) => call(detail: v));
  @override
  $R call(
          {int? siteId,
          String? loginId,
          Object? nickname = $none,
          Object? firstName = $none,
          Object? middleName = $none,
          Object? lastName = $none,
          Object? fullName = $none,
          Object? email = $none,
          Object? mobile = $none,
          Object? genderId = $none,
          Object? imageFile = $none,
          Object? uid = $none,
          Object? createTime = $none,
          Object? hasPasswdFlag = $none,
          Object? birthday = $none,
          Object? parentFlag = $none,
          Object? parentStudentId = $none,
          Object? socialUsers = $none,
          Object? detail = $none,
          Object? isNeedFill = $none}) =>
      $apply(FieldCopyWithData({
        if (siteId != null) #siteId: siteId,
        if (loginId != null) #loginId: loginId,
        if (nickname != $none) #nickname: nickname,
        if (firstName != $none) #firstName: firstName,
        if (middleName != $none) #middleName: middleName,
        if (lastName != $none) #lastName: lastName,
        if (fullName != $none) #fullName: fullName,
        if (email != $none) #email: email,
        if (mobile != $none) #mobile: mobile,
        if (genderId != $none) #genderId: genderId,
        if (imageFile != $none) #imageFile: imageFile,
        if (uid != $none) #uid: uid,
        if (createTime != $none) #createTime: createTime,
        if (hasPasswdFlag != $none) #hasPasswdFlag: hasPasswdFlag,
        if (birthday != $none) #birthday: birthday,
        if (parentFlag != $none) #parentFlag: parentFlag,
        if (parentStudentId != $none) #parentStudentId: parentStudentId,
        if (socialUsers != $none) #socialUsers: socialUsers,
        if (detail != $none) #detail: detail,
        if (isNeedFill != $none) #isNeedFill: isNeedFill
      }));
  @override
  StudentProfileRespVO $make(CopyWithData data) => StudentProfileRespVO(
      siteId: data.get(#siteId, or: $value.siteId),
      loginId: data.get(#loginId, or: $value.loginId),
      nickname: data.get(#nickname, or: $value.nickname),
      firstName: data.get(#firstName, or: $value.firstName),
      middleName: data.get(#middleName, or: $value.middleName),
      lastName: data.get(#lastName, or: $value.lastName),
      fullName: data.get(#fullName, or: $value.fullName),
      email: data.get(#email, or: $value.email),
      mobile: data.get(#mobile, or: $value.mobile),
      genderId: data.get(#genderId, or: $value.genderId),
      imageFile: data.get(#imageFile, or: $value.imageFile),
      uid: data.get(#uid, or: $value.uid),
      createTime: data.get(#createTime, or: $value.createTime),
      hasPasswdFlag: data.get(#hasPasswdFlag, or: $value.hasPasswdFlag),
      birthday: data.get(#birthday, or: $value.birthday),
      parentFlag: data.get(#parentFlag, or: $value.parentFlag),
      parentStudentId: data.get(#parentStudentId, or: $value.parentStudentId),
      socialUsers: data.get(#socialUsers, or: $value.socialUsers),
      detail: data.get(#detail, or: $value.detail),
      isNeedFill: data.get(#isNeedFill, or: $value.isNeedFill));

  @override
  StudentProfileRespVOCopyWith<$R2, StudentProfileRespVO, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StudentProfileRespVOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
