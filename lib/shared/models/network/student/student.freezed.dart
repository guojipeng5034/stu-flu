// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  String? get birthday => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  ApplicableUser? get curriculumApplicableUser =>
      throw _privateConstructorUsedError;
  String? get defaultVideoTool => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  List<StudentFamily> get family => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int get genderId => throw _privateConstructorUsedError;
  String? get helpLink => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get points => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  String? get subscriptionId => throw _privateConstructorUsedError;
  String? get tel => throw _privateConstructorUsedError;
  String? get timeZone => throw _privateConstructorUsedError;
  String? get totalFollow => throw _privateConstructorUsedError;
  String? get totalTicketLog => throw _privateConstructorUsedError;
  List<Curriculum> get commonCurriculumIds =>
      throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get requireSubstitute => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get completedFtl => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get hasActiveSubscription => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get hasActiveTickets => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get hasFtlLesson => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get skipFtl => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get siteName => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get defaultVideoToolProvider => throw _privateConstructorUsedError;

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {String? birthday,
      String? uid,
      ApplicableUser? curriculumApplicableUser,
      String? defaultVideoTool,
      String? email,
      String? phone,
      List<StudentFamily> family,
      String? gender,
      int genderId,
      String? helpLink,
      int id,
      String? imageFile,
      String? name,
      String? firstName,
      String? lastName,
      String? nickname,
      String? points,
      int siteId,
      String? subscriptionId,
      String? tel,
      String? timeZone,
      String? totalFollow,
      String? totalTicketLog,
      List<Curriculum> commonCurriculumIds,
      @CTBoolConverter() bool requireSubstitute,
      @CTBoolConverter() bool completedFtl,
      @CTBoolConverter() bool hasActiveSubscription,
      @CTBoolConverter() bool hasActiveTickets,
      @CTBoolConverter() bool hasFtlLesson,
      @CTBoolConverter() bool skipFtl,
      String? lang,
      String? siteName,
      String? mobile,
      String? defaultVideoToolProvider});

  $ApplicableUserCopyWith<$Res>? get curriculumApplicableUser;
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? uid = freezed,
    Object? curriculumApplicableUser = freezed,
    Object? defaultVideoTool = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? family = null,
    Object? gender = freezed,
    Object? genderId = null,
    Object? helpLink = freezed,
    Object? id = null,
    Object? imageFile = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? nickname = freezed,
    Object? points = freezed,
    Object? siteId = null,
    Object? subscriptionId = freezed,
    Object? tel = freezed,
    Object? timeZone = freezed,
    Object? totalFollow = freezed,
    Object? totalTicketLog = freezed,
    Object? commonCurriculumIds = null,
    Object? requireSubstitute = null,
    Object? completedFtl = null,
    Object? hasActiveSubscription = null,
    Object? hasActiveTickets = null,
    Object? hasFtlLesson = null,
    Object? skipFtl = null,
    Object? lang = freezed,
    Object? siteName = freezed,
    Object? mobile = freezed,
    Object? defaultVideoToolProvider = freezed,
  }) {
    return _then(_value.copyWith(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumApplicableUser: freezed == curriculumApplicableUser
          ? _value.curriculumApplicableUser
          : curriculumApplicableUser // ignore: cast_nullable_to_non_nullable
              as ApplicableUser?,
      defaultVideoTool: freezed == defaultVideoTool
          ? _value.defaultVideoTool
          : defaultVideoTool // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as List<StudentFamily>,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderId: null == genderId
          ? _value.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int,
      helpLink: freezed == helpLink
          ? _value.helpLink
          : helpLink // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFollow: freezed == totalFollow
          ? _value.totalFollow
          : totalFollow // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTicketLog: freezed == totalTicketLog
          ? _value.totalTicketLog
          : totalTicketLog // ignore: cast_nullable_to_non_nullable
              as String?,
      commonCurriculumIds: null == commonCurriculumIds
          ? _value.commonCurriculumIds
          : commonCurriculumIds // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
      requireSubstitute: null == requireSubstitute
          ? _value.requireSubstitute
          : requireSubstitute // ignore: cast_nullable_to_non_nullable
              as bool,
      completedFtl: null == completedFtl
          ? _value.completedFtl
          : completedFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSubscription: null == hasActiveSubscription
          ? _value.hasActiveSubscription
          : hasActiveSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveTickets: null == hasActiveTickets
          ? _value.hasActiveTickets
          : hasActiveTickets // ignore: cast_nullable_to_non_nullable
              as bool,
      hasFtlLesson: null == hasFtlLesson
          ? _value.hasFtlLesson
          : hasFtlLesson // ignore: cast_nullable_to_non_nullable
              as bool,
      skipFtl: null == skipFtl
          ? _value.skipFtl
          : skipFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultVideoToolProvider: freezed == defaultVideoToolProvider
          ? _value.defaultVideoToolProvider
          : defaultVideoToolProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicableUserCopyWith<$Res>? get curriculumApplicableUser {
    if (_value.curriculumApplicableUser == null) {
      return null;
    }

    return $ApplicableUserCopyWith<$Res>(_value.curriculumApplicableUser!,
        (value) {
      return _then(_value.copyWith(curriculumApplicableUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? birthday,
      String? uid,
      ApplicableUser? curriculumApplicableUser,
      String? defaultVideoTool,
      String? email,
      String? phone,
      List<StudentFamily> family,
      String? gender,
      int genderId,
      String? helpLink,
      int id,
      String? imageFile,
      String? name,
      String? firstName,
      String? lastName,
      String? nickname,
      String? points,
      int siteId,
      String? subscriptionId,
      String? tel,
      String? timeZone,
      String? totalFollow,
      String? totalTicketLog,
      List<Curriculum> commonCurriculumIds,
      @CTBoolConverter() bool requireSubstitute,
      @CTBoolConverter() bool completedFtl,
      @CTBoolConverter() bool hasActiveSubscription,
      @CTBoolConverter() bool hasActiveTickets,
      @CTBoolConverter() bool hasFtlLesson,
      @CTBoolConverter() bool skipFtl,
      String? lang,
      String? siteName,
      String? mobile,
      String? defaultVideoToolProvider});

  @override
  $ApplicableUserCopyWith<$Res>? get curriculumApplicableUser;
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? uid = freezed,
    Object? curriculumApplicableUser = freezed,
    Object? defaultVideoTool = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? family = null,
    Object? gender = freezed,
    Object? genderId = null,
    Object? helpLink = freezed,
    Object? id = null,
    Object? imageFile = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? nickname = freezed,
    Object? points = freezed,
    Object? siteId = null,
    Object? subscriptionId = freezed,
    Object? tel = freezed,
    Object? timeZone = freezed,
    Object? totalFollow = freezed,
    Object? totalTicketLog = freezed,
    Object? commonCurriculumIds = null,
    Object? requireSubstitute = null,
    Object? completedFtl = null,
    Object? hasActiveSubscription = null,
    Object? hasActiveTickets = null,
    Object? hasFtlLesson = null,
    Object? skipFtl = null,
    Object? lang = freezed,
    Object? siteName = freezed,
    Object? mobile = freezed,
    Object? defaultVideoToolProvider = freezed,
  }) {
    return _then(_$StudentImpl(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumApplicableUser: freezed == curriculumApplicableUser
          ? _value.curriculumApplicableUser
          : curriculumApplicableUser // ignore: cast_nullable_to_non_nullable
              as ApplicableUser?,
      defaultVideoTool: freezed == defaultVideoTool
          ? _value.defaultVideoTool
          : defaultVideoTool // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      family: null == family
          ? _value._family
          : family // ignore: cast_nullable_to_non_nullable
              as List<StudentFamily>,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderId: null == genderId
          ? _value.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int,
      helpLink: freezed == helpLink
          ? _value.helpLink
          : helpLink // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      tel: freezed == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      totalFollow: freezed == totalFollow
          ? _value.totalFollow
          : totalFollow // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTicketLog: freezed == totalTicketLog
          ? _value.totalTicketLog
          : totalTicketLog // ignore: cast_nullable_to_non_nullable
              as String?,
      commonCurriculumIds: null == commonCurriculumIds
          ? _value._commonCurriculumIds
          : commonCurriculumIds // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
      requireSubstitute: null == requireSubstitute
          ? _value.requireSubstitute
          : requireSubstitute // ignore: cast_nullable_to_non_nullable
              as bool,
      completedFtl: null == completedFtl
          ? _value.completedFtl
          : completedFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveSubscription: null == hasActiveSubscription
          ? _value.hasActiveSubscription
          : hasActiveSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveTickets: null == hasActiveTickets
          ? _value.hasActiveTickets
          : hasActiveTickets // ignore: cast_nullable_to_non_nullable
              as bool,
      hasFtlLesson: null == hasFtlLesson
          ? _value.hasFtlLesson
          : hasFtlLesson // ignore: cast_nullable_to_non_nullable
              as bool,
      skipFtl: null == skipFtl
          ? _value.skipFtl
          : skipFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultVideoToolProvider: freezed == defaultVideoToolProvider
          ? _value.defaultVideoToolProvider
          : defaultVideoToolProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentImpl implements _Student {
  const _$StudentImpl(
      {this.birthday,
      this.uid,
      this.curriculumApplicableUser,
      this.defaultVideoTool,
      this.email,
      this.phone,
      final List<StudentFamily> family = const [],
      this.gender,
      this.genderId = 0,
      this.helpLink,
      this.id = 0,
      this.imageFile,
      this.name,
      this.firstName,
      this.lastName,
      this.nickname,
      this.points,
      this.siteId = 0,
      this.subscriptionId,
      this.tel,
      this.timeZone,
      this.totalFollow,
      this.totalTicketLog,
      final List<Curriculum> commonCurriculumIds = const [],
      @CTBoolConverter() this.requireSubstitute = false,
      @CTBoolConverter() this.completedFtl = false,
      @CTBoolConverter() this.hasActiveSubscription = false,
      @CTBoolConverter() this.hasActiveTickets = false,
      @CTBoolConverter() this.hasFtlLesson = false,
      @CTBoolConverter() this.skipFtl = false,
      this.lang,
      this.siteName,
      this.mobile,
      this.defaultVideoToolProvider})
      : _family = family,
        _commonCurriculumIds = commonCurriculumIds;

  factory _$StudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentImplFromJson(json);

  @override
  final String? birthday;
  @override
  final String? uid;
  @override
  final ApplicableUser? curriculumApplicableUser;
  @override
  final String? defaultVideoTool;
  @override
  final String? email;
  @override
  final String? phone;
  final List<StudentFamily> _family;
  @override
  @JsonKey()
  List<StudentFamily> get family {
    if (_family is EqualUnmodifiableListView) return _family;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_family);
  }

  @override
  final String? gender;
  @override
  @JsonKey()
  final int genderId;
  @override
  final String? helpLink;
  @override
  @JsonKey()
  final int id;
  @override
  final String? imageFile;
  @override
  final String? name;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? nickname;
  @override
  final String? points;
  @override
  @JsonKey()
  final int siteId;
  @override
  final String? subscriptionId;
  @override
  final String? tel;
  @override
  final String? timeZone;
  @override
  final String? totalFollow;
  @override
  final String? totalTicketLog;
  final List<Curriculum> _commonCurriculumIds;
  @override
  @JsonKey()
  List<Curriculum> get commonCurriculumIds {
    if (_commonCurriculumIds is EqualUnmodifiableListView)
      return _commonCurriculumIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonCurriculumIds);
  }

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool requireSubstitute;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool completedFtl;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool hasActiveSubscription;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool hasActiveTickets;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool hasFtlLesson;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool skipFtl;
  @override
  final String? lang;
  @override
  final String? siteName;
  @override
  final String? mobile;
  @override
  final String? defaultVideoToolProvider;

  @override
  String toString() {
    return 'Student(birthday: $birthday, uid: $uid, curriculumApplicableUser: $curriculumApplicableUser, defaultVideoTool: $defaultVideoTool, email: $email, phone: $phone, family: $family, gender: $gender, genderId: $genderId, helpLink: $helpLink, id: $id, imageFile: $imageFile, name: $name, firstName: $firstName, lastName: $lastName, nickname: $nickname, points: $points, siteId: $siteId, subscriptionId: $subscriptionId, tel: $tel, timeZone: $timeZone, totalFollow: $totalFollow, totalTicketLog: $totalTicketLog, commonCurriculumIds: $commonCurriculumIds, requireSubstitute: $requireSubstitute, completedFtl: $completedFtl, hasActiveSubscription: $hasActiveSubscription, hasActiveTickets: $hasActiveTickets, hasFtlLesson: $hasFtlLesson, skipFtl: $skipFtl, lang: $lang, siteName: $siteName, mobile: $mobile, defaultVideoToolProvider: $defaultVideoToolProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentImpl &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(
                    other.curriculumApplicableUser, curriculumApplicableUser) ||
                other.curriculumApplicableUser == curriculumApplicableUser) &&
            (identical(other.defaultVideoTool, defaultVideoTool) ||
                other.defaultVideoTool == defaultVideoTool) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._family, _family) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId) &&
            (identical(other.helpLink, helpLink) ||
                other.helpLink == helpLink) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.totalFollow, totalFollow) ||
                other.totalFollow == totalFollow) &&
            (identical(other.totalTicketLog, totalTicketLog) ||
                other.totalTicketLog == totalTicketLog) &&
            const DeepCollectionEquality()
                .equals(other._commonCurriculumIds, _commonCurriculumIds) &&
            (identical(other.requireSubstitute, requireSubstitute) ||
                other.requireSubstitute == requireSubstitute) &&
            (identical(other.completedFtl, completedFtl) ||
                other.completedFtl == completedFtl) &&
            (identical(other.hasActiveSubscription, hasActiveSubscription) ||
                other.hasActiveSubscription == hasActiveSubscription) &&
            (identical(other.hasActiveTickets, hasActiveTickets) ||
                other.hasActiveTickets == hasActiveTickets) &&
            (identical(other.hasFtlLesson, hasFtlLesson) ||
                other.hasFtlLesson == hasFtlLesson) &&
            (identical(other.skipFtl, skipFtl) || other.skipFtl == skipFtl) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(
                    other.defaultVideoToolProvider, defaultVideoToolProvider) ||
                other.defaultVideoToolProvider == defaultVideoToolProvider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        birthday,
        uid,
        curriculumApplicableUser,
        defaultVideoTool,
        email,
        phone,
        const DeepCollectionEquality().hash(_family),
        gender,
        genderId,
        helpLink,
        id,
        imageFile,
        name,
        firstName,
        lastName,
        nickname,
        points,
        siteId,
        subscriptionId,
        tel,
        timeZone,
        totalFollow,
        totalTicketLog,
        const DeepCollectionEquality().hash(_commonCurriculumIds),
        requireSubstitute,
        completedFtl,
        hasActiveSubscription,
        hasActiveTickets,
        hasFtlLesson,
        skipFtl,
        lang,
        siteName,
        mobile,
        defaultVideoToolProvider
      ]);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentImplToJson(
      this,
    );
  }
}

