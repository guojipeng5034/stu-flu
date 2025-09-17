// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonOrder _$LessonOrderFromJson(Map<String, dynamic> json) {
  return _LessonOrder.fromJson(json);
}

/// @nodoc
mixin _$LessonOrder {
  @CTBoolConverter()
  bool get allowSubstituteFlag => throw _privateConstructorUsedError;
  String? get createdTime => throw _privateConstructorUsedError;
  String? get curriculumCode => throw _privateConstructorUsedError;
  int get curriculumId => throw _privateConstructorUsedError;
  String? get curriculumName => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get deletedFlag => throw _privateConstructorUsedError;
  int get endMin => throw _privateConstructorUsedError;
  int get extraPoints => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get lessonTimeId => throw _privateConstructorUsedError;
  String? get modifiedTime => throw _privateConstructorUsedError;
  int get orderedById => throw _privateConstructorUsedError;
  String? get orderedTime => throw _privateConstructorUsedError;
  int get paidById => throw _privateConstructorUsedError;
  String? get remark => throw _privateConstructorUsedError;
  String? get reservationStartTime => throw _privateConstructorUsedError;
  String? get reservationStopTime => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  int get startMin => throw _privateConstructorUsedError;
  String? get stopReasonId => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get stoppedFlag => throw _privateConstructorUsedError;
  String? get stoppedTime => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  Teacher? get teacher => throw _privateConstructorUsedError;
  int get teacherId => throw _privateConstructorUsedError;
  String? get timeFrom => throw _privateConstructorUsedError;
  String? get timeTo => throw _privateConstructorUsedError;
  List<LessonOrderExtraPoints> get extraPointsJson =>
      throw _privateConstructorUsedError;
  List<LessonOrderStopInfo> get lessonsForOrderStop =>
      throw _privateConstructorUsedError;
  String? get curriculumPoints => throw _privateConstructorUsedError;

  /// Serializes this LessonOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonOrderCopyWith<LessonOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonOrderCopyWith<$Res> {
  factory $LessonOrderCopyWith(
          LessonOrder value, $Res Function(LessonOrder) then) =
      _$LessonOrderCopyWithImpl<$Res, LessonOrder>;
  @useResult
  $Res call(
      {@CTBoolConverter() bool allowSubstituteFlag,
      String? createdTime,
      String? curriculumCode,
      int curriculumId,
      String? curriculumName,
      int dayOfWeek,
      @CTBoolConverter() bool deletedFlag,
      int endMin,
      int extraPoints,
      int id,
      int lessonTimeId,
      String? modifiedTime,
      int orderedById,
      String? orderedTime,
      int paidById,
      String? remark,
      String? reservationStartTime,
      String? reservationStopTime,
      int siteId,
      int startMin,
      String? stopReasonId,
      @CTBoolConverter() bool stoppedFlag,
      String? stoppedTime,
      int studentId,
      Teacher? teacher,
      int teacherId,
      String? timeFrom,
      String? timeTo,
      List<LessonOrderExtraPoints> extraPointsJson,
      List<LessonOrderStopInfo> lessonsForOrderStop,
      String? curriculumPoints});

  $TeacherCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$LessonOrderCopyWithImpl<$Res, $Val extends LessonOrder>
    implements $LessonOrderCopyWith<$Res> {
  _$LessonOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowSubstituteFlag = null,
    Object? createdTime = freezed,
    Object? curriculumCode = freezed,
    Object? curriculumId = null,
    Object? curriculumName = freezed,
    Object? dayOfWeek = null,
    Object? deletedFlag = null,
    Object? endMin = null,
    Object? extraPoints = null,
    Object? id = null,
    Object? lessonTimeId = null,
    Object? modifiedTime = freezed,
    Object? orderedById = null,
    Object? orderedTime = freezed,
    Object? paidById = null,
    Object? remark = freezed,
    Object? reservationStartTime = freezed,
    Object? reservationStopTime = freezed,
    Object? siteId = null,
    Object? startMin = null,
    Object? stopReasonId = freezed,
    Object? stoppedFlag = null,
    Object? stoppedTime = freezed,
    Object? studentId = null,
    Object? teacher = freezed,
    Object? teacherId = null,
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
    Object? extraPointsJson = null,
    Object? lessonsForOrderStop = null,
    Object? curriculumPoints = freezed,
  }) {
    return _then(_value.copyWith(
      allowSubstituteFlag: null == allowSubstituteFlag
          ? _value.allowSubstituteFlag
          : allowSubstituteFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumCode: freezed == curriculumCode
          ? _value.curriculumCode
          : curriculumCode // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumId: null == curriculumId
          ? _value.curriculumId
          : curriculumId // ignore: cast_nullable_to_non_nullable
              as int,
      curriculumName: freezed == curriculumName
          ? _value.curriculumName
          : curriculumName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      deletedFlag: null == deletedFlag
          ? _value.deletedFlag
          : deletedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      endMin: null == endMin
          ? _value.endMin
          : endMin // ignore: cast_nullable_to_non_nullable
              as int,
      extraPoints: null == extraPoints
          ? _value.extraPoints
          : extraPoints // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessonTimeId: null == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTime: freezed == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedById: null == orderedById
          ? _value.orderedById
          : orderedById // ignore: cast_nullable_to_non_nullable
              as int,
      orderedTime: freezed == orderedTime
          ? _value.orderedTime
          : orderedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      paidById: null == paidById
          ? _value.paidById
          : paidById // ignore: cast_nullable_to_non_nullable
              as int,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationStartTime: freezed == reservationStartTime
          ? _value.reservationStartTime
          : reservationStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationStopTime: freezed == reservationStopTime
          ? _value.reservationStopTime
          : reservationStopTime // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      startMin: null == startMin
          ? _value.startMin
          : startMin // ignore: cast_nullable_to_non_nullable
              as int,
      stopReasonId: freezed == stopReasonId
          ? _value.stopReasonId
          : stopReasonId // ignore: cast_nullable_to_non_nullable
              as String?,
      stoppedFlag: null == stoppedFlag
          ? _value.stoppedFlag
          : stoppedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      stoppedTime: freezed == stoppedTime
          ? _value.stoppedTime
          : stoppedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      extraPointsJson: null == extraPointsJson
          ? _value.extraPointsJson
          : extraPointsJson // ignore: cast_nullable_to_non_nullable
              as List<LessonOrderExtraPoints>,
      lessonsForOrderStop: null == lessonsForOrderStop
          ? _value.lessonsForOrderStop
          : lessonsForOrderStop // ignore: cast_nullable_to_non_nullable
              as List<LessonOrderStopInfo>,
      curriculumPoints: freezed == curriculumPoints
          ? _value.curriculumPoints
          : curriculumPoints // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherCopyWith<$Res>? get teacher {
    if (_value.teacher == null) {
      return null;
    }

    return $TeacherCopyWith<$Res>(_value.teacher!, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonOrderImplCopyWith<$Res>
    implements $LessonOrderCopyWith<$Res> {
  factory _$$LessonOrderImplCopyWith(
          _$LessonOrderImpl value, $Res Function(_$LessonOrderImpl) then) =
      __$$LessonOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@CTBoolConverter() bool allowSubstituteFlag,
      String? createdTime,
      String? curriculumCode,
      int curriculumId,
      String? curriculumName,
      int dayOfWeek,
      @CTBoolConverter() bool deletedFlag,
      int endMin,
      int extraPoints,
      int id,
      int lessonTimeId,
      String? modifiedTime,
      int orderedById,
      String? orderedTime,
      int paidById,
      String? remark,
      String? reservationStartTime,
      String? reservationStopTime,
      int siteId,
      int startMin,
      String? stopReasonId,
      @CTBoolConverter() bool stoppedFlag,
      String? stoppedTime,
      int studentId,
      Teacher? teacher,
      int teacherId,
      String? timeFrom,
      String? timeTo,
      List<LessonOrderExtraPoints> extraPointsJson,
      List<LessonOrderStopInfo> lessonsForOrderStop,
      String? curriculumPoints});

  @override
  $TeacherCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$LessonOrderImplCopyWithImpl<$Res>
    extends _$LessonOrderCopyWithImpl<$Res, _$LessonOrderImpl>
    implements _$$LessonOrderImplCopyWith<$Res> {
  __$$LessonOrderImplCopyWithImpl(
      _$LessonOrderImpl _value, $Res Function(_$LessonOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowSubstituteFlag = null,
    Object? createdTime = freezed,
    Object? curriculumCode = freezed,
    Object? curriculumId = null,
    Object? curriculumName = freezed,
    Object? dayOfWeek = null,
    Object? deletedFlag = null,
    Object? endMin = null,
    Object? extraPoints = null,
    Object? id = null,
    Object? lessonTimeId = null,
    Object? modifiedTime = freezed,
    Object? orderedById = null,
    Object? orderedTime = freezed,
    Object? paidById = null,
    Object? remark = freezed,
    Object? reservationStartTime = freezed,
    Object? reservationStopTime = freezed,
    Object? siteId = null,
    Object? startMin = null,
    Object? stopReasonId = freezed,
    Object? stoppedFlag = null,
    Object? stoppedTime = freezed,
    Object? studentId = null,
    Object? teacher = freezed,
    Object? teacherId = null,
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
    Object? extraPointsJson = null,
    Object? lessonsForOrderStop = null,
    Object? curriculumPoints = freezed,
  }) {
    return _then(_$LessonOrderImpl(
      allowSubstituteFlag: null == allowSubstituteFlag
          ? _value.allowSubstituteFlag
          : allowSubstituteFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumCode: freezed == curriculumCode
          ? _value.curriculumCode
          : curriculumCode // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumId: null == curriculumId
          ? _value.curriculumId
          : curriculumId // ignore: cast_nullable_to_non_nullable
              as int,
      curriculumName: freezed == curriculumName
          ? _value.curriculumName
          : curriculumName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      deletedFlag: null == deletedFlag
          ? _value.deletedFlag
          : deletedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      endMin: null == endMin
          ? _value.endMin
          : endMin // ignore: cast_nullable_to_non_nullable
              as int,
      extraPoints: null == extraPoints
          ? _value.extraPoints
          : extraPoints // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessonTimeId: null == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as int,
      modifiedTime: freezed == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedById: null == orderedById
          ? _value.orderedById
          : orderedById // ignore: cast_nullable_to_non_nullable
              as int,
      orderedTime: freezed == orderedTime
          ? _value.orderedTime
          : orderedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      paidById: null == paidById
          ? _value.paidById
          : paidById // ignore: cast_nullable_to_non_nullable
              as int,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationStartTime: freezed == reservationStartTime
          ? _value.reservationStartTime
          : reservationStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationStopTime: freezed == reservationStopTime
          ? _value.reservationStopTime
          : reservationStopTime // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      startMin: null == startMin
          ? _value.startMin
          : startMin // ignore: cast_nullable_to_non_nullable
              as int,
      stopReasonId: freezed == stopReasonId
          ? _value.stopReasonId
          : stopReasonId // ignore: cast_nullable_to_non_nullable
              as String?,
      stoppedFlag: null == stoppedFlag
          ? _value.stoppedFlag
          : stoppedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      stoppedTime: freezed == stoppedTime
          ? _value.stoppedTime
          : stoppedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      extraPointsJson: null == extraPointsJson
          ? _value._extraPointsJson
          : extraPointsJson // ignore: cast_nullable_to_non_nullable
              as List<LessonOrderExtraPoints>,
      lessonsForOrderStop: null == lessonsForOrderStop
          ? _value._lessonsForOrderStop
          : lessonsForOrderStop // ignore: cast_nullable_to_non_nullable
              as List<LessonOrderStopInfo>,
      curriculumPoints: freezed == curriculumPoints
          ? _value.curriculumPoints
          : curriculumPoints // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonOrderImpl implements _LessonOrder {
  const _$LessonOrderImpl(
      {@CTBoolConverter() this.allowSubstituteFlag = false,
      this.createdTime,
      this.curriculumCode,
      this.curriculumId = 0,
      this.curriculumName,
      this.dayOfWeek = 0,
      @CTBoolConverter() this.deletedFlag = false,
      this.endMin = 0,
      this.extraPoints = 0,
      this.id = 0,
      this.lessonTimeId = 0,
      this.modifiedTime,
      this.orderedById = 0,
      this.orderedTime,
      this.paidById = 0,
      this.remark,
      this.reservationStartTime,
      this.reservationStopTime,
      this.siteId = 0,
      this.startMin = 0,
      this.stopReasonId,
      @CTBoolConverter() this.stoppedFlag = false,
      this.stoppedTime,
      this.studentId = 0,
      this.teacher,
      this.teacherId = 0,
      this.timeFrom,
      this.timeTo,
      final List<LessonOrderExtraPoints> extraPointsJson = const [],
      final List<LessonOrderStopInfo> lessonsForOrderStop = const [],
      this.curriculumPoints})
      : _extraPointsJson = extraPointsJson,
        _lessonsForOrderStop = lessonsForOrderStop;

  factory _$LessonOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonOrderImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool allowSubstituteFlag;
  @override
  final String? createdTime;
  @override
  final String? curriculumCode;
  @override
  @JsonKey()
  final int curriculumId;
  @override
  final String? curriculumName;
  @override
  @JsonKey()
  final int dayOfWeek;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool deletedFlag;
  @override
  @JsonKey()
  final int endMin;
  @override
  @JsonKey()
  final int extraPoints;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int lessonTimeId;
  @override
  final String? modifiedTime;
  @override
  @JsonKey()
  final int orderedById;
  @override
  final String? orderedTime;
  @override
  @JsonKey()
  final int paidById;
  @override
  final String? remark;
  @override
  final String? reservationStartTime;
  @override
  final String? reservationStopTime;
  @override
  @JsonKey()
  final int siteId;
  @override
  @JsonKey()
  final int startMin;
  @override
  final String? stopReasonId;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool stoppedFlag;
  @override
  final String? stoppedTime;
  @override
  @JsonKey()
  final int studentId;
  @override
  final Teacher? teacher;
  @override
  @JsonKey()
  final int teacherId;
  @override
  final String? timeFrom;
  @override
  final String? timeTo;
  final List<LessonOrderExtraPoints> _extraPointsJson;
  @override
  @JsonKey()
  List<LessonOrderExtraPoints> get extraPointsJson {
    if (_extraPointsJson is EqualUnmodifiableListView) return _extraPointsJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extraPointsJson);
  }

  final List<LessonOrderStopInfo> _lessonsForOrderStop;
  @override
  @JsonKey()
  List<LessonOrderStopInfo> get lessonsForOrderStop {
    if (_lessonsForOrderStop is EqualUnmodifiableListView)
      return _lessonsForOrderStop;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessonsForOrderStop);
  }

  @override
  final String? curriculumPoints;

  @override
  String toString() {
    return 'LessonOrder(allowSubstituteFlag: $allowSubstituteFlag, createdTime: $createdTime, curriculumCode: $curriculumCode, curriculumId: $curriculumId, curriculumName: $curriculumName, dayOfWeek: $dayOfWeek, deletedFlag: $deletedFlag, endMin: $endMin, extraPoints: $extraPoints, id: $id, lessonTimeId: $lessonTimeId, modifiedTime: $modifiedTime, orderedById: $orderedById, orderedTime: $orderedTime, paidById: $paidById, remark: $remark, reservationStartTime: $reservationStartTime, reservationStopTime: $reservationStopTime, siteId: $siteId, startMin: $startMin, stopReasonId: $stopReasonId, stoppedFlag: $stoppedFlag, stoppedTime: $stoppedTime, studentId: $studentId, teacher: $teacher, teacherId: $teacherId, timeFrom: $timeFrom, timeTo: $timeTo, extraPointsJson: $extraPointsJson, lessonsForOrderStop: $lessonsForOrderStop, curriculumPoints: $curriculumPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonOrderImpl &&
            (identical(other.allowSubstituteFlag, allowSubstituteFlag) ||
                other.allowSubstituteFlag == allowSubstituteFlag) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.curriculumCode, curriculumCode) ||
                other.curriculumCode == curriculumCode) &&
            (identical(other.curriculumId, curriculumId) ||
                other.curriculumId == curriculumId) &&
            (identical(other.curriculumName, curriculumName) ||
                other.curriculumName == curriculumName) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.deletedFlag, deletedFlag) ||
                other.deletedFlag == deletedFlag) &&
            (identical(other.endMin, endMin) || other.endMin == endMin) &&
            (identical(other.extraPoints, extraPoints) ||
                other.extraPoints == extraPoints) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lessonTimeId, lessonTimeId) ||
                other.lessonTimeId == lessonTimeId) &&
            (identical(other.modifiedTime, modifiedTime) ||
                other.modifiedTime == modifiedTime) &&
            (identical(other.orderedById, orderedById) ||
                other.orderedById == orderedById) &&
            (identical(other.orderedTime, orderedTime) ||
                other.orderedTime == orderedTime) &&
            (identical(other.paidById, paidById) ||
                other.paidById == paidById) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.reservationStartTime, reservationStartTime) ||
                other.reservationStartTime == reservationStartTime) &&
            (identical(other.reservationStopTime, reservationStopTime) ||
                other.reservationStopTime == reservationStopTime) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.startMin, startMin) ||
                other.startMin == startMin) &&
            (identical(other.stopReasonId, stopReasonId) ||
                other.stopReasonId == stopReasonId) &&
            (identical(other.stoppedFlag, stoppedFlag) ||
                other.stoppedFlag == stoppedFlag) &&
            (identical(other.stoppedTime, stoppedTime) ||
                other.stoppedTime == stoppedTime) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo) &&
            const DeepCollectionEquality()
                .equals(other._extraPointsJson, _extraPointsJson) &&
            const DeepCollectionEquality()
                .equals(other._lessonsForOrderStop, _lessonsForOrderStop) &&
            (identical(other.curriculumPoints, curriculumPoints) ||
                other.curriculumPoints == curriculumPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        allowSubstituteFlag,
        createdTime,
        curriculumCode,
        curriculumId,
        curriculumName,
        dayOfWeek,
        deletedFlag,
        endMin,
        extraPoints,
        id,
        lessonTimeId,
        modifiedTime,
        orderedById,
        orderedTime,
        paidById,
        remark,
        reservationStartTime,
        reservationStopTime,
        siteId,
        startMin,
        stopReasonId,
        stoppedFlag,
        stoppedTime,
        studentId,
        teacher,
        teacherId,
        timeFrom,
        timeTo,
        const DeepCollectionEquality().hash(_extraPointsJson),
        const DeepCollectionEquality().hash(_lessonsForOrderStop),
        curriculumPoints
      ]);

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonOrderImplCopyWith<_$LessonOrderImpl> get copyWith =>
      __$$LessonOrderImplCopyWithImpl<_$LessonOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonOrderImplToJson(
      this,
    );
  }
}

