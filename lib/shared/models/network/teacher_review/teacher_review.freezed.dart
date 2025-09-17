// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherReview _$TeacherReviewFromJson(Map<String, dynamic> json) {
  return _TeacherReview.fromJson(json);
}

/// @nodoc
mixin _$TeacherReview {
  String? get comment => throw _privateConstructorUsedError;
  String? get createdTime => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get lessonId => throw _privateConstructorUsedError;
  int get likesTotal => throw _privateConstructorUsedError;
  String? get publicFlag => throw _privateConstructorUsedError;
  int get ratingId => throw _privateConstructorUsedError;
  String? get rejectedFlag => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  TeacherReviewStudent? get student => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  int get teacherId => throw _privateConstructorUsedError;
  String get tagIds => throw _privateConstructorUsedError;

  /// Serializes this TeacherReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherReviewCopyWith<TeacherReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherReviewCopyWith<$Res> {
  factory $TeacherReviewCopyWith(
          TeacherReview value, $Res Function(TeacherReview) then) =
      _$TeacherReviewCopyWithImpl<$Res, TeacherReview>;
  @useResult
  $Res call(
      {String? comment,
      String? createdTime,
      int id,
      int lessonId,
      int likesTotal,
      String? publicFlag,
      int ratingId,
      String? rejectedFlag,
      String remark,
      TeacherReviewStudent? student,
      int studentId,
      int teacherId,
      String tagIds});

  $TeacherReviewStudentCopyWith<$Res>? get student;
}