abstract class _Student implements Student {
  const factory _Student(
      {final String? birthday,
      final String? uid,
      final ApplicableUser? curriculumApplicableUser,
      final String? defaultVideoTool,
      final String? email,
      final String? phone,
      final List<StudentFamily> family,
      final String? gender,
      final int genderId,
      final String? helpLink,
      final int id,
      final String? imageFile,
      final String? name,
      final String? firstName,
      final String? lastName,
      final String? nickname,
      final String? points,
      final int siteId,
      final String? subscriptionId,
      final String? tel,
      final String? timeZone,
      final String? totalFollow,
      final String? totalTicketLog,
      final List<Curriculum> commonCurriculumIds,
      @CTBoolConverter() final bool requireSubstitute,
      @CTBoolConverter() final bool completedFtl,
      @CTBoolConverter() final bool hasActiveSubscription,
      @CTBoolConverter() final bool hasActiveTickets,
      @CTBoolConverter() final bool hasFtlLesson,
      @CTBoolConverter() final bool skipFtl,
      final String? lang,
      final String? siteName,
      final String? mobile,
      final String? defaultVideoToolProvider}) = _$StudentImpl;

  factory _Student.fromJson(Map<String, dynamic> json) = _$StudentImpl.fromJson;

  @override
  String? get birthday;
  @override
  String? get uid;
  @override
  ApplicableUser? get curriculumApplicableUser;
  @override
  String? get defaultVideoTool;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  List<StudentFamily> get family;
  @override
  String? get gender;
  @override
  int get genderId;
  @override
  String? get helpLink;
  @override
  int get id;
  @override
  String? get imageFile;
  @override
  String? get name;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get nickname;
  @override
  String? get points;
  @override
  int get siteId;
  @override
  String? get subscriptionId;
  @override
  String? get tel;
  @override
  String? get timeZone;
  @override
  String? get totalFollow;
  @override
  String? get totalTicketLog;
  @override
  List<Curriculum> get commonCurriculumIds;
  @override
  @CTBoolConverter()
  bool get requireSubstitute;
  @override
  @CTBoolConverter()
  bool get completedFtl;
  @override
  @CTBoolConverter()
  bool get hasActiveSubscription;
  @override
  @CTBoolConverter()
  bool get hasActiveTickets;
  @override
  @CTBoolConverter()
  bool get hasFtlLesson;
  @override
  @CTBoolConverter()
  bool get skipFtl;
  @override
  String? get lang;
  @override
  String? get siteName;
  @override
  String? get mobile;
  @override
  String? get defaultVideoToolProvider;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentFamily _$StudentFamilyFromJson(Map<String, dynamic> json) {
  return _StudentFamily.fromJson(json);
}

/// @nodoc
mixin _$StudentFamily {
  int get id => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  /// Serializes this StudentFamily to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentFamily
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentFamilyCopyWith<StudentFamily> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentFamilyCopyWith<$Res> {
  factory $StudentFamilyCopyWith(
          StudentFamily value, $Res Function(StudentFamily) then) =
      _$StudentFamilyCopyWithImpl<$Res, StudentFamily>;
  @useResult
  $Res call({int id, String? imageFile, String? nickname});
}

/// @nodoc
class _$StudentFamilyCopyWithImpl<$Res, $Val extends StudentFamily>
    implements $StudentFamilyCopyWith<$Res> {
  _$StudentFamilyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentFamily
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageFile = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentFamilyImplCopyWith<$Res>
    implements $StudentFamilyCopyWith<$Res> {
  factory _$$StudentFamilyImplCopyWith(
          _$StudentFamilyImpl value, $Res Function(_$StudentFamilyImpl) then) =
      __$$StudentFamilyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? imageFile, String? nickname});
}

/// @nodoc
class __$$StudentFamilyImplCopyWithImpl<$Res>
    extends _$StudentFamilyCopyWithImpl<$Res, _$StudentFamilyImpl>
    implements _$$StudentFamilyImplCopyWith<$Res> {
  __$$StudentFamilyImplCopyWithImpl(
      _$StudentFamilyImpl _value, $Res Function(_$StudentFamilyImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentFamily
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageFile = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_$StudentFamilyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentFamilyImpl implements _StudentFamily {
  const _$StudentFamilyImpl({this.id = 0, this.imageFile, this.nickname});

  factory _$StudentFamilyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentFamilyImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String? imageFile;
  @override
  final String? nickname;

  @override
  String toString() {
    return 'StudentFamily(id: $id, imageFile: $imageFile, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentFamilyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageFile, nickname);

  /// Create a copy of StudentFamily
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentFamilyImplCopyWith<_$StudentFamilyImpl> get copyWith =>
      __$$StudentFamilyImplCopyWithImpl<_$StudentFamilyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentFamilyImplToJson(
      this,
    );
  }
}

abstract class _StudentFamily implements StudentFamily {
  const factory _StudentFamily(
      {final int id,
      final String? imageFile,
      final String? nickname}) = _$StudentFamilyImpl;

  factory _StudentFamily.fromJson(Map<String, dynamic> json) =
      _$StudentFamilyImpl.fromJson;

  @override
  int get id;
  @override
  String? get imageFile;
  @override
  String? get nickname;

  /// Create a copy of StudentFamily
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentFamilyImplCopyWith<_$StudentFamilyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