abstract class _LessonOrder implements LessonOrder {
  const factory _LessonOrder(
      {@CTBoolConverter() final bool allowSubstituteFlag,
      final String? createdTime,
      final String? curriculumCode,
      final int curriculumId,
      final String? curriculumName,
      final int dayOfWeek,
      @CTBoolConverter() final bool deletedFlag,
      final int endMin,
      final int extraPoints,
      final int id,
      final int lessonTimeId,
      final String? modifiedTime,
      final int orderedById,
      final String? orderedTime,
      final int paidById,
      final String? remark,
      final String? reservationStartTime,
      final String? reservationStopTime,
      final int siteId,
      final int startMin,
      final String? stopReasonId,
      @CTBoolConverter() final bool stoppedFlag,
      final String? stoppedTime,
      final int studentId,
      final Teacher? teacher,
      final int teacherId,
      final String? timeFrom,
      final String? timeTo,
      final List<LessonOrderExtraPoints> extraPointsJson,
      final List<LessonOrderStopInfo> lessonsForOrderStop,
      final String? curriculumPoints}) = _$LessonOrderImpl;

  factory _LessonOrder.fromJson(Map<String, dynamic> json) =
      _$LessonOrderImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get allowSubstituteFlag;
  @override
  String? get createdTime;
  @override
  String? get curriculumCode;
  @override
  int get curriculumId;
  @override
  String? get curriculumName;
  @override
  int get dayOfWeek;
  @override
  @CTBoolConverter()
  bool get deletedFlag;
  @override
  int get endMin;
  @override
  int get extraPoints;
  @override
  int get id;
  @override
  int get lessonTimeId;
  @override
  String? get modifiedTime;
  @override
  int get orderedById;
  @override
  String? get orderedTime;
  @override
  int get paidById;
  @override
  String? get remark;
  @override
  String? get reservationStartTime;
  @override
  String? get reservationStopTime;
  @override
  int get siteId;
  @override
  int get startMin;
  @override
  String? get stopReasonId;
  @override
  @CTBoolConverter()
  bool get stoppedFlag;
  @override
  String? get stoppedTime;
  @override
  int get studentId;
  @override
  Teacher? get teacher;
  @override
  int get teacherId;
  @override
  String? get timeFrom;
  @override
  String? get timeTo;
  @override
  List<LessonOrderExtraPoints> get extraPointsJson;
  @override
  List<LessonOrderStopInfo> get lessonsForOrderStop;
  @override
  String? get curriculumPoints;

