// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return _Teacher.fromJson(json);
}

/// @nodoc
mixin _$Teacher {
  int get bookmarked => throw _privateConstructorUsedError;
  @CTStringConverter()
  String get bookmarkedLimitted => throw _privateConstructorUsedError;
  int get collections => throw _privateConstructorUsedError;
  String? get reviewsTotal => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get isCanFixed => throw _privateConstructorUsedError;
  String get teacherUid => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get aboutMe => throw _privateConstructorUsedError;
  String get imageFile => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  List<String> get availableCurriculumCodes =>
      throw _privateConstructorUsedError;
  @CTBoolConverter()
  dynamic get fixedOk => throw _privateConstructorUsedError;
  List<TeacherStation> get teacherStations =>
      throw _privateConstructorUsedError;
  TeacherDetail? get detail => throw _privateConstructorUsedError;
  List<TeacherBlock> get blocks => throw _privateConstructorUsedError;

  /// Serializes this Teacher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherCopyWith<Teacher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherCopyWith<$Res> {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) then) =
      _$TeacherCopyWithImpl<$Res, Teacher>;
  @useResult
  $Res call(
      {int bookmarked,
      @CTStringConverter() String bookmarkedLimitted,
      int collections,
      String? reviewsTotal,
      @CTBoolConverter() bool isCanFixed,
      String teacherUid,
      String? gender,
      int id,
      String aboutMe,
      String imageFile,
      String? name,
      int points,
      String rating,
      List<String> availableCurriculumCodes,
      @CTBoolConverter() dynamic fixedOk,
      List<TeacherStation> teacherStations,
      TeacherDetail? detail,
      List<TeacherBlock> blocks});

  $TeacherDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$TeacherCopyWithImpl<$Res, $Val extends Teacher>
    implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarked = null,
    Object? bookmarkedLimitted = null,
    Object? collections = null,
    Object? reviewsTotal = freezed,
    Object? isCanFixed = null,
    Object? teacherUid = null,
    Object? gender = freezed,
    Object? id = null,
    Object? aboutMe = null,
    Object? imageFile = null,
    Object? name = freezed,
    Object? points = null,
    Object? rating = null,
    Object? availableCurriculumCodes = null,
    Object? fixedOk = freezed,
    Object? teacherStations = null,
    Object? detail = freezed,
    Object? blocks = null,
  }) {
    return _then(_value.copyWith(
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedLimitted: null == bookmarkedLimitted
          ? _value.bookmarkedLimitted
          : bookmarkedLimitted // ignore: cast_nullable_to_non_nullable
              as String,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsTotal: freezed == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isCanFixed: null == isCanFixed
          ? _value.isCanFixed
          : isCanFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      teacherUid: null == teacherUid
          ? _value.teacherUid
          : teacherUid // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      availableCurriculumCodes: null == availableCurriculumCodes
          ? _value.availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fixedOk: freezed == fixedOk
          ? _value.fixedOk
          : fixedOk // ignore: cast_nullable_to_non_nullable
              as dynamic,
      teacherStations: null == teacherStations
          ? _value.teacherStations
          : teacherStations // ignore: cast_nullable_to_non_nullable
              as List<TeacherStation>,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TeacherDetail?,
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<TeacherBlock>,
    ) as $Val);
  }

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherDetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $TeacherDetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherImplCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$$TeacherImplCopyWith(
          _$TeacherImpl value, $Res Function(_$TeacherImpl) then) =
      __$$TeacherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookmarked,
      @CTStringConverter() String bookmarkedLimitted,
      int collections,
      String? reviewsTotal,
      @CTBoolConverter() bool isCanFixed,
      String teacherUid,
      String? gender,
      int id,
      String aboutMe,
      String imageFile,
      String? name,
      int points,
      String rating,
      List<String> availableCurriculumCodes,
      @CTBoolConverter() dynamic fixedOk,
      List<TeacherStation> teacherStations,
      TeacherDetail? detail,
      List<TeacherBlock> blocks});

  @override
  $TeacherDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$TeacherImplCopyWithImpl<$Res>
    extends _$TeacherCopyWithImpl<$Res, _$TeacherImpl>
    implements _$$TeacherImplCopyWith<$Res> {
  __$$TeacherImplCopyWithImpl(
      _$TeacherImpl _value, $Res Function(_$TeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarked = null,
    Object? bookmarkedLimitted = null,
    Object? collections = null,
    Object? reviewsTotal = freezed,
    Object? isCanFixed = null,
    Object? teacherUid = null,
    Object? gender = freezed,
    Object? id = null,
    Object? aboutMe = null,
    Object? imageFile = null,
    Object? name = freezed,
    Object? points = null,
    Object? rating = null,
    Object? availableCurriculumCodes = null,
    Object? fixedOk = freezed,
    Object? teacherStations = null,
    Object? detail = freezed,
    Object? blocks = null,
  }) {
    return _then(_$TeacherImpl(
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedLimitted: null == bookmarkedLimitted
          ? _value.bookmarkedLimitted
          : bookmarkedLimitted // ignore: cast_nullable_to_non_nullable
              as String,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsTotal: freezed == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isCanFixed: null == isCanFixed
          ? _value.isCanFixed
          : isCanFixed // ignore: cast_nullable_to_non_nullable
              as bool,
      teacherUid: null == teacherUid
          ? _value.teacherUid
          : teacherUid // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: null == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      availableCurriculumCodes: null == availableCurriculumCodes
          ? _value._availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fixedOk: freezed == fixedOk ? _value.fixedOk! : fixedOk,
      teacherStations: null == teacherStations
          ? _value._teacherStations
          : teacherStations // ignore: cast_nullable_to_non_nullable
              as List<TeacherStation>,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TeacherDetail?,
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<TeacherBlock>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherImpl implements _Teacher {
  const _$TeacherImpl(
      {this.bookmarked = 0,
      @CTStringConverter() this.bookmarkedLimitted = '',
      this.collections = 0,
      this.reviewsTotal,
      @CTBoolConverter() this.isCanFixed = false,
      this.teacherUid = '',
      this.gender,
      this.id = 0,
      this.aboutMe = '',
      this.imageFile = '',
      this.name,
      this.points = 0,
      this.rating = "5.0",
      final List<String> availableCurriculumCodes = const [],
      @CTBoolConverter() this.fixedOk = false,
      final List<TeacherStation> teacherStations = const [],
      this.detail,
      final List<TeacherBlock> blocks = const []})
      : _availableCurriculumCodes = availableCurriculumCodes,
        _teacherStations = teacherStations,
        _blocks = blocks;

  factory _$TeacherImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherImplFromJson(json);

  @override
  @JsonKey()
  final int bookmarked;
  @override
  @JsonKey()
  @CTStringConverter()
  final String bookmarkedLimitted;
  @override
  @JsonKey()
  final int collections;
  @override
  final String? reviewsTotal;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool isCanFixed;
  @override
  @JsonKey()
  final String teacherUid;
  @override
  final String? gender;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String aboutMe;
  @override
  @JsonKey()
  final String imageFile;
  @override
  final String? name;
  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final String rating;
  final List<String> _availableCurriculumCodes;
  @override
  @JsonKey()
  List<String> get availableCurriculumCodes {
    if (_availableCurriculumCodes is EqualUnmodifiableListView)
      return _availableCurriculumCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCurriculumCodes);
  }

  @override
  @JsonKey()
  @CTBoolConverter()
  final dynamic fixedOk;
  final List<TeacherStation> _teacherStations;
  @override
  @JsonKey()
  List<TeacherStation> get teacherStations {
    if (_teacherStations is EqualUnmodifiableListView) return _teacherStations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teacherStations);
  }

  @override
  final TeacherDetail? detail;
  final List<TeacherBlock> _blocks;
  @override
  @JsonKey()
  List<TeacherBlock> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'Teacher(bookmarked: $bookmarked, bookmarkedLimitted: $bookmarkedLimitted, collections: $collections, reviewsTotal: $reviewsTotal, isCanFixed: $isCanFixed, teacherUid: $teacherUid, gender: $gender, id: $id, aboutMe: $aboutMe, imageFile: $imageFile, name: $name, points: $points, rating: $rating, availableCurriculumCodes: $availableCurriculumCodes, fixedOk: $fixedOk, teacherStations: $teacherStations, detail: $detail, blocks: $blocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherImpl &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.bookmarkedLimitted, bookmarkedLimitted) ||
                other.bookmarkedLimitted == bookmarkedLimitted) &&
            (identical(other.collections, collections) ||
                other.collections == collections) &&
            (identical(other.reviewsTotal, reviewsTotal) ||
                other.reviewsTotal == reviewsTotal) &&
            (identical(other.isCanFixed, isCanFixed) ||
                other.isCanFixed == isCanFixed) &&
            (identical(other.teacherUid, teacherUid) ||
                other.teacherUid == teacherUid) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(
                other._availableCurriculumCodes, _availableCurriculumCodes) &&
            const DeepCollectionEquality().equals(other.fixedOk, fixedOk) &&
            const DeepCollectionEquality()
                .equals(other._teacherStations, _teacherStations) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._blocks, _blocks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookmarked,
      bookmarkedLimitted,
      collections,
      reviewsTotal,
      isCanFixed,
      teacherUid,
      gender,
      id,
      aboutMe,
      imageFile,
      name,
      points,
      rating,
      const DeepCollectionEquality().hash(_availableCurriculumCodes),
      const DeepCollectionEquality().hash(fixedOk),
      const DeepCollectionEquality().hash(_teacherStations),
      detail,
      const DeepCollectionEquality().hash(_blocks));

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      __$$TeacherImplCopyWithImpl<_$TeacherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherImplToJson(
      this,
    );
  }
}