/// @nodoc
class _$TeacherReviewCopyWithImpl<$Res, $Val extends TeacherReview>
    implements $TeacherReviewCopyWith<$Res> {
  _$TeacherReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? createdTime = freezed,
    Object? id = null,
    Object? lessonId = null,
    Object? likesTotal = null,
    Object? publicFlag = freezed,
    Object? ratingId = null,
    Object? rejectedFlag = freezed,
    Object? remark = null,
    Object? student = freezed,
    Object? studentId = null,
    Object? teacherId = null,
    Object? tagIds = null,
  }) {
    return _then(_value.copyWith(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
      likesTotal: null == likesTotal
          ? _value.likesTotal
          : likesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      publicFlag: freezed == publicFlag
          ? _value.publicFlag
          : publicFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingId: null == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int,
      rejectedFlag: freezed == rejectedFlag
          ? _value.rejectedFlag
          : rejectedFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as TeacherReviewStudent?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherReviewStudentCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $TeacherReviewStudentCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherReviewImplCopyWith<$Res>
    implements $TeacherReviewCopyWith<$Res> {
  factory _$$TeacherReviewImplCopyWith(
          _$TeacherReviewImpl value, $Res Function(_$TeacherReviewImpl) then) =
      __$$TeacherReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? comment,
      String? createdTime,
      int id,
      int lessonId,
      int likesTotal,
      String? publicFlag,
      int ratingId,
      String? rejectedFlag,
      String remark,
      TeacherReviewStudent? student,
      int studentId,
      int teacherId,
      String tagIds});

  @override
  $TeacherReviewStudentCopyWith<$Res>? get student;
}

/// @nodoc
class __$$TeacherReviewImplCopyWithImpl<$Res>
    extends _$TeacherReviewCopyWithImpl<$Res, _$TeacherReviewImpl>
    implements _$$TeacherReviewImplCopyWith<$Res> {
  __$$TeacherReviewImplCopyWithImpl(
      _$TeacherReviewImpl _value, $Res Function(_$TeacherReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? createdTime = freezed,
    Object? id = null,
    Object? lessonId = null,
    Object? likesTotal = null,
    Object? publicFlag = freezed,
    Object? ratingId = null,
    Object? rejectedFlag = freezed,
    Object? remark = null,
    Object? student = freezed,
    Object? studentId = null,
    Object? teacherId = null,
    Object? tagIds = null,
  }) {
    return _then(_$TeacherReviewImpl(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
      likesTotal: null == likesTotal
          ? _value.likesTotal
          : likesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      publicFlag: freezed == publicFlag
          ? _value.publicFlag
          : publicFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingId: null == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int,
      rejectedFlag: freezed == rejectedFlag
          ? _value.rejectedFlag
          : rejectedFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as TeacherReviewStudent?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherReviewImpl implements _TeacherReview {
  const _$TeacherReviewImpl(
      {this.comment,
      this.createdTime,
      this.id = 0,
      this.lessonId = 0,
      this.likesTotal = 0,
      this.publicFlag,
      this.ratingId = 0,
      this.rejectedFlag,
      this.remark = '',
      this.student,
      this.studentId = 0,
      this.teacherId = 0,
      this.tagIds = ''});

  factory _$TeacherReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherReviewImplFromJson(json);

  @override
  final String? comment;
  @override
  final String? createdTime;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int lessonId;
  @override
  @JsonKey()
  final int likesTotal;
  @override
  final String? publicFlag;
  @override
  @JsonKey()
  final int ratingId;
  @override
  final String? rejectedFlag;
  @override
  @JsonKey()
  final String remark;
  @override
  final TeacherReviewStudent? student;
  @override
  @JsonKey()
  final int studentId;
  @override
  @JsonKey()
  final int teacherId;
  @override
  @JsonKey()
  final String tagIds;

  @override
  String toString() {
    return 'TeacherReview(comment: $comment, createdTime: $createdTime, id: $id, lessonId: $lessonId, likesTotal: $likesTotal, publicFlag: $publicFlag, ratingId: $ratingId, rejectedFlag: $rejectedFlag, remark: $remark, student: $student, studentId: $studentId, teacherId: $teacherId, tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherReviewImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.likesTotal, likesTotal) ||
                other.likesTotal == likesTotal) &&
            (identical(other.publicFlag, publicFlag) ||
                other.publicFlag == publicFlag) &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId) &&
            (identical(other.rejectedFlag, rejectedFlag) ||
                other.rejectedFlag == rejectedFlag) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.tagIds, tagIds) || other.tagIds == tagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      comment,
      createdTime,
      id,
      lessonId,
      likesTotal,
      publicFlag,
      ratingId,
      rejectedFlag,
      remark,
      student,
      studentId,
      teacherId,
      tagIds);

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherReviewImplCopyWith<_$TeacherReviewImpl> get copyWith =>
      __$$TeacherReviewImplCopyWithImpl<_$TeacherReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherReviewImplToJson(
      this,
    );
  }
}

abstract class _TeacherReview implements TeacherReview {
  const factory _TeacherReview(
      {final String? comment,
      final String? createdTime,
      final int id,
      final int lessonId,
      final int likesTotal,
      final String? publicFlag,
      final int ratingId,
      final String? rejectedFlag,
      final String remark,
      final TeacherReviewStudent? student,
      final int studentId,
      final int teacherId,
      final String tagIds}) = _$TeacherReviewImpl;

  factory _TeacherReview.fromJson(Map<String, dynamic> json) =
      _$TeacherReviewImpl.fromJson;

  @override
  String? get comment;
  @override
  String? get createdTime;
  @override
  int get id;
  @override
  int get lessonId;
  @override
  int get likesTotal;
  @override
  String? get publicFlag;
  @override
  int get ratingId;
  @override
  String? get rejectedFlag;
  @override
  String get remark;
  @override
  TeacherReviewStudent? get student;
  @override
  int get studentId;
  @override
  int get teacherId;
  @override
  String get tagIds;

  /// Create a copy of TeacherReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherReviewImplCopyWith<_$TeacherReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherReviewStudent _$TeacherReviewStudentFromJson(Map<String, dynamic> json) {
  return _TeacherReviewStudent.fromJson(json);
}

/// @nodoc
mixin _$TeacherReviewStudent {
  String? get countryOrDefault => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  /// Serializes this TeacherReviewStudent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherReviewStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherReviewStudentCopyWith<TeacherReviewStudent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherReviewStudentCopyWith<$Res> {
  factory $TeacherReviewStudentCopyWith(TeacherReviewStudent value,
          $Res Function(TeacherReviewStudent) then) =
      _$TeacherReviewStudentCopyWithImpl<$Res, TeacherReviewStudent>;
  @useResult
  $Res call({String? countryOrDefault, String? imageFile, String? nickname});
}

/// @nodoc
class _$TeacherReviewStudentCopyWithImpl<$Res,
        $Val extends TeacherReviewStudent>
    implements $TeacherReviewStudentCopyWith<$Res> {
  _$TeacherReviewStudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherReviewStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryOrDefault = freezed,
    Object? imageFile = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_value.copyWith(
      countryOrDefault: freezed == countryOrDefault
          ? _value.countryOrDefault
          : countryOrDefault // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TeacherReviewStudentImplCopyWith<$Res>
    implements $TeacherReviewStudentCopyWith<$Res> {
  factory _$$TeacherReviewStudentImplCopyWith(_$TeacherReviewStudentImpl value,
          $Res Function(_$TeacherReviewStudentImpl) then) =
      __$$TeacherReviewStudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? countryOrDefault, String? imageFile, String? nickname});
}

/// @nodoc
class __$$TeacherReviewStudentImplCopyWithImpl<$Res>
    extends _$TeacherReviewStudentCopyWithImpl<$Res, _$TeacherReviewStudentImpl>
    implements _$$TeacherReviewStudentImplCopyWith<$Res> {
  __$$TeacherReviewStudentImplCopyWithImpl(_$TeacherReviewStudentImpl _value,
      $Res Function(_$TeacherReviewStudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherReviewStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryOrDefault = freezed,
    Object? imageFile = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_$TeacherReviewStudentImpl(
      countryOrDefault: freezed == countryOrDefault
          ? _value.countryOrDefault
          : countryOrDefault // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TeacherReviewStudentImpl implements _TeacherReviewStudent {
  const _$TeacherReviewStudentImpl(
      {this.countryOrDefault, this.imageFile, this.nickname});

  factory _$TeacherReviewStudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherReviewStudentImplFromJson(json);

  @override
  final String? countryOrDefault;
  @override
  final String? imageFile;
  @override
  final String? nickname;

  @override
  String toString() {
    return 'TeacherReviewStudent(countryOrDefault: $countryOrDefault, imageFile: $imageFile, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherReviewStudentImpl &&
            (identical(other.countryOrDefault, countryOrDefault) ||
                other.countryOrDefault == countryOrDefault) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, countryOrDefault, imageFile, nickname);

  /// Create a copy of TeacherReviewStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherReviewStudentImplCopyWith<_$TeacherReviewStudentImpl>
      get copyWith =>
          __$$TeacherReviewStudentImplCopyWithImpl<_$TeacherReviewStudentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherReviewStudentImplToJson(
      this,
    );
  }
}

abstract class _TeacherReviewStudent implements TeacherReviewStudent {
  const factory _TeacherReviewStudent(
      {final String? countryOrDefault,
      final String? imageFile,
      final String? nickname}) = _$TeacherReviewStudentImpl;

  factory _TeacherReviewStudent.fromJson(Map<String, dynamic> json) =
      _$TeacherReviewStudentImpl.fromJson;

  @override
  String? get countryOrDefault;
  @override
  String? get imageFile;
  @override
  String? get nickname;

  /// Create a copy of TeacherReviewStudent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherReviewStudentImplCopyWith<_$TeacherReviewStudentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
