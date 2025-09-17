// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  int get id => throw _privateConstructorUsedError;
  String? get incompleteNotes => throw _privateConstructorUsedError;
  int get incompleteReasonId => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get isReview => throw _privateConstructorUsedError;
  String? get oneToOneOrGroup => throw _privateConstructorUsedError;
  int get originalTeacherId => throw _privateConstructorUsedError;
  String? get request => throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get requested => throw _privateConstructorUsedError;
  String? get requestedTime => throw _privateConstructorUsedError;
  int get reservedById => throw _privateConstructorUsedError;
  String? get reservedTime => throw _privateConstructorUsedError;
  int get resultId => throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get sentReminder => throw _privateConstructorUsedError;
  String? get sentReminderTime => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  int get statusId => throw _privateConstructorUsedError;
  String? get statusName => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get substituted => throw _privateConstructorUsedError;
  String? get substitutedTime => throw _privateConstructorUsedError;
  Teacher? get teacher => throw _privateConstructorUsedError;
  int get teacherId => throw _privateConstructorUsedError;
  TeacherReview? get teacherReview => throw _privateConstructorUsedError;
  String? get timeFrom => throw _privateConstructorUsedError;
  int get timeId => throw _privateConstructorUsedError;
  String? get timeTo => throw _privateConstructorUsedError;
  List<int> get requestCategoryIds => throw _privateConstructorUsedError;
  List<Curriculum> get teacherAvailableCuriculums =>
      throw _privateConstructorUsedError;
  String? get patrolClassroomUrl => throw _privateConstructorUsedError;
  String? get crmMomentUrl => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get canPreview => throw _privateConstructorUsedError;
  String? get reservedBy => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get canCancel => throw _privateConstructorUsedError;
  String? get paidBy => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get hasFtlReport => throw _privateConstructorUsedError;
  String get ftlReportUrl => throw _privateConstructorUsedError;
  LessonExerciseData? get exerciseData => throw _privateConstructorUsedError;
  List<XdyPlaypath> get xdyPlaypath => throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get canPlayback => throw _privateConstructorUsedError;
  List<TalkPlaypath> get talkPlaypath => throw _privateConstructorUsedError;
  List<LessonMoment> get moments => throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get cancelReasonId => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get canPostReview => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call(
      {int id,
      String? incompleteNotes,
      int incompleteReasonId,
      @CTBoolConverter() bool isReview,
      String? oneToOneOrGroup,
      int originalTeacherId,
      String? request,
      @CTBoolConverter() dynamic requested,
      String? requestedTime,
      int reservedById,
      String? reservedTime,
      int resultId,
      @CTBoolConverter() dynamic sentReminder,
      String? sentReminderTime,
      String? startDate,
      String? startTime,
      int statusId,
      String? statusName,
      int studentId,
      @CTBoolConverter() dynamic substituted,
      String? substitutedTime,
      Teacher? teacher,
      int teacherId,
      TeacherReview? teacherReview,
      String? timeFrom,
      int timeId,
      String? timeTo,
      List<int> requestCategoryIds,
      List<Curriculum> teacherAvailableCuriculums,
      String? patrolClassroomUrl,
      String? crmMomentUrl,
      @CTBoolConverter() bool canPreview,
      String? reservedBy,
      @CTBoolConverter() bool canCancel,
      String? paidBy,
      @CTBoolConverter() bool hasFtlReport,
      String ftlReportUrl,
      LessonExerciseData? exerciseData,
      List<XdyPlaypath> xdyPlaypath,
      @CTBoolConverter() dynamic canPlayback,
      List<TalkPlaypath> talkPlaypath,
      List<LessonMoment> moments,
      @CTBoolConverter() dynamic cancelReasonId,
      @CTBoolConverter() bool canPostReview,
      String? endTime});

  $TeacherCopyWith<$Res>? get teacher;
  $TeacherReviewCopyWith<$Res>? get teacherReview;
  $LessonExerciseDataCopyWith<$Res>? get exerciseData;
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incompleteNotes = freezed,
    Object? incompleteReasonId = null,
    Object? isReview = null,
    Object? oneToOneOrGroup = freezed,
    Object? originalTeacherId = null,
    Object? request = freezed,
    Object? requested = freezed,
    Object? requestedTime = freezed,
    Object? reservedById = null,
    Object? reservedTime = freezed,
    Object? resultId = null,
    Object? sentReminder = freezed,
    Object? sentReminderTime = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? statusId = null,
    Object? statusName = freezed,
    Object? studentId = null,
    Object? substituted = freezed,
    Object? substitutedTime = freezed,
    Object? teacher = freezed,
    Object? teacherId = null,
    Object? teacherReview = freezed,
    Object? timeFrom = freezed,
    Object? timeId = null,
    Object? timeTo = freezed,
    Object? requestCategoryIds = null,
    Object? teacherAvailableCuriculums = null,
    Object? patrolClassroomUrl = freezed,
    Object? crmMomentUrl = freezed,
    Object? canPreview = null,
    Object? reservedBy = freezed,
    Object? canCancel = null,
    Object? paidBy = freezed,
    Object? hasFtlReport = null,
    Object? ftlReportUrl = null,
    Object? exerciseData = freezed,
    Object? xdyPlaypath = null,
    Object? canPlayback = freezed,
    Object? talkPlaypath = null,
    Object? moments = null,
    Object? cancelReasonId = freezed,
    Object? canPostReview = null,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteNotes: freezed == incompleteNotes
          ? _value.incompleteNotes
          : incompleteNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      incompleteReasonId: null == incompleteReasonId
          ? _value.incompleteReasonId
          : incompleteReasonId // ignore: cast_nullable_to_non_nullable
              as int,
      isReview: null == isReview
          ? _value.isReview
          : isReview // ignore: cast_nullable_to_non_nullable
              as bool,
      oneToOneOrGroup: freezed == oneToOneOrGroup
          ? _value.oneToOneOrGroup
          : oneToOneOrGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTeacherId: null == originalTeacherId
          ? _value.originalTeacherId
          : originalTeacherId // ignore: cast_nullable_to_non_nullable
              as int,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
      requested: freezed == requested
          ? _value.requested
          : requested // ignore: cast_nullable_to_non_nullable
              as dynamic,
      requestedTime: freezed == requestedTime
          ? _value.requestedTime
          : requestedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservedById: null == reservedById
          ? _value.reservedById
          : reservedById // ignore: cast_nullable_to_non_nullable
              as int,
      reservedTime: freezed == reservedTime
          ? _value.reservedTime
          : reservedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      sentReminder: freezed == sentReminder
          ? _value.sentReminder
          : sentReminder // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sentReminderTime: freezed == sentReminderTime
          ? _value.sentReminderTime
          : sentReminderTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      substituted: freezed == substituted
          ? _value.substituted
          : substituted // ignore: cast_nullable_to_non_nullable
              as dynamic,
      substitutedTime: freezed == substitutedTime
          ? _value.substitutedTime
          : substitutedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherReview: freezed == teacherReview
          ? _value.teacherReview
          : teacherReview // ignore: cast_nullable_to_non_nullable
              as TeacherReview?,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeId: null == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestCategoryIds: null == requestCategoryIds
          ? _value.requestCategoryIds
          : requestCategoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      teacherAvailableCuriculums: null == teacherAvailableCuriculums
          ? _value.teacherAvailableCuriculums
          : teacherAvailableCuriculums // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
      patrolClassroomUrl: freezed == patrolClassroomUrl
          ? _value.patrolClassroomUrl
          : patrolClassroomUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      crmMomentUrl: freezed == crmMomentUrl
          ? _value.crmMomentUrl
          : crmMomentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canPreview: null == canPreview
          ? _value.canPreview
          : canPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      reservedBy: freezed == reservedBy
          ? _value.reservedBy
          : reservedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFtlReport: null == hasFtlReport
          ? _value.hasFtlReport
          : hasFtlReport // ignore: cast_nullable_to_non_nullable
              as bool,
      ftlReportUrl: null == ftlReportUrl
          ? _value.ftlReportUrl
          : ftlReportUrl // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseData: freezed == exerciseData
          ? _value.exerciseData
          : exerciseData // ignore: cast_nullable_to_non_nullable
              as LessonExerciseData?,
      xdyPlaypath: null == xdyPlaypath
          ? _value.xdyPlaypath
          : xdyPlaypath // ignore: cast_nullable_to_non_nullable
              as List<XdyPlaypath>,
      canPlayback: freezed == canPlayback
          ? _value.canPlayback
          : canPlayback // ignore: cast_nullable_to_non_nullable
              as dynamic,
      talkPlaypath: null == talkPlaypath
          ? _value.talkPlaypath
          : talkPlaypath // ignore: cast_nullable_to_non_nullable
              as List<TalkPlaypath>,
      moments: null == moments
          ? _value.moments
          : moments // ignore: cast_nullable_to_non_nullable
              as List<LessonMoment>,
      cancelReasonId: freezed == cancelReasonId
          ? _value.cancelReasonId
          : cancelReasonId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      canPostReview: null == canPostReview
          ? _value.canPostReview
          : canPostReview // ignore: cast_nullable_to_non_nullable
              as bool,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Lesson
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

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherReviewCopyWith<$Res>? get teacherReview {
    if (_value.teacherReview == null) {
      return null;
    }

    return $TeacherReviewCopyWith<$Res>(_value.teacherReview!, (value) {
      return _then(_value.copyWith(teacherReview: value) as $Val);
    });
  }

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LessonExerciseDataCopyWith<$Res>? get exerciseData {
    if (_value.exerciseData == null) {
      return null;
    }

    return $LessonExerciseDataCopyWith<$Res>(_value.exerciseData!, (value) {
      return _then(_value.copyWith(exerciseData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? incompleteNotes,
      int incompleteReasonId,
      @CTBoolConverter() bool isReview,
      String? oneToOneOrGroup,
      int originalTeacherId,
      String? request,
      @CTBoolConverter() dynamic requested,
      String? requestedTime,
      int reservedById,
      String? reservedTime,
      int resultId,
      @CTBoolConverter() dynamic sentReminder,
      String? sentReminderTime,
      String? startDate,
      String? startTime,
      int statusId,
      String? statusName,
      int studentId,
      @CTBoolConverter() dynamic substituted,
      String? substitutedTime,
      Teacher? teacher,
      int teacherId,
      TeacherReview? teacherReview,
      String? timeFrom,
      int timeId,
      String? timeTo,
      List<int> requestCategoryIds,
      List<Curriculum> teacherAvailableCuriculums,
      String? patrolClassroomUrl,
      String? crmMomentUrl,
      @CTBoolConverter() bool canPreview,
      String? reservedBy,
      @CTBoolConverter() bool canCancel,
      String? paidBy,
      @CTBoolConverter() bool hasFtlReport,
      String ftlReportUrl,
      LessonExerciseData? exerciseData,
      List<XdyPlaypath> xdyPlaypath,
      @CTBoolConverter() dynamic canPlayback,
      List<TalkPlaypath> talkPlaypath,
      List<LessonMoment> moments,
      @CTBoolConverter() dynamic cancelReasonId,
      @CTBoolConverter() bool canPostReview,
      String? endTime});

  @override
  $TeacherCopyWith<$Res>? get teacher;
  @override
  $TeacherReviewCopyWith<$Res>? get teacherReview;
  @override
  $LessonExerciseDataCopyWith<$Res>? get exerciseData;
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incompleteNotes = freezed,
    Object? incompleteReasonId = null,
    Object? isReview = null,
    Object? oneToOneOrGroup = freezed,
    Object? originalTeacherId = null,
    Object? request = freezed,
    Object? requested = freezed,
    Object? requestedTime = freezed,
    Object? reservedById = null,
    Object? reservedTime = freezed,
    Object? resultId = null,
    Object? sentReminder = freezed,
    Object? sentReminderTime = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? statusId = null,
    Object? statusName = freezed,
    Object? studentId = null,
    Object? substituted = freezed,
    Object? substitutedTime = freezed,
    Object? teacher = freezed,
    Object? teacherId = null,
    Object? teacherReview = freezed,
    Object? timeFrom = freezed,
    Object? timeId = null,
    Object? timeTo = freezed,
    Object? requestCategoryIds = null,
    Object? teacherAvailableCuriculums = null,
    Object? patrolClassroomUrl = freezed,
    Object? crmMomentUrl = freezed,
    Object? canPreview = null,
    Object? reservedBy = freezed,
    Object? canCancel = null,
    Object? paidBy = freezed,
    Object? hasFtlReport = null,
    Object? ftlReportUrl = null,
    Object? exerciseData = freezed,
    Object? xdyPlaypath = null,
    Object? canPlayback = freezed,
    Object? talkPlaypath = null,
    Object? moments = null,
    Object? cancelReasonId = freezed,
    Object? canPostReview = null,
    Object? endTime = freezed,
  }) {
    return _then(_$LessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteNotes: freezed == incompleteNotes
          ? _value.incompleteNotes
          : incompleteNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      incompleteReasonId: null == incompleteReasonId
          ? _value.incompleteReasonId
          : incompleteReasonId // ignore: cast_nullable_to_non_nullable
              as int,
      isReview: null == isReview
          ? _value.isReview
          : isReview // ignore: cast_nullable_to_non_nullable
              as bool,
      oneToOneOrGroup: freezed == oneToOneOrGroup
          ? _value.oneToOneOrGroup
          : oneToOneOrGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTeacherId: null == originalTeacherId
          ? _value.originalTeacherId
          : originalTeacherId // ignore: cast_nullable_to_non_nullable
              as int,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String?,
      requested: freezed == requested ? _value.requested! : requested,
      requestedTime: freezed == requestedTime
          ? _value.requestedTime
          : requestedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      reservedById: null == reservedById
          ? _value.reservedById
          : reservedById // ignore: cast_nullable_to_non_nullable
              as int,
      reservedTime: freezed == reservedTime
          ? _value.reservedTime
          : reservedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      sentReminder:
          freezed == sentReminder ? _value.sentReminder! : sentReminder,
      sentReminderTime: freezed == sentReminderTime
          ? _value.sentReminderTime
          : sentReminderTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      substituted: freezed == substituted ? _value.substituted! : substituted,
      substitutedTime: freezed == substitutedTime
          ? _value.substitutedTime
          : substitutedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher?,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherReview: freezed == teacherReview
          ? _value.teacherReview
          : teacherReview // ignore: cast_nullable_to_non_nullable
              as TeacherReview?,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeId: null == timeId
          ? _value.timeId
          : timeId // ignore: cast_nullable_to_non_nullable
              as int,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      requestCategoryIds: null == requestCategoryIds
          ? _value._requestCategoryIds
          : requestCategoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      teacherAvailableCuriculums: null == teacherAvailableCuriculums
          ? _value._teacherAvailableCuriculums
          : teacherAvailableCuriculums // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>,
      patrolClassroomUrl: freezed == patrolClassroomUrl
          ? _value.patrolClassroomUrl
          : patrolClassroomUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      crmMomentUrl: freezed == crmMomentUrl
          ? _value.crmMomentUrl
          : crmMomentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canPreview: null == canPreview
          ? _value.canPreview
          : canPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      reservedBy: freezed == reservedBy
          ? _value.reservedBy
          : reservedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFtlReport: null == hasFtlReport
          ? _value.hasFtlReport
          : hasFtlReport // ignore: cast_nullable_to_non_nullable
              as bool,
      ftlReportUrl: null == ftlReportUrl
          ? _value.ftlReportUrl
          : ftlReportUrl // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseData: freezed == exerciseData
          ? _value.exerciseData
          : exerciseData // ignore: cast_nullable_to_non_nullable
              as LessonExerciseData?,
      xdyPlaypath: null == xdyPlaypath
          ? _value._xdyPlaypath
          : xdyPlaypath // ignore: cast_nullable_to_non_nullable
              as List<XdyPlaypath>,
      canPlayback: freezed == canPlayback ? _value.canPlayback! : canPlayback,
      talkPlaypath: null == talkPlaypath
          ? _value._talkPlaypath
          : talkPlaypath // ignore: cast_nullable_to_non_nullable
              as List<TalkPlaypath>,
      moments: null == moments
          ? _value._moments
          : moments // ignore: cast_nullable_to_non_nullable
              as List<LessonMoment>,
      cancelReasonId:
          freezed == cancelReasonId ? _value.cancelReasonId! : cancelReasonId,
      canPostReview: null == canPostReview
          ? _value.canPostReview
          : canPostReview // ignore: cast_nullable_to_non_nullable
              as bool,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  const _$LessonImpl(
      {this.id = 0,
      this.incompleteNotes,
      this.incompleteReasonId = 0,
      @CTBoolConverter() this.isReview = false,
      this.oneToOneOrGroup,
      this.originalTeacherId = 0,
      this.request,
      @CTBoolConverter() this.requested = false,
      this.requestedTime,
      this.reservedById = 0,
      this.reservedTime,
      this.resultId = 0,
      @CTBoolConverter() this.sentReminder = false,
      this.sentReminderTime,
      this.startDate,
      this.startTime,
      this.statusId = 0,
      this.statusName,
      this.studentId = 0,
      @CTBoolConverter() this.substituted = false,
      this.substitutedTime,
      this.teacher,
      this.teacherId = 0,
      this.teacherReview,
      this.timeFrom,
      this.timeId = 0,
      this.timeTo,
      final List<int> requestCategoryIds = const [],
      final List<Curriculum> teacherAvailableCuriculums = const [],
      this.patrolClassroomUrl,
      this.crmMomentUrl,
      @CTBoolConverter() this.canPreview = false,
      this.reservedBy,
      @CTBoolConverter() this.canCancel = false,
      this.paidBy,
      @CTBoolConverter() this.hasFtlReport = false,
      this.ftlReportUrl = '',
      this.exerciseData,
      final List<XdyPlaypath> xdyPlaypath = const [],
      @CTBoolConverter() this.canPlayback = false,
      final List<TalkPlaypath> talkPlaypath = const [],
      final List<LessonMoment> moments = const [],
      @CTBoolConverter() this.cancelReasonId = false,
      @CTBoolConverter() this.canPostReview = false,
      this.endTime})
      : _requestCategoryIds = requestCategoryIds,
        _teacherAvailableCuriculums = teacherAvailableCuriculums,
        _xdyPlaypath = xdyPlaypath,
        _talkPlaypath = talkPlaypath,
        _moments = moments;

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String? incompleteNotes;
  @override
  @JsonKey()
  final int incompleteReasonId;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool isReview;
  @override
  final String? oneToOneOrGroup;
  @override
  @JsonKey()
  final int originalTeacherId;
  @override
  final String? request;
  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic requested;
  @override
  final String? requestedTime;
  @override
  @JsonKey()
  final int reservedById;
  @override
  final String? reservedTime;
  @override
  @JsonKey()
  final int resultId;
  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic sentReminder;
  @override
  final String? sentReminderTime;
  @override
  final String? startDate;
  @override
  final String? startTime;
  @override
  @JsonKey()
  final int statusId;
  @override
  final String? statusName;
  @override
  @JsonKey()
  final int studentId;
  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic substituted;
  @override
  final String? substitutedTime;
  @override
  final Teacher? teacher;
  @override
  @JsonKey()
  final int teacherId;
  @override
  final TeacherReview? teacherReview;
  @override
  final String? timeFrom;
  @override
  @JsonKey()
  final int timeId;
  @override
  final String? timeTo;
  final List<int> _requestCategoryIds;
  @override
  @JsonKey()
  List<int> get requestCategoryIds {
    if (_requestCategoryIds is EqualUnmodifiableListView)
      return _requestCategoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestCategoryIds);
  }

  final List<Curriculum> _teacherAvailableCuriculums;
  @override
  @JsonKey()
  List<Curriculum> get teacherAvailableCuriculums {
    if (_teacherAvailableCuriculums is EqualUnmodifiableListView)
      return _teacherAvailableCuriculums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teacherAvailableCuriculums);
  }

  @override
  final String? patrolClassroomUrl;
  @override
  final String? crmMomentUrl;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool canPreview;
  @override
  final String? reservedBy;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool canCancel;
  @override
  final String? paidBy;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool hasFtlReport;
  @override
  @JsonKey()
  final String ftlReportUrl;
  @override
  final LessonExerciseData? exerciseData;
  final List<XdyPlaypath> _xdyPlaypath;
  @override
  @JsonKey()
  List<XdyPlaypath> get xdyPlaypath {
    if (_xdyPlaypath is EqualUnmodifiableListView) return _xdyPlaypath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_xdyPlaypath);
  }

  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic canPlayback;
  final List<TalkPlaypath> _talkPlaypath;
  @override
  @JsonKey()
  List<TalkPlaypath> get talkPlaypath {
    if (_talkPlaypath is EqualUnmodifiableListView) return _talkPlaypath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_talkPlaypath);
  }

  final List<LessonMoment> _moments;
  @override
  @JsonKey()
  List<LessonMoment> get moments {
    if (_moments is EqualUnmodifiableListView) return _moments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moments);
  }

  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic cancelReasonId;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool canPostReview;
  @override
  final String? endTime;

  @override
  String toString() {
    return 'Lesson(id: $id, incompleteNotes: $incompleteNotes, incompleteReasonId: $incompleteReasonId, isReview: $isReview, oneToOneOrGroup: $oneToOneOrGroup, originalTeacherId: $originalTeacherId, request: $request, requested: $requested, requestedTime: $requestedTime, reservedById: $reservedById, reservedTime: $reservedTime, resultId: $resultId, sentReminder: $sentReminder, sentReminderTime: $sentReminderTime, startDate: $startDate, startTime: $startTime, statusId: $statusId, statusName: $statusName, studentId: $studentId, substituted: $substituted, substitutedTime: $substitutedTime, teacher: $teacher, teacherId: $teacherId, teacherReview: $teacherReview, timeFrom: $timeFrom, timeId: $timeId, timeTo: $timeTo, requestCategoryIds: $requestCategoryIds, teacherAvailableCuriculums: $teacherAvailableCuriculums, patrolClassroomUrl: $patrolClassroomUrl, crmMomentUrl: $crmMomentUrl, canPreview: $canPreview, reservedBy: $reservedBy, canCancel: $canCancel, paidBy: $paidBy, hasFtlReport: $hasFtlReport, ftlReportUrl: $ftlReportUrl, exerciseData: $exerciseData, xdyPlaypath: $xdyPlaypath, canPlayback: $canPlayback, talkPlaypath: $talkPlaypath, moments: $moments, cancelReasonId: $cancelReasonId, canPostReview: $canPostReview, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.incompleteNotes, incompleteNotes) ||
                other.incompleteNotes == incompleteNotes) &&
            (identical(other.incompleteReasonId, incompleteReasonId) ||
                other.incompleteReasonId == incompleteReasonId) &&
            (identical(other.isReview, isReview) ||
                other.isReview == isReview) &&
            (identical(other.oneToOneOrGroup, oneToOneOrGroup) ||
                other.oneToOneOrGroup == oneToOneOrGroup) &&
            (identical(other.originalTeacherId, originalTeacherId) ||
                other.originalTeacherId == originalTeacherId) &&
            (identical(other.request, request) || other.request == request) &&
            const DeepCollectionEquality().equals(other.requested, requested) &&
            (identical(other.requestedTime, requestedTime) ||
                other.requestedTime == requestedTime) &&
            (identical(other.reservedById, reservedById) ||
                other.reservedById == reservedById) &&
            (identical(other.reservedTime, reservedTime) ||
                other.reservedTime == reservedTime) &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId) &&
            const DeepCollectionEquality()
                .equals(other.sentReminder, sentReminder) &&
            (identical(other.sentReminderTime, sentReminderTime) ||
                other.sentReminderTime == sentReminderTime) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            const DeepCollectionEquality()
                .equals(other.substituted, substituted) &&
            (identical(other.substitutedTime, substitutedTime) ||
                other.substitutedTime == substitutedTime) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.teacherReview, teacherReview) ||
                other.teacherReview == teacherReview) &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeId, timeId) || other.timeId == timeId) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo) &&
            const DeepCollectionEquality()
                .equals(other._requestCategoryIds, _requestCategoryIds) &&
            const DeepCollectionEquality().equals(
                other._teacherAvailableCuriculums,
                _teacherAvailableCuriculums) &&
            (identical(other.patrolClassroomUrl, patrolClassroomUrl) ||
                other.patrolClassroomUrl == patrolClassroomUrl) &&
            (identical(other.crmMomentUrl, crmMomentUrl) ||
                other.crmMomentUrl == crmMomentUrl) &&
            (identical(other.canPreview, canPreview) ||
                other.canPreview == canPreview) &&
            (identical(other.reservedBy, reservedBy) ||
                other.reservedBy == reservedBy) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            (identical(other.paidBy, paidBy) || other.paidBy == paidBy) &&
            (identical(other.hasFtlReport, hasFtlReport) ||
                other.hasFtlReport == hasFtlReport) &&
            (identical(other.ftlReportUrl, ftlReportUrl) ||
                other.ftlReportUrl == ftlReportUrl) &&
            (identical(other.exerciseData, exerciseData) ||
                other.exerciseData == exerciseData) &&
            const DeepCollectionEquality()
                .equals(other._xdyPlaypath, _xdyPlaypath) &&
            const DeepCollectionEquality()
                .equals(other.canPlayback, canPlayback) &&
            const DeepCollectionEquality()
                .equals(other._talkPlaypath, _talkPlaypath) &&
            const DeepCollectionEquality().equals(other._moments, _moments) &&
            const DeepCollectionEquality()
                .equals(other.cancelReasonId, cancelReasonId) &&
            (identical(other.canPostReview, canPostReview) ||
                other.canPostReview == canPostReview) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        incompleteNotes,
        incompleteReasonId,
        isReview,
        oneToOneOrGroup,
        originalTeacherId,
        request,
        const DeepCollectionEquality().hash(requested),
        requestedTime,
        reservedById,
        reservedTime,
        resultId,
        const DeepCollectionEquality().hash(sentReminder),
        sentReminderTime,
        startDate,
        startTime,
        statusId,
        statusName,
        studentId,
        const DeepCollectionEquality().hash(substituted),
        substitutedTime,
        teacher,
        teacherId,
        teacherReview,
        timeFrom,
        timeId,
        timeTo,
        const DeepCollectionEquality().hash(_requestCategoryIds),
        const DeepCollectionEquality().hash(_teacherAvailableCuriculums),
        patrolClassroomUrl,
        crmMomentUrl,
        canPreview,
        reservedBy,
        canCancel,
        paidBy,
        hasFtlReport,
        ftlReportUrl,
        exerciseData,
        const DeepCollectionEquality().hash(_xdyPlaypath),
        const DeepCollectionEquality().hash(canPlayback),
        const DeepCollectionEquality().hash(_talkPlaypath),
        const DeepCollectionEquality().hash(_moments),
        const DeepCollectionEquality().hash(cancelReasonId),
        canPostReview,
        endTime
      ]);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson(
      {final int id,
      final String? incompleteNotes,
      final int incompleteReasonId,
      @CTBoolConverter() final bool isReview,
      final String? oneToOneOrGroup,
      final int originalTeacherId,
      final String? request,
      @CTBoolConverter() final dynamic requested,
      final String? requestedTime,
      final int reservedById,
      final String? reservedTime,
      final int resultId,
      @CTBoolConverter() final dynamic sentReminder,
      final String? sentReminderTime,
      final String? startDate,
      final String? startTime,
      final int statusId,
      final String? statusName,
      final int studentId,
      @CTBoolConverter() final dynamic substituted,
      final String? substitutedTime,
      final Teacher? teacher,
      final int teacherId,
      final TeacherReview? teacherReview,
      final String? timeFrom,
      final int timeId,
      final String? timeTo,
      final List<int> requestCategoryIds,
      final List<Curriculum> teacherAvailableCuriculums,
      final String? patrolClassroomUrl,
      final String? crmMomentUrl,
      @CTBoolConverter() final bool canPreview,
      final String? reservedBy,
      @CTBoolConverter() final bool canCancel,
      final String? paidBy,
      @CTBoolConverter() final bool hasFtlReport,
      final String ftlReportUrl,
      final LessonExerciseData? exerciseData,
      final List<XdyPlaypath> xdyPlaypath,
      @CTBoolConverter() final dynamic canPlayback,
      final List<TalkPlaypath> talkPlaypath,
      final List<LessonMoment> moments,
      @CTBoolConverter() final dynamic cancelReasonId,
      @CTBoolConverter() final bool canPostReview,
      final String? endTime}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  int get id;
  @override
  String? get incompleteNotes;
  @override
  int get incompleteReasonId;
  @override
  @CTBoolConverter()
  bool get isReview;
  @override
  String? get oneToOneOrGroup;
  @override
  int get originalTeacherId;
  @override
  String? get request;
  @override
  @CTBoolConverter()
  dynamic get requested;
  @override
  String? get requestedTime;
  @override
  int get reservedById;
  @override
  String? get reservedTime;
  @override
  int get resultId;
  @override
  @CTBoolConverter()
  dynamic get sentReminder;
  @override
  String? get sentReminderTime;
  @override
  String? get startDate;
  @override
  String? get startTime;
  @override
  int get statusId;
  @override
  String? get statusName;
  @override
  int get studentId;
  @override
  @CTBoolConverter()
  dynamic get substituted;
  @override
  String? get substitutedTime;
  @override
  Teacher? get teacher;
  @override
  int get teacherId;
  @override
  TeacherReview? get teacherReview;
  @override
  String? get timeFrom;
  @override
  int get timeId;
  @override
  String? get timeTo;
  @override
  List<int> get requestCategoryIds;
  @override
  List<Curriculum> get teacherAvailableCuriculums;
  @override
  String? get patrolClassroomUrl;
  @override
  String? get crmMomentUrl;
  @override
  @CTBoolConverter()
  bool get canPreview;
  @override
  String? get reservedBy;
  @override
  @CTBoolConverter()
  bool get canCancel;
  @override
  String? get paidBy;
  @override
  @CTBoolConverter()
  bool get hasFtlReport;
  @override
  String get ftlReportUrl;
  @override
  LessonExerciseData? get exerciseData;
  @override
  List<XdyPlaypath> get xdyPlaypath;
  @override
  @CTBoolConverter()
  dynamic get canPlayback;
  @override
  List<TalkPlaypath> get talkPlaypath;
  @override
  List<LessonMoment> get moments;
  @override
  @CTBoolConverter()
  dynamic get cancelReasonId;
  @override
  @CTBoolConverter()
  bool get canPostReview;
  @override
  String? get endTime;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonExerciseData _$LessonExerciseDataFromJson(Map<String, dynamic> json) {
  return _LessonExerciseData.fromJson(json);
}

/// @nodoc
mixin _$LessonExerciseData {
  @CTBoolConverter()
  bool get doneAllExercise => throw _privateConstructorUsedError;
  int get exercisePageCount => throw _privateConstructorUsedError;
  List<LessonExercisePage> get exercisePages =>
      throw _privateConstructorUsedError;

  /// Serializes this LessonExerciseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonExerciseDataCopyWith<LessonExerciseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonExerciseDataCopyWith<$Res> {
  factory $LessonExerciseDataCopyWith(
          LessonExerciseData value, $Res Function(LessonExerciseData) then) =
      _$LessonExerciseDataCopyWithImpl<$Res, LessonExerciseData>;
  @useResult
  $Res call(
      {@CTBoolConverter() bool doneAllExercise,
      int exercisePageCount,
      List<LessonExercisePage> exercisePages});
}

/// @nodoc
class _$LessonExerciseDataCopyWithImpl<$Res, $Val extends LessonExerciseData>
    implements $LessonExerciseDataCopyWith<$Res> {
  _$LessonExerciseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doneAllExercise = null,
    Object? exercisePageCount = null,
    Object? exercisePages = null,
  }) {
    return _then(_value.copyWith(
      doneAllExercise: null == doneAllExercise
          ? _value.doneAllExercise
          : doneAllExercise // ignore: cast_nullable_to_non_nullable
              as bool,
      exercisePageCount: null == exercisePageCount
          ? _value.exercisePageCount
          : exercisePageCount // ignore: cast_nullable_to_non_nullable
              as int,
      exercisePages: null == exercisePages
          ? _value.exercisePages
          : exercisePages // ignore: cast_nullable_to_non_nullable
              as List<LessonExercisePage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonExerciseDataImplCopyWith<$Res>
    implements $LessonExerciseDataCopyWith<$Res> {
  factory _$$LessonExerciseDataImplCopyWith(_$LessonExerciseDataImpl value,
          $Res Function(_$LessonExerciseDataImpl) then) =
      __$$LessonExerciseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@CTBoolConverter() bool doneAllExercise,
      int exercisePageCount,
      List<LessonExercisePage> exercisePages});
}

/// @nodoc
class __$$LessonExerciseDataImplCopyWithImpl<$Res>
    extends _$LessonExerciseDataCopyWithImpl<$Res, _$LessonExerciseDataImpl>
    implements _$$LessonExerciseDataImplCopyWith<$Res> {
  __$$LessonExerciseDataImplCopyWithImpl(_$LessonExerciseDataImpl _value,
      $Res Function(_$LessonExerciseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doneAllExercise = null,
    Object? exercisePageCount = null,
    Object? exercisePages = null,
  }) {
    return _then(_$LessonExerciseDataImpl(
      doneAllExercise: null == doneAllExercise
          ? _value.doneAllExercise
          : doneAllExercise // ignore: cast_nullable_to_non_nullable
              as bool,
      exercisePageCount: null == exercisePageCount
          ? _value.exercisePageCount
          : exercisePageCount // ignore: cast_nullable_to_non_nullable
              as int,
      exercisePages: null == exercisePages
          ? _value._exercisePages
          : exercisePages // ignore: cast_nullable_to_non_nullable
              as List<LessonExercisePage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonExerciseDataImpl implements _LessonExerciseData {
  const _$LessonExerciseDataImpl(
      {@CTBoolConverter() this.doneAllExercise = false,
      this.exercisePageCount = 0,
      final List<LessonExercisePage> exercisePages = const []})
      : _exercisePages = exercisePages;

  factory _$LessonExerciseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonExerciseDataImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool doneAllExercise;
  @override
  @JsonKey()
  final int exercisePageCount;
  final List<LessonExercisePage> _exercisePages;
  @override
  @JsonKey()
  List<LessonExercisePage> get exercisePages {
    if (_exercisePages is EqualUnmodifiableListView) return _exercisePages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercisePages);
  }

  @override
  String toString() {
    return 'LessonExerciseData(doneAllExercise: $doneAllExercise, exercisePageCount: $exercisePageCount, exercisePages: $exercisePages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonExerciseDataImpl &&
            (identical(other.doneAllExercise, doneAllExercise) ||
                other.doneAllExercise == doneAllExercise) &&
            (identical(other.exercisePageCount, exercisePageCount) ||
                other.exercisePageCount == exercisePageCount) &&
            const DeepCollectionEquality()
                .equals(other._exercisePages, _exercisePages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, doneAllExercise,
      exercisePageCount, const DeepCollectionEquality().hash(_exercisePages));

  /// Create a copy of LessonExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonExerciseDataImplCopyWith<_$LessonExerciseDataImpl> get copyWith =>
      __$$LessonExerciseDataImplCopyWithImpl<_$LessonExerciseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonExerciseDataImplToJson(
      this,
    );
  }
}

abstract class _LessonExerciseData implements LessonExerciseData {
  const factory _LessonExerciseData(
      {@CTBoolConverter() final bool doneAllExercise,
      final int exercisePageCount,
      final List<LessonExercisePage> exercisePages}) = _$LessonExerciseDataImpl;

  factory _LessonExerciseData.fromJson(Map<String, dynamic> json) =
      _$LessonExerciseDataImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get doneAllExercise;
  @override
  int get exercisePageCount;
  @override
  List<LessonExercisePage> get exercisePages;

  /// Create a copy of LessonExerciseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonExerciseDataImplCopyWith<_$LessonExerciseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonExercisePage _$LessonExercisePageFromJson(Map<String, dynamic> json) {
  return _LessonExercisePage.fromJson(json);
}

/// @nodoc
mixin _$LessonExercisePage {
  int get page => throw _privateConstructorUsedError;

  /// Serializes this LessonExercisePage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonExercisePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonExercisePageCopyWith<LessonExercisePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonExercisePageCopyWith<$Res> {
  factory $LessonExercisePageCopyWith(
          LessonExercisePage value, $Res Function(LessonExercisePage) then) =
      _$LessonExercisePageCopyWithImpl<$Res, LessonExercisePage>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$LessonExercisePageCopyWithImpl<$Res, $Val extends LessonExercisePage>
    implements $LessonExercisePageCopyWith<$Res> {
  _$LessonExercisePageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonExercisePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonExercisePageImplCopyWith<$Res>
    implements $LessonExercisePageCopyWith<$Res> {
  factory _$$LessonExercisePageImplCopyWith(_$LessonExercisePageImpl value,
          $Res Function(_$LessonExercisePageImpl) then) =
      __$$LessonExercisePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$LessonExercisePageImplCopyWithImpl<$Res>
    extends _$LessonExercisePageCopyWithImpl<$Res, _$LessonExercisePageImpl>
    implements _$$LessonExercisePageImplCopyWith<$Res> {
  __$$LessonExercisePageImplCopyWithImpl(_$LessonExercisePageImpl _value,
      $Res Function(_$LessonExercisePageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonExercisePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$LessonExercisePageImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonExercisePageImpl implements _LessonExercisePage {
  const _$LessonExercisePageImpl({this.page = 0});

  factory _$LessonExercisePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonExercisePageImplFromJson(json);

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'LessonExercisePage(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonExercisePageImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of LessonExercisePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonExercisePageImplCopyWith<_$LessonExercisePageImpl> get copyWith =>
      __$$LessonExercisePageImplCopyWithImpl<_$LessonExercisePageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonExercisePageImplToJson(
      this,
    );
  }
}

abstract class _LessonExercisePage implements LessonExercisePage {
  const factory _LessonExercisePage({final int page}) =
      _$LessonExercisePageImpl;

  factory _LessonExercisePage.fromJson(Map<String, dynamic> json) =
      _$LessonExercisePageImpl.fromJson;

  @override
  int get page;

  /// Create a copy of LessonExercisePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonExercisePageImplCopyWith<_$LessonExercisePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonMoment _$LessonMomentFromJson(Map<String, dynamic> json) {
  return _LessonMoment.fromJson(json);
}

/// @nodoc
mixin _$LessonMoment {
  String? get imageFile => throw _privateConstructorUsedError;

  /// Serializes this LessonMoment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonMoment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonMomentCopyWith<LessonMoment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonMomentCopyWith<$Res> {
  factory $LessonMomentCopyWith(
          LessonMoment value, $Res Function(LessonMoment) then) =
      _$LessonMomentCopyWithImpl<$Res, LessonMoment>;
  @useResult
  $Res call({String? imageFile});
}

/// @nodoc
class _$LessonMomentCopyWithImpl<$Res, $Val extends LessonMoment>
    implements $LessonMomentCopyWith<$Res> {
  _$LessonMomentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonMoment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonMomentImplCopyWith<$Res>
    implements $LessonMomentCopyWith<$Res> {
  factory _$$LessonMomentImplCopyWith(
          _$LessonMomentImpl value, $Res Function(_$LessonMomentImpl) then) =
      __$$LessonMomentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageFile});
}

/// @nodoc
class __$$LessonMomentImplCopyWithImpl<$Res>
    extends _$LessonMomentCopyWithImpl<$Res, _$LessonMomentImpl>
    implements _$$LessonMomentImplCopyWith<$Res> {
  __$$LessonMomentImplCopyWithImpl(
      _$LessonMomentImpl _value, $Res Function(_$LessonMomentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonMoment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_$LessonMomentImpl(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonMomentImpl implements _LessonMoment {
  const _$LessonMomentImpl({this.imageFile});

  factory _$LessonMomentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonMomentImplFromJson(json);

  @override
  final String? imageFile;

  @override
  String toString() {
    return 'LessonMoment(imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonMomentImpl &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageFile);

  /// Create a copy of LessonMoment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonMomentImplCopyWith<_$LessonMomentImpl> get copyWith =>
      __$$LessonMomentImplCopyWithImpl<_$LessonMomentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonMomentImplToJson(
      this,
    );
  }
}

abstract class _LessonMoment implements LessonMoment {
  const factory _LessonMoment({final String? imageFile}) = _$LessonMomentImpl;

  factory _LessonMoment.fromJson(Map<String, dynamic> json) =
      _$LessonMomentImpl.fromJson;

  @override
  String? get imageFile;

  /// Create a copy of LessonMoment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonMomentImplCopyWith<_$LessonMomentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