abstract class _Teacher implements Teacher {
  const factory _Teacher(
      {final int bookmarked,
      @CTStringConverter() final String bookmarkedLimitted,
      final int collections,
      final String? reviewsTotal,
      @CTBoolConverter() final bool isCanFixed,
      final String teacherUid,
      final String? gender,
      final int id,
      final String aboutMe,
      final String imageFile,
      final String? name,
      final int points,
      final String rating,
      final List<String> availableCurriculumCodes,
      @CTBoolConverter() final dynamic fixedOk,
      final List<TeacherStation> teacherStations,
      final TeacherDetail? detail,
      final List<TeacherBlock> blocks}) = _$TeacherImpl;

  factory _Teacher.fromJson(Map<String, dynamic> json) = _$TeacherImpl.fromJson;

  @override
  int get bookmarked;
  @override
  @CTStringConverter()
  String get bookmarkedLimitted;
  @override
  int get collections;
  @override
  String? get reviewsTotal;
  @override
  @CTBoolConverter()
  bool get isCanFixed;
  @override
  String get teacherUid;
  @override
  String? get gender;
  @override
  int get id;
  @override
  String get aboutMe;
  @override
  String get imageFile;
  @override
  String? get name;
  @override
  int get points;
  @override
  String get rating;
  @override
  List<String> get availableCurriculumCodes;
  @override
  @CTBoolConverter()
  dynamic get fixedOk;
  @override
  List<TeacherStation> get teacherStations;
  @override
  TeacherDetail? get detail;
  @override
  List<TeacherBlock> get blocks;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherImplCopyWith<_$TeacherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherDetail _$TeacherDetailFromJson(Map<String, dynamic> json) {
  return _TeacherDetail.fromJson(json);
}

/// @nodoc
mixin _$TeacherDetail {
  String get aboutMe => throw _privateConstructorUsedError;
  int get bookmarkedX => throw _privateConstructorUsedError;
  @CTStringConverter()
  String get bookmarkedLimitted => throw _privateConstructorUsedError;
  String get career => throw _privateConstructorUsedError;
  String get certificationFile => throw _privateConstructorUsedError;
  String get certificationType => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;
  String get movieUrl => throw _privateConstructorUsedError;
  String get schoolGraduated => throw _privateConstructorUsedError;
  String get teacherReference => throw _privateConstructorUsedError;
  List<String>? get availableCurriculumCodes =>
      throw _privateConstructorUsedError;
  List<TeacherReviewGroup>? get reviewsTotalOfGroup =>
      throw _privateConstructorUsedError;
  String get reviewsTotal => throw _privateConstructorUsedError;

  /// Serializes this TeacherDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherDetailCopyWith<TeacherDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDetailCopyWith<$Res> {
  factory $TeacherDetailCopyWith(
          TeacherDetail value, $Res Function(TeacherDetail) then) =
      _$TeacherDetailCopyWithImpl<$Res, TeacherDetail>;
  @useResult
  $Res call(
      {String aboutMe,
      int bookmarkedX,
      @CTStringConverter() String bookmarkedLimitted,
      String career,
      String certificationFile,
      String certificationType,
      String country,
      String degree,
      String movieUrl,
      String schoolGraduated,
      String teacherReference,
      List<String>? availableCurriculumCodes,
      List<TeacherReviewGroup>? reviewsTotalOfGroup,
      String reviewsTotal});
}

/// @nodoc
class _$TeacherDetailCopyWithImpl<$Res, $Val extends TeacherDetail>
    implements $TeacherDetailCopyWith<$Res> {
  _$TeacherDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutMe = null,
    Object? bookmarkedX = null,
    Object? bookmarkedLimitted = null,
    Object? career = null,
    Object? certificationFile = null,
    Object? certificationType = null,
    Object? country = null,
    Object? degree = null,
    Object? movieUrl = null,
    Object? schoolGraduated = null,
    Object? teacherReference = null,
    Object? availableCurriculumCodes = freezed,
    Object? reviewsTotalOfGroup = freezed,
    Object? reviewsTotal = null,
  }) {
    return _then(_value.copyWith(
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedX: null == bookmarkedX
          ? _value.bookmarkedX
          : bookmarkedX // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedLimitted: null == bookmarkedLimitted
          ? _value.bookmarkedLimitted
          : bookmarkedLimitted // ignore: cast_nullable_to_non_nullable
              as String,
      career: null == career
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String,
      certificationFile: null == certificationFile
          ? _value.certificationFile
          : certificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      certificationType: null == certificationType
          ? _value.certificationType
          : certificationType // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _value.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
      schoolGraduated: null == schoolGraduated
          ? _value.schoolGraduated
          : schoolGraduated // ignore: cast_nullable_to_non_nullable
              as String,
      teacherReference: null == teacherReference
          ? _value.teacherReference
          : teacherReference // ignore: cast_nullable_to_non_nullable
              as String,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value.availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewsTotalOfGroup: freezed == reviewsTotalOfGroup
          ? _value.reviewsTotalOfGroup
          : reviewsTotalOfGroup // ignore: cast_nullable_to_non_nullable
              as List<TeacherReviewGroup>?,
      reviewsTotal: null == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherDetailImplCopyWith<$Res>
    implements $TeacherDetailCopyWith<$Res> {
  factory _$$TeacherDetailImplCopyWith(
          _$TeacherDetailImpl value, $Res Function(_$TeacherDetailImpl) then) =
      __$$TeacherDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String aboutMe,
      int bookmarkedX,
      @CTStringConverter() String bookmarkedLimitted,
      String career,
      String certificationFile,
      String certificationType,
      String country,
      String degree,
      String movieUrl,
      String schoolGraduated,
      String teacherReference,
      List<String>? availableCurriculumCodes,
      List<TeacherReviewGroup>? reviewsTotalOfGroup,
      String reviewsTotal});
}

/// @nodoc
class __$$TeacherDetailImplCopyWithImpl<$Res>
    extends _$TeacherDetailCopyWithImpl<$Res, _$TeacherDetailImpl>
    implements _$$TeacherDetailImplCopyWith<$Res> {
  __$$TeacherDetailImplCopyWithImpl(
      _$TeacherDetailImpl _value, $Res Function(_$TeacherDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutMe = null,
    Object? bookmarkedX = null,
    Object? bookmarkedLimitted = null,
    Object? career = null,
    Object? certificationFile = null,
    Object? certificationType = null,
    Object? country = null,
    Object? degree = null,
    Object? movieUrl = null,
    Object? schoolGraduated = null,
    Object? teacherReference = null,
    Object? availableCurriculumCodes = freezed,
    Object? reviewsTotalOfGroup = freezed,
    Object? reviewsTotal = null,
  }) {
    return _then(_$TeacherDetailImpl(
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedX: null == bookmarkedX
          ? _value.bookmarkedX
          : bookmarkedX // ignore: cast_nullable_to_non_nullable
              as int,
      bookmarkedLimitted: null == bookmarkedLimitted
          ? _value.bookmarkedLimitted
          : bookmarkedLimitted // ignore: cast_nullable_to_non_nullable
              as String,
      career: null == career
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String,
      certificationFile: null == certificationFile
          ? _value.certificationFile
          : certificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      certificationType: null == certificationType
          ? _value.certificationType
          : certificationType // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _value.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
      schoolGraduated: null == schoolGraduated
          ? _value.schoolGraduated
          : schoolGraduated // ignore: cast_nullable_to_non_nullable
              as String,
      teacherReference: null == teacherReference
          ? _value.teacherReference
          : teacherReference // ignore: cast_nullable_to_non_nullable
              as String,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value._availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewsTotalOfGroup: freezed == reviewsTotalOfGroup
          ? _value._reviewsTotalOfGroup
          : reviewsTotalOfGroup // ignore: cast_nullable_to_non_nullable
              as List<TeacherReviewGroup>?,
      reviewsTotal: null == reviewsTotal
          ? _value.reviewsTotal
          : reviewsTotal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherDetailImpl implements _TeacherDetail {
  const _$TeacherDetailImpl(
      {this.aboutMe = '',
      this.bookmarkedX = 0,
      @CTStringConverter() this.bookmarkedLimitted = '',
      this.career = '',
      this.certificationFile = '',
      this.certificationType = '',
      this.country = '',
      this.degree = '',
      this.movieUrl = '',
      this.schoolGraduated = '',
      this.teacherReference = '',
      final List<String>? availableCurriculumCodes,
      final List<TeacherReviewGroup>? reviewsTotalOfGroup,
      this.reviewsTotal = ''})
      : _availableCurriculumCodes = availableCurriculumCodes,
        _reviewsTotalOfGroup = reviewsTotalOfGroup;

  factory _$TeacherDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDetailImplFromJson(json);

  @override
  @JsonKey()
  final String aboutMe;
  @override
  @JsonKey()
  final int bookmarkedX;
  @override
  @JsonKey()
  @CTStringConverter()
  final String bookmarkedLimitted;
  @override
  @JsonKey()
  final String career;
  @override
  @JsonKey()
  final String certificationFile;
  @override
  @JsonKey()
  final String certificationType;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String degree;
  @override
  @JsonKey()
  final String movieUrl;
  @override
  @JsonKey()
  final String schoolGraduated;
  @override
  @JsonKey()
  final String teacherReference;
  final List<String>? _availableCurriculumCodes;
  @override
  List<String>? get availableCurriculumCodes {
    final value = _availableCurriculumCodes;
    if (value == null) return null;
    if (_availableCurriculumCodes is EqualUnmodifiableListView)
      return _availableCurriculumCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TeacherReviewGroup>? _reviewsTotalOfGroup;
  @override
  List<TeacherReviewGroup>? get reviewsTotalOfGroup {
    final value = _reviewsTotalOfGroup;
    if (value == null) return null;
    if (_reviewsTotalOfGroup is EqualUnmodifiableListView)
      return _reviewsTotalOfGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String reviewsTotal;

  @override
  String toString() {
    return 'TeacherDetail(aboutMe: $aboutMe, bookmarkedX: $bookmarkedX, bookmarkedLimitted: $bookmarkedLimitted, career: $career, certificationFile: $certificationFile, certificationType: $certificationType, country: $country, degree: $degree, movieUrl: $movieUrl, schoolGraduated: $schoolGraduated, teacherReference: $teacherReference, availableCurriculumCodes: $availableCurriculumCodes, reviewsTotalOfGroup: $reviewsTotalOfGroup, reviewsTotal: $reviewsTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDetailImpl &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.bookmarkedX, bookmarkedX) ||
                other.bookmarkedX == bookmarkedX) &&
            (identical(other.bookmarkedLimitted, bookmarkedLimitted) ||
                other.bookmarkedLimitted == bookmarkedLimitted) &&
            (identical(other.career, career) || other.career == career) &&
            (identical(other.certificationFile, certificationFile) ||
                other.certificationFile == certificationFile) &&
            (identical(other.certificationType, certificationType) ||
                other.certificationType == certificationType) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.movieUrl, movieUrl) ||
                other.movieUrl == movieUrl) &&
            (identical(other.schoolGraduated, schoolGraduated) ||
                other.schoolGraduated == schoolGraduated) &&
            (identical(other.teacherReference, teacherReference) ||
                other.teacherReference == teacherReference) &&
            const DeepCollectionEquality().equals(
                other._availableCurriculumCodes, _availableCurriculumCodes) &&
            const DeepCollectionEquality()
                .equals(other._reviewsTotalOfGroup, _reviewsTotalOfGroup) &&
            (identical(other.reviewsTotal, reviewsTotal) ||
                other.reviewsTotal == reviewsTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      aboutMe,
      bookmarkedX,
      bookmarkedLimitted,
      career,
      certificationFile,
      certificationType,
      country,
      degree,
      movieUrl,
      schoolGraduated,
      teacherReference,
      const DeepCollectionEquality().hash(_availableCurriculumCodes),
      const DeepCollectionEquality().hash(_reviewsTotalOfGroup),
      reviewsTotal);

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDetailImplCopyWith<_$TeacherDetailImpl> get copyWith =>
      __$$TeacherDetailImplCopyWithImpl<_$TeacherDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDetailImplToJson(
      this,
    );
  }
}

abstract class _TeacherDetail implements TeacherDetail {
  const factory _TeacherDetail(
      {final String aboutMe,
      final int bookmarkedX,
      @CTStringConverter() final String bookmarkedLimitted,
      final String career,
      final String certificationFile,
      final String certificationType,
      final String country,
      final String degree,
      final String movieUrl,
      final String schoolGraduated,
      final String teacherReference,
      final List<String>? availableCurriculumCodes,
      final List<TeacherReviewGroup>? reviewsTotalOfGroup,
      final String reviewsTotal}) = _$TeacherDetailImpl;

  factory _TeacherDetail.fromJson(Map<String, dynamic> json) =
      _$TeacherDetailImpl.fromJson;

  @override
  String get aboutMe;
  @override
  int get bookmarkedX;
  @override
  @CTStringConverter()
  String get bookmarkedLimitted;
  @override
  String get career;
  @override
  String get certificationFile;
  @override
  String get certificationType;
  @override
  String get country;
  @override
  String get degree;
  @override
  String get movieUrl;
  @override
  String get schoolGraduated;
  @override
  String get teacherReference;
  @override
  List<String>? get availableCurriculumCodes;
  @override
  List<TeacherReviewGroup>? get reviewsTotalOfGroup;
  @override
  String get reviewsTotal;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherDetailImplCopyWith<_$TeacherDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherReviewGroup _$TeacherReviewGroupFromJson(Map<String, dynamic> json) {
  return _TeacherReviewGroup.fromJson(json);
}

/// @nodoc
mixin _$TeacherReviewGroup {
  String? get icon => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  List<String>? get sites => throw _privateConstructorUsedError;

  /// Serializes this TeacherReviewGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherReviewGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherReviewGroupCopyWith<TeacherReviewGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherReviewGroupCopyWith<$Res> {
  factory $TeacherReviewGroupCopyWith(
          TeacherReviewGroup value, $Res Function(TeacherReviewGroup) then) =
      _$TeacherReviewGroupCopyWithImpl<$Res, TeacherReviewGroup>;
  @useResult
  $Res call(
      {String? icon,
      int? id,
      String? label,
      String? name,
      String? total,
      List<String>? sites});
}

/// @nodoc
class _$TeacherReviewGroupCopyWithImpl<$Res, $Val extends TeacherReviewGroup>
    implements $TeacherReviewGroupCopyWith<$Res> {
  _$TeacherReviewGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherReviewGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? total = freezed,
    Object? sites = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      sites: freezed == sites
          ? _value.sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherReviewGroupImplCopyWith<$Res>
    implements $TeacherReviewGroupCopyWith<$Res> {
  factory _$$TeacherReviewGroupImplCopyWith(_$TeacherReviewGroupImpl value,
          $Res Function(_$TeacherReviewGroupImpl) then) =
      __$$TeacherReviewGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? icon,
      int? id,
      String? label,
      String? name,
      String? total,
      List<String>? sites});
}

/// @nodoc
class __$$TeacherReviewGroupImplCopyWithImpl<$Res>
    extends _$TeacherReviewGroupCopyWithImpl<$Res, _$TeacherReviewGroupImpl>
    implements _$$TeacherReviewGroupImplCopyWith<$Res> {
  __$$TeacherReviewGroupImplCopyWithImpl(_$TeacherReviewGroupImpl _value,
      $Res Function(_$TeacherReviewGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherReviewGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? total = freezed,
    Object? sites = freezed,
  }) {
    return _then(_$TeacherReviewGroupImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      sites: freezed == sites
          ? _value._sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherReviewGroupImpl implements _TeacherReviewGroup {
  const _$TeacherReviewGroupImpl(
      {this.icon,
      this.id = 0,
      this.label,
      this.name,
      this.total,
      final List<String>? sites})
      : _sites = sites;

  factory _$TeacherReviewGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherReviewGroupImplFromJson(json);

  @override
  final String? icon;
  @override
  @JsonKey()
  final int? id;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final String? total;
  final List<String>? _sites;
  @override
  List<String>? get sites {
    final value = _sites;
    if (value == null) return null;
    if (_sites is EqualUnmodifiableListView) return _sites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TeacherReviewGroup(icon: $icon, id: $id, label: $label, name: $name, total: $total, sites: $sites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherReviewGroupImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._sites, _sites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, id, label, name, total,
      const DeepCollectionEquality().hash(_sites));

  /// Create a copy of TeacherReviewGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherReviewGroupImplCopyWith<_$TeacherReviewGroupImpl> get copyWith =>
      __$$TeacherReviewGroupImplCopyWithImpl<_$TeacherReviewGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherReviewGroupImplToJson(
      this,
    );
  }
}

abstract class _TeacherReviewGroup implements TeacherReviewGroup {
  const factory _TeacherReviewGroup(
      {final String? icon,
      final int? id,
      final String? label,
      final String? name,
      final String? total,
      final List<String>? sites}) = _$TeacherReviewGroupImpl;

  factory _TeacherReviewGroup.fromJson(Map<String, dynamic> json) =
      _$TeacherReviewGroupImpl.fromJson;

  @override
  String? get icon;
  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get name;
  @override
  String? get total;
  @override
  List<String>? get sites;

  /// Create a copy of TeacherReviewGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherReviewGroupImplCopyWith<_$TeacherReviewGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherBlock _$TeacherBlockFromJson(Map<String, dynamic> json) {
  return _TeacherBlock.fromJson(json);
}

/// @nodoc
mixin _$TeacherBlock {
  String? get baseDate => throw _privateConstructorUsedError;
  int get baseHeight => throw _privateConstructorUsedError;
  int get baseSize => throw _privateConstructorUsedError;
  int get baseTimeStamp => throw _privateConstructorUsedError;
  dynamic get companyContractGroupSchedule =>
      throw _privateConstructorUsedError;
  dynamic get disabled => throw _privateConstructorUsedError;
  int get endTimeStamp => throw _privateConstructorUsedError;
  int get groupLessonsSize => throw _privateConstructorUsedError;
  String? get isAlready => throw _privateConstructorUsedError;
  dynamic get isMine => throw _privateConstructorUsedError;
  dynamic get lesson => throw _privateConstructorUsedError;
  String? get realDate => throw _privateConstructorUsedError;
  String? get realTimeFrom => throw _privateConstructorUsedError;
  String? get realTimeTo => throw _privateConstructorUsedError;
  dynamic get roomSchedule => throw _privateConstructorUsedError;
  int get startTimeStamp => throw _privateConstructorUsedError;
  String? get statusForStudent => throw _privateConstructorUsedError;
  TeacherSchedule? get teacherSchedule => throw _privateConstructorUsedError;
  String? get timeBase => throw _privateConstructorUsedError;
  String? get timeFrom => throw _privateConstructorUsedError;
  String? get timeTo => throw _privateConstructorUsedError;
  String? get trimmed => throw _privateConstructorUsedError;
  int get typeId => throw _privateConstructorUsedError;

  /// Serializes this TeacherBlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherBlockCopyWith<TeacherBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherBlockCopyWith<$Res> {
  factory $TeacherBlockCopyWith(
          TeacherBlock value, $Res Function(TeacherBlock) then) =
      _$TeacherBlockCopyWithImpl<$Res, TeacherBlock>;
  @useResult
  $Res call(
      {String? baseDate,
      int baseHeight,
      int baseSize,
      int baseTimeStamp,
      dynamic companyContractGroupSchedule,
      dynamic disabled,
      int endTimeStamp,
      int groupLessonsSize,
      String? isAlready,
      dynamic isMine,
      dynamic lesson,
      String? realDate,
      String? realTimeFrom,
      String? realTimeTo,
      dynamic roomSchedule,
      int startTimeStamp,
      String? statusForStudent,
      TeacherSchedule? teacherSchedule,
      String? timeBase,
      String? timeFrom,
      String? timeTo,
      String? trimmed,
      int typeId});

  $TeacherScheduleCopyWith<$Res>? get teacherSchedule;
}

/// @nodoc
class _$TeacherBlockCopyWithImpl<$Res, $Val extends TeacherBlock>
    implements $TeacherBlockCopyWith<$Res> {
  _$TeacherBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDate = freezed,
    Object? baseHeight = null,
    Object? baseSize = null,
    Object? baseTimeStamp = null,
    Object? companyContractGroupSchedule = freezed,
    Object? disabled = freezed,
    Object? endTimeStamp = null,
    Object? groupLessonsSize = null,
    Object? isAlready = freezed,
    Object? isMine = freezed,
    Object? lesson = freezed,
    Object? realDate = freezed,
    Object? realTimeFrom = freezed,
    Object? realTimeTo = freezed,
    Object? roomSchedule = freezed,
    Object? startTimeStamp = null,
    Object? statusForStudent = freezed,
    Object? teacherSchedule = freezed,
    Object? timeBase = freezed,
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
    Object? trimmed = freezed,
    Object? typeId = null,
  }) {
    return _then(_value.copyWith(
      baseDate: freezed == baseDate
          ? _value.baseDate
          : baseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      baseHeight: null == baseHeight
          ? _value.baseHeight
          : baseHeight // ignore: cast_nullable_to_non_nullable
              as int,
      baseSize: null == baseSize
          ? _value.baseSize
          : baseSize // ignore: cast_nullable_to_non_nullable
              as int,
      baseTimeStamp: null == baseTimeStamp
          ? _value.baseTimeStamp
          : baseTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      companyContractGroupSchedule: freezed == companyContractGroupSchedule
          ? _value.companyContractGroupSchedule
          : companyContractGroupSchedule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTimeStamp: null == endTimeStamp
          ? _value.endTimeStamp
          : endTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      groupLessonsSize: null == groupLessonsSize
          ? _value.groupLessonsSize
          : groupLessonsSize // ignore: cast_nullable_to_non_nullable
              as int,
      isAlready: freezed == isAlready
          ? _value.isAlready
          : isAlready // ignore: cast_nullable_to_non_nullable
              as String?,
      isMine: freezed == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lesson: freezed == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as dynamic,
      realDate: freezed == realDate
          ? _value.realDate
          : realDate // ignore: cast_nullable_to_non_nullable
              as String?,
      realTimeFrom: freezed == realTimeFrom
          ? _value.realTimeFrom
          : realTimeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      realTimeTo: freezed == realTimeTo
          ? _value.realTimeTo
          : realTimeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      roomSchedule: freezed == roomSchedule
          ? _value.roomSchedule
          : roomSchedule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTimeStamp: null == startTimeStamp
          ? _value.startTimeStamp
          : startTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      statusForStudent: freezed == statusForStudent
          ? _value.statusForStudent
          : statusForStudent // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherSchedule: freezed == teacherSchedule
          ? _value.teacherSchedule
          : teacherSchedule // ignore: cast_nullable_to_non_nullable
              as TeacherSchedule?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      trimmed: freezed == trimmed
          ? _value.trimmed
          : trimmed // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherScheduleCopyWith<$Res>? get teacherSchedule {
    if (_value.teacherSchedule == null) {
      return null;
    }

    return $TeacherScheduleCopyWith<$Res>(_value.teacherSchedule!, (value) {
      return _then(_value.copyWith(teacherSchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherBlockImplCopyWith<$Res>
    implements $TeacherBlockCopyWith<$Res> {
  factory _$$TeacherBlockImplCopyWith(
          _$TeacherBlockImpl value, $Res Function(_$TeacherBlockImpl) then) =
      __$$TeacherBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? baseDate,
      int baseHeight,
      int baseSize,
      int baseTimeStamp,
      dynamic companyContractGroupSchedule,
      dynamic disabled,
      int endTimeStamp,
      int groupLessonsSize,
      String? isAlready,
      dynamic isMine,
      dynamic lesson,
      String? realDate,
      String? realTimeFrom,
      String? realTimeTo,
      dynamic roomSchedule,
      int startTimeStamp,
      String? statusForStudent,
      TeacherSchedule? teacherSchedule,
      String? timeBase,
      String? timeFrom,
      String? timeTo,
      String? trimmed,
      int typeId});

  @override
  $TeacherScheduleCopyWith<$Res>? get teacherSchedule;
}

/// @nodoc
class __$$TeacherBlockImplCopyWithImpl<$Res>
    extends _$TeacherBlockCopyWithImpl<$Res, _$TeacherBlockImpl>
    implements _$$TeacherBlockImplCopyWith<$Res> {
  __$$TeacherBlockImplCopyWithImpl(
      _$TeacherBlockImpl _value, $Res Function(_$TeacherBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDate = freezed,
    Object? baseHeight = null,
    Object? baseSize = null,
    Object? baseTimeStamp = null,
    Object? companyContractGroupSchedule = freezed,
    Object? disabled = freezed,
    Object? endTimeStamp = null,
    Object? groupLessonsSize = null,
    Object? isAlready = freezed,
    Object? isMine = freezed,
    Object? lesson = freezed,
    Object? realDate = freezed,
    Object? realTimeFrom = freezed,
    Object? realTimeTo = freezed,
    Object? roomSchedule = freezed,
    Object? startTimeStamp = null,
    Object? statusForStudent = freezed,
    Object? teacherSchedule = freezed,
    Object? timeBase = freezed,
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
    Object? trimmed = freezed,
    Object? typeId = null,
  }) {
    return _then(_$TeacherBlockImpl(
      baseDate: freezed == baseDate
          ? _value.baseDate
          : baseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      baseHeight: null == baseHeight
          ? _value.baseHeight
          : baseHeight // ignore: cast_nullable_to_non_nullable
              as int,
      baseSize: null == baseSize
          ? _value.baseSize
          : baseSize // ignore: cast_nullable_to_non_nullable
              as int,
      baseTimeStamp: null == baseTimeStamp
          ? _value.baseTimeStamp
          : baseTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      companyContractGroupSchedule: freezed == companyContractGroupSchedule
          ? _value.companyContractGroupSchedule
          : companyContractGroupSchedule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTimeStamp: null == endTimeStamp
          ? _value.endTimeStamp
          : endTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      groupLessonsSize: null == groupLessonsSize
          ? _value.groupLessonsSize
          : groupLessonsSize // ignore: cast_nullable_to_non_nullable
              as int,
      isAlready: freezed == isAlready
          ? _value.isAlready
          : isAlready // ignore: cast_nullable_to_non_nullable
              as String?,
      isMine: freezed == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lesson: freezed == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as dynamic,
      realDate: freezed == realDate
          ? _value.realDate
          : realDate // ignore: cast_nullable_to_non_nullable
              as String?,
      realTimeFrom: freezed == realTimeFrom
          ? _value.realTimeFrom
          : realTimeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      realTimeTo: freezed == realTimeTo
          ? _value.realTimeTo
          : realTimeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      roomSchedule: freezed == roomSchedule
          ? _value.roomSchedule
          : roomSchedule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTimeStamp: null == startTimeStamp
          ? _value.startTimeStamp
          : startTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      statusForStudent: freezed == statusForStudent
          ? _value.statusForStudent
          : statusForStudent // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherSchedule: freezed == teacherSchedule
          ? _value.teacherSchedule
          : teacherSchedule // ignore: cast_nullable_to_non_nullable
              as TeacherSchedule?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
      trimmed: freezed == trimmed
          ? _value.trimmed
          : trimmed // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherBlockImpl implements _TeacherBlock {
  const _$TeacherBlockImpl(
      {this.baseDate,
      this.baseHeight = 0,
      this.baseSize = 0,
      this.baseTimeStamp = 0,
      this.companyContractGroupSchedule,
      this.disabled,
      this.endTimeStamp = 0,
      this.groupLessonsSize = 0,
      this.isAlready,
      this.isMine,
      this.lesson,
      this.realDate,
      this.realTimeFrom,
      this.realTimeTo,
      this.roomSchedule,
      this.startTimeStamp = 0,
      this.statusForStudent,
      this.teacherSchedule,
      this.timeBase,
      this.timeFrom,
      this.timeTo,
      this.trimmed,
      this.typeId = 0});

  factory _$TeacherBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherBlockImplFromJson(json);

  @override
  final String? baseDate;
  @override
  @JsonKey()
  final int baseHeight;
  @override
  @JsonKey()
  final int baseSize;
  @override
  @JsonKey()
  final int baseTimeStamp;
  @override
  final dynamic companyContractGroupSchedule;
  @override
  final dynamic disabled;
  @override
  @JsonKey()
  final int endTimeStamp;
  @override
  @JsonKey()
  final int groupLessonsSize;
  @override
  final String? isAlready;
  @override
  final dynamic isMine;
  @override
  final dynamic lesson;
  @override
  final String? realDate;
  @override
  final String? realTimeFrom;
  @override
  final String? realTimeTo;
  @override
  final dynamic roomSchedule;
  @override
  @JsonKey()
  final int startTimeStamp;
  @override
  final String? statusForStudent;
  @override
  final TeacherSchedule? teacherSchedule;
  @override
  final String? timeBase;
  @override
  final String? timeFrom;
  @override
  final String? timeTo;
  @override
  final String? trimmed;
  @override
  @JsonKey()
  final int typeId;

  @override
  String toString() {
    return 'TeacherBlock(baseDate: $baseDate, baseHeight: $baseHeight, baseSize: $baseSize, baseTimeStamp: $baseTimeStamp, companyContractGroupSchedule: $companyContractGroupSchedule, disabled: $disabled, endTimeStamp: $endTimeStamp, groupLessonsSize: $groupLessonsSize, isAlready: $isAlready, isMine: $isMine, lesson: $lesson, realDate: $realDate, realTimeFrom: $realTimeFrom, realTimeTo: $realTimeTo, roomSchedule: $roomSchedule, startTimeStamp: $startTimeStamp, statusForStudent: $statusForStudent, teacherSchedule: $teacherSchedule, timeBase: $timeBase, timeFrom: $timeFrom, timeTo: $timeTo, trimmed: $trimmed, typeId: $typeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherBlockImpl &&
            (identical(other.baseDate, baseDate) ||
                other.baseDate == baseDate) &&
            (identical(other.baseHeight, baseHeight) ||
                other.baseHeight == baseHeight) &&
            (identical(other.baseSize, baseSize) ||
                other.baseSize == baseSize) &&
            (identical(other.baseTimeStamp, baseTimeStamp) ||
                other.baseTimeStamp == baseTimeStamp) &&
            const DeepCollectionEquality().equals(
                other.companyContractGroupSchedule,
                companyContractGroupSchedule) &&
            const DeepCollectionEquality().equals(other.disabled, disabled) &&
            (identical(other.endTimeStamp, endTimeStamp) ||
                other.endTimeStamp == endTimeStamp) &&
            (identical(other.groupLessonsSize, groupLessonsSize) ||
                other.groupLessonsSize == groupLessonsSize) &&
            (identical(other.isAlready, isAlready) ||
                other.isAlready == isAlready) &&
            const DeepCollectionEquality().equals(other.isMine, isMine) &&
            const DeepCollectionEquality().equals(other.lesson, lesson) &&
            (identical(other.realDate, realDate) ||
                other.realDate == realDate) &&
            (identical(other.realTimeFrom, realTimeFrom) ||
                other.realTimeFrom == realTimeFrom) &&
            (identical(other.realTimeTo, realTimeTo) ||
                other.realTimeTo == realTimeTo) &&
            const DeepCollectionEquality()
                .equals(other.roomSchedule, roomSchedule) &&
            (identical(other.startTimeStamp, startTimeStamp) ||
                other.startTimeStamp == startTimeStamp) &&
            (identical(other.statusForStudent, statusForStudent) ||
                other.statusForStudent == statusForStudent) &&
            (identical(other.teacherSchedule, teacherSchedule) ||
                other.teacherSchedule == teacherSchedule) &&
            (identical(other.timeBase, timeBase) ||
                other.timeBase == timeBase) &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo) &&
            (identical(other.trimmed, trimmed) || other.trimmed == trimmed) &&
            (identical(other.typeId, typeId) || other.typeId == typeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        baseDate,
        baseHeight,
        baseSize,
        baseTimeStamp,
        const DeepCollectionEquality().hash(companyContractGroupSchedule),
        const DeepCollectionEquality().hash(disabled),
        endTimeStamp,
        groupLessonsSize,
        isAlready,
        const DeepCollectionEquality().hash(isMine),
        const DeepCollectionEquality().hash(lesson),
        realDate,
        realTimeFrom,
        realTimeTo,
        const DeepCollectionEquality().hash(roomSchedule),
        startTimeStamp,
        statusForStudent,
        teacherSchedule,
        timeBase,
        timeFrom,
        timeTo,
        trimmed,
        typeId
      ]);

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherBlockImplCopyWith<_$TeacherBlockImpl> get copyWith =>
      __$$TeacherBlockImplCopyWithImpl<_$TeacherBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherBlockImplToJson(
      this,
    );
  }
}

abstract class _TeacherBlock implements TeacherBlock {
  const factory _TeacherBlock(
      {final String? baseDate,
      final int baseHeight,
      final int baseSize,
      final int baseTimeStamp,
      final dynamic companyContractGroupSchedule,
      final dynamic disabled,
      final int endTimeStamp,
      final int groupLessonsSize,
      final String? isAlready,
      final dynamic isMine,
      final dynamic lesson,
      final String? realDate,
      final String? realTimeFrom,
      final String? realTimeTo,
      final dynamic roomSchedule,
      final int startTimeStamp,
      final String? statusForStudent,
      final TeacherSchedule? teacherSchedule,
      final String? timeBase,
      final String? timeFrom,
      final String? timeTo,
      final String? trimmed,
      final int typeId}) = _$TeacherBlockImpl;

  factory _TeacherBlock.fromJson(Map<String, dynamic> json) =
      _$TeacherBlockImpl.fromJson;

  @override
  String? get baseDate;
  @override
  int get baseHeight;
  @override
  int get baseSize;
  @override
  int get baseTimeStamp;
  @override
  dynamic get companyContractGroupSchedule;
  @override
  dynamic get disabled;
  @override
  int get endTimeStamp;
  @override
  int get groupLessonsSize;
  @override
  String? get isAlready;
  @override
  dynamic get isMine;
  @override
  dynamic get lesson;
  @override
  String? get realDate;
  @override
  String? get realTimeFrom;
  @override
  String? get realTimeTo;
  @override
  dynamic get roomSchedule;
  @override
  int get startTimeStamp;
  @override
  String? get statusForStudent;
  @override
  TeacherSchedule? get teacherSchedule;
  @override
  String? get timeBase;
  @override
  String? get timeFrom;
  @override
  String? get timeTo;
  @override
  String? get trimmed;
  @override
  int get typeId;

  /// Create a copy of TeacherBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherBlockImplCopyWith<_$TeacherBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherSchedule _$TeacherScheduleFromJson(Map<String, dynamic> json) {
  return _TeacherSchedule.fromJson(json);
}

/// @nodoc
mixin _$TeacherSchedule {
  dynamic get curriculumCode => throw _privateConstructorUsedError;
  dynamic get endMin => throw _privateConstructorUsedError;
  int get endTime => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get lockedFlag => throw _privateConstructorUsedError;
  dynamic get startMin => throw _privateConstructorUsedError;
  int get startTime => throw _privateConstructorUsedError;
  String? get statusLabel => throw _privateConstructorUsedError;
  int get studentsMaxSize => throw _privateConstructorUsedError;
  String? get teacherUid => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  List<dynamic>? get availableCurriculumCodes =>
      throw _privateConstructorUsedError;
  List<dynamic>? get availableSiteIds => throw _privateConstructorUsedError;

  /// Serializes this TeacherSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherScheduleCopyWith<TeacherSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherScheduleCopyWith<$Res> {
  factory $TeacherScheduleCopyWith(
          TeacherSchedule value, $Res Function(TeacherSchedule) then) =
      _$TeacherScheduleCopyWithImpl<$Res, TeacherSchedule>;
  @useResult
  $Res call(
      {dynamic curriculumCode,
      dynamic endMin,
      int endTime,
      @CTBoolConverter() bool lockedFlag,
      dynamic startMin,
      int startTime,
      String? statusLabel,
      int studentsMaxSize,
      String? teacherUid,
      String? uid,
      List<dynamic>? availableCurriculumCodes,
      List<dynamic>? availableSiteIds});
}

/// @nodoc
class _$TeacherScheduleCopyWithImpl<$Res, $Val extends TeacherSchedule>
    implements $TeacherScheduleCopyWith<$Res> {
  _$TeacherScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curriculumCode = freezed,
    Object? endMin = freezed,
    Object? endTime = null,
    Object? lockedFlag = null,
    Object? startMin = freezed,
    Object? startTime = null,
    Object? statusLabel = freezed,
    Object? studentsMaxSize = null,
    Object? teacherUid = freezed,
    Object? uid = freezed,
    Object? availableCurriculumCodes = freezed,
    Object? availableSiteIds = freezed,
  }) {
    return _then(_value.copyWith(
      curriculumCode: freezed == curriculumCode
          ? _value.curriculumCode
          : curriculumCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endMin: freezed == endMin
          ? _value.endMin
          : endMin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      lockedFlag: null == lockedFlag
          ? _value.lockedFlag
          : lockedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      startMin: freezed == startMin
          ? _value.startMin
          : startMin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      statusLabel: freezed == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      studentsMaxSize: null == studentsMaxSize
          ? _value.studentsMaxSize
          : studentsMaxSize // ignore: cast_nullable_to_non_nullable
              as int,
      teacherUid: freezed == teacherUid
          ? _value.teacherUid
          : teacherUid // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value.availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      availableSiteIds: freezed == availableSiteIds
          ? _value.availableSiteIds
          : availableSiteIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherScheduleImplCopyWith<$Res>
    implements $TeacherScheduleCopyWith<$Res> {
  factory _$$TeacherScheduleImplCopyWith(_$TeacherScheduleImpl value,
          $Res Function(_$TeacherScheduleImpl) then) =
      __$$TeacherScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic curriculumCode,
      dynamic endMin,
      int endTime,
      @CTBoolConverter() bool lockedFlag,
      dynamic startMin,
      int startTime,
      String? statusLabel,
      int studentsMaxSize,
      String? teacherUid,
      String? uid,
      List<dynamic>? availableCurriculumCodes,
      List<dynamic>? availableSiteIds});
}

/// @nodoc
class __$$TeacherScheduleImplCopyWithImpl<$Res>
    extends _$TeacherScheduleCopyWithImpl<$Res, _$TeacherScheduleImpl>
    implements _$$TeacherScheduleImplCopyWith<$Res> {
  __$$TeacherScheduleImplCopyWithImpl(
      _$TeacherScheduleImpl _value, $Res Function(_$TeacherScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curriculumCode = freezed,
    Object? endMin = freezed,
    Object? endTime = null,
    Object? lockedFlag = null,
    Object? startMin = freezed,
    Object? startTime = null,
    Object? statusLabel = freezed,
    Object? studentsMaxSize = null,
    Object? teacherUid = freezed,
    Object? uid = freezed,
    Object? availableCurriculumCodes = freezed,
    Object? availableSiteIds = freezed,
  }) {
    return _then(_$TeacherScheduleImpl(
      curriculumCode: freezed == curriculumCode
          ? _value.curriculumCode
          : curriculumCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endMin: freezed == endMin
          ? _value.endMin
          : endMin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      lockedFlag: null == lockedFlag
          ? _value.lockedFlag
          : lockedFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      startMin: freezed == startMin
          ? _value.startMin
          : startMin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      statusLabel: freezed == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      studentsMaxSize: null == studentsMaxSize
          ? _value.studentsMaxSize
          : studentsMaxSize // ignore: cast_nullable_to_non_nullable
              as int,
      teacherUid: freezed == teacherUid
          ? _value.teacherUid
          : teacherUid // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value._availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      availableSiteIds: freezed == availableSiteIds
          ? _value._availableSiteIds
          : availableSiteIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherScheduleImpl implements _TeacherSchedule {
  const _$TeacherScheduleImpl(
      {this.curriculumCode,
      this.endMin,
      this.endTime = 0,
      @CTBoolConverter() this.lockedFlag = false,
      this.startMin,
      this.startTime = 0,
      this.statusLabel,
      this.studentsMaxSize = 0,
      this.teacherUid,
      this.uid,
      final List<dynamic>? availableCurriculumCodes,
      final List<dynamic>? availableSiteIds})
      : _availableCurriculumCodes = availableCurriculumCodes,
        _availableSiteIds = availableSiteIds;

  factory _$TeacherScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherScheduleImplFromJson(json);

  @override
  final dynamic curriculumCode;
  @override
  final dynamic endMin;
  @override
  @JsonKey()
  final int endTime;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool lockedFlag;
  @override
  final dynamic startMin;
  @override
  @JsonKey()
  final int startTime;
  @override
  final String? statusLabel;
  @override
  @JsonKey()
  final int studentsMaxSize;
  @override
  final String? teacherUid;
  @override
  final String? uid;
  final List<dynamic>? _availableCurriculumCodes;
  @override
  List<dynamic>? get availableCurriculumCodes {
    final value = _availableCurriculumCodes;
    if (value == null) return null;
    if (_availableCurriculumCodes is EqualUnmodifiableListView)
      return _availableCurriculumCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _availableSiteIds;
  @override
  List<dynamic>? get availableSiteIds {
    final value = _availableSiteIds;
    if (value == null) return null;
    if (_availableSiteIds is EqualUnmodifiableListView)
      return _availableSiteIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TeacherSchedule(curriculumCode: $curriculumCode, endMin: $endMin, endTime: $endTime, lockedFlag: $lockedFlag, startMin: $startMin, startTime: $startTime, statusLabel: $statusLabel, studentsMaxSize: $studentsMaxSize, teacherUid: $teacherUid, uid: $uid, availableCurriculumCodes: $availableCurriculumCodes, availableSiteIds: $availableSiteIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherScheduleImpl &&
            const DeepCollectionEquality()
                .equals(other.curriculumCode, curriculumCode) &&
            const DeepCollectionEquality().equals(other.endMin, endMin) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.lockedFlag, lockedFlag) ||
                other.lockedFlag == lockedFlag) &&
            const DeepCollectionEquality().equals(other.startMin, startMin) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.studentsMaxSize, studentsMaxSize) ||
                other.studentsMaxSize == studentsMaxSize) &&
            (identical(other.teacherUid, teacherUid) ||
                other.teacherUid == teacherUid) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(
                other._availableCurriculumCodes, _availableCurriculumCodes) &&
            const DeepCollectionEquality()
                .equals(other._availableSiteIds, _availableSiteIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(curriculumCode),
      const DeepCollectionEquality().hash(endMin),
      endTime,
      lockedFlag,
      const DeepCollectionEquality().hash(startMin),
      startTime,
      statusLabel,
      studentsMaxSize,
      teacherUid,
      uid,
      const DeepCollectionEquality().hash(_availableCurriculumCodes),
      const DeepCollectionEquality().hash(_availableSiteIds));

  /// Create a copy of TeacherSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherScheduleImplCopyWith<_$TeacherScheduleImpl> get copyWith =>
      __$$TeacherScheduleImplCopyWithImpl<_$TeacherScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherScheduleImplToJson(
      this,
    );
  }
}

abstract class _TeacherSchedule implements TeacherSchedule {
  const factory _TeacherSchedule(
      {final dynamic curriculumCode,
      final dynamic endMin,
      final int endTime,
      @CTBoolConverter() final bool lockedFlag,
      final dynamic startMin,
      final int startTime,
      final String? statusLabel,
      final int studentsMaxSize,
      final String? teacherUid,
      final String? uid,
      final List<dynamic>? availableCurriculumCodes,
      final List<dynamic>? availableSiteIds}) = _$TeacherScheduleImpl;

  factory _TeacherSchedule.fromJson(Map<String, dynamic> json) =
      _$TeacherScheduleImpl.fromJson;

  @override
  dynamic get curriculumCode;
  @override
  dynamic get endMin;
  @override
  int get endTime;
  @override
  @CTBoolConverter()
  bool get lockedFlag;
  @override
  dynamic get startMin;
  @override
  int get startTime;
  @override
  String? get statusLabel;
  @override
  int get studentsMaxSize;
  @override
  String? get teacherUid;
  @override
  String? get uid;
  @override
  List<dynamic>? get availableCurriculumCodes;
  @override
  List<dynamic>? get availableSiteIds;

  /// Create a copy of TeacherSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherScheduleImplCopyWith<_$TeacherScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