  /// Create a copy of LessonOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonOrderImplCopyWith<_$LessonOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonOrderExtraPoints _$LessonOrderExtraPointsFromJson(
    Map<String, dynamic> json) {
  return _LessonOrderExtraPoints.fromJson(json);
}

/// @nodoc
mixin _$LessonOrderExtraPoints {
  int get extraPoints => throw _privateConstructorUsedError;
  int get lessonId => throw _privateConstructorUsedError;

  /// Serializes this LessonOrderExtraPoints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonOrderExtraPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonOrderExtraPointsCopyWith<LessonOrderExtraPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonOrderExtraPointsCopyWith<$Res> {
  factory $LessonOrderExtraPointsCopyWith(LessonOrderExtraPoints value,
          $Res Function(LessonOrderExtraPoints) then) =
      _$LessonOrderExtraPointsCopyWithImpl<$Res, LessonOrderExtraPoints>;
  @useResult
  $Res call({int extraPoints, int lessonId});
}

/// @nodoc
class _$LessonOrderExtraPointsCopyWithImpl<$Res,
        $Val extends LessonOrderExtraPoints>
    implements $LessonOrderExtraPointsCopyWith<$Res> {
  _$LessonOrderExtraPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonOrderExtraPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPoints = null,
    Object? lessonId = null,
  }) {
    return _then(_value.copyWith(
      extraPoints: null == extraPoints
          ? _value.extraPoints
          : extraPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonOrderExtraPointsImplCopyWith<$Res>
    implements $LessonOrderExtraPointsCopyWith<$Res> {
  factory _$$LessonOrderExtraPointsImplCopyWith(
          _$LessonOrderExtraPointsImpl value,
          $Res Function(_$LessonOrderExtraPointsImpl) then) =
      __$$LessonOrderExtraPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int extraPoints, int lessonId});
}

/// @nodoc
class __$$LessonOrderExtraPointsImplCopyWithImpl<$Res>
    extends _$LessonOrderExtraPointsCopyWithImpl<$Res,
        _$LessonOrderExtraPointsImpl>
    implements _$$LessonOrderExtraPointsImplCopyWith<$Res> {
  __$$LessonOrderExtraPointsImplCopyWithImpl(
      _$LessonOrderExtraPointsImpl _value,
      $Res Function(_$LessonOrderExtraPointsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonOrderExtraPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPoints = null,
    Object? lessonId = null,
  }) {
    return _then(_$LessonOrderExtraPointsImpl(
      extraPoints: null == extraPoints
          ? _value.extraPoints
          : extraPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonOrderExtraPointsImpl implements _LessonOrderExtraPoints {
  const _$LessonOrderExtraPointsImpl({this.extraPoints = 0, this.lessonId = 0});

  factory _$LessonOrderExtraPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonOrderExtraPointsImplFromJson(json);

  @override
  @JsonKey()
  final int extraPoints;
  @override
  @JsonKey()
  final int lessonId;

  @override
  String toString() {
    return 'LessonOrderExtraPoints(extraPoints: $extraPoints, lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonOrderExtraPointsImpl &&
            (identical(other.extraPoints, extraPoints) ||
                other.extraPoints == extraPoints) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extraPoints, lessonId);

  /// Create a copy of LessonOrderExtraPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonOrderExtraPointsImplCopyWith<_$LessonOrderExtraPointsImpl>
      get copyWith => __$$LessonOrderExtraPointsImplCopyWithImpl<
          _$LessonOrderExtraPointsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonOrderExtraPointsImplToJson(
      this,
    );
  }
}

abstract class _LessonOrderExtraPoints implements LessonOrderExtraPoints {
  const factory _LessonOrderExtraPoints(
      {final int extraPoints,
      final int lessonId}) = _$LessonOrderExtraPointsImpl;

  factory _LessonOrderExtraPoints.fromJson(Map<String, dynamic> json) =
      _$LessonOrderExtraPointsImpl.fromJson;

  @override
  int get extraPoints;
  @override
  int get lessonId;

  /// Create a copy of LessonOrderExtraPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonOrderExtraPointsImplCopyWith<_$LessonOrderExtraPointsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LessonOrderStopInfo _$LessonOrderStopInfoFromJson(Map<String, dynamic> json) {
  return _LessonOrderStopInfo.fromJson(json);
}

/// @nodoc
mixin _$LessonOrderStopInfo {
  String? get date => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;

  /// Serializes this LessonOrderStopInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonOrderStopInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonOrderStopInfoCopyWith<LessonOrderStopInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonOrderStopInfoCopyWith<$Res> {
  factory $LessonOrderStopInfoCopyWith(
          LessonOrderStopInfo value, $Res Function(LessonOrderStopInfo) then) =
      _$LessonOrderStopInfoCopyWithImpl<$Res, LessonOrderStopInfo>;
  @useResult
  $Res call({String? date, int dayOfWeek, int id, int points});
}

/// @nodoc
class _$LessonOrderStopInfoCopyWithImpl<$Res, $Val extends LessonOrderStopInfo>
    implements $LessonOrderStopInfoCopyWith<$Res> {
  _$LessonOrderStopInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonOrderStopInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dayOfWeek = null,
    Object? id = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonOrderStopInfoImplCopyWith<$Res>
    implements $LessonOrderStopInfoCopyWith<$Res> {
  factory _$$LessonOrderStopInfoImplCopyWith(_$LessonOrderStopInfoImpl value,
          $Res Function(_$LessonOrderStopInfoImpl) then) =
      __$$LessonOrderStopInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, int dayOfWeek, int id, int points});
}

/// @nodoc
class __$$LessonOrderStopInfoImplCopyWithImpl<$Res>
    extends _$LessonOrderStopInfoCopyWithImpl<$Res, _$LessonOrderStopInfoImpl>
    implements _$$LessonOrderStopInfoImplCopyWith<$Res> {
  __$$LessonOrderStopInfoImplCopyWithImpl(_$LessonOrderStopInfoImpl _value,
      $Res Function(_$LessonOrderStopInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonOrderStopInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dayOfWeek = null,
    Object? id = null,
    Object? points = null,
  }) {
    return _then(_$LessonOrderStopInfoImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonOrderStopInfoImpl implements _LessonOrderStopInfo {
  const _$LessonOrderStopInfoImpl(
      {this.date, this.dayOfWeek = 0, this.id = 0, this.points = 0});

  factory _$LessonOrderStopInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonOrderStopInfoImplFromJson(json);

  @override
  final String? date;
  @override
  @JsonKey()
  final int dayOfWeek;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int points;

  @override
  String toString() {
    return 'LessonOrderStopInfo(date: $date, dayOfWeek: $dayOfWeek, id: $id, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonOrderStopInfoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, dayOfWeek, id, points);

  /// Create a copy of LessonOrderStopInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonOrderStopInfoImplCopyWith<_$LessonOrderStopInfoImpl> get copyWith =>
      __$$LessonOrderStopInfoImplCopyWithImpl<_$LessonOrderStopInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonOrderStopInfoImplToJson(
      this,
    );
  }
}

abstract class _LessonOrderStopInfo implements LessonOrderStopInfo {
  const factory _LessonOrderStopInfo(
      {final String? date,
      final int dayOfWeek,
      final int id,
      final int points}) = _$LessonOrderStopInfoImpl;

  factory _LessonOrderStopInfo.fromJson(Map<String, dynamic> json) =
      _$LessonOrderStopInfoImpl.fromJson;

  @override
  String? get date;
  @override
  int get dayOfWeek;
  @override
  int get id;
  @override
  int get points;

  /// Create a copy of LessonOrderStopInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonOrderStopInfoImplCopyWith<_$LessonOrderStopInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
