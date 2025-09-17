// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Curriculum _$CurriculumFromJson(Map<String, dynamic> json) {
  return _Curriculum.fromJson(json);
}

/// @nodoc
mixin _$Curriculum {
  /// 适用用户列表
  List<ApplicableUser>? get applicableUser =>
      throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  dynamic get curriculumStudyPage => throw _privateConstructorUsedError;
  dynamic get curriculumTotalPage => throw _privateConstructorUsedError;
  dynamic get description => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get lead => throw _privateConstructorUsedError;
  int? get lessonTimeId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get isFtl => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get groupFlag => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get oneToOneFlag => throw _privateConstructorUsedError;

  /// Serializes this Curriculum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Curriculum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumCopyWith<Curriculum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumCopyWith<$Res> {
  factory $CurriculumCopyWith(
          Curriculum value, $Res Function(Curriculum) then) =
      _$CurriculumCopyWithImpl<$Res, Curriculum>;
  @useResult
  $Res call(
      {List<ApplicableUser>? applicableUser,
      String? code,
      dynamic curriculumStudyPage,
      dynamic curriculumTotalPage,
      dynamic description,
      int id,
      String? image,
      String? lead,
      int? lessonTimeId,
      String? name,
      @CTBoolConverter() bool isFtl,
      @CTBoolConverter() bool groupFlag,
      @CTBoolConverter() bool oneToOneFlag});
}

/// @nodoc
class _$CurriculumCopyWithImpl<$Res, $Val extends Curriculum>
    implements $CurriculumCopyWith<$Res> {
  _$CurriculumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Curriculum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicableUser = freezed,
    Object? code = freezed,
    Object? curriculumStudyPage = freezed,
    Object? curriculumTotalPage = freezed,
    Object? description = freezed,
    Object? id = null,
    Object? image = freezed,
    Object? lead = freezed,
    Object? lessonTimeId = freezed,
    Object? name = freezed,
    Object? isFtl = null,
    Object? groupFlag = null,
    Object? oneToOneFlag = null,
  }) {
    return _then(_value.copyWith(
      applicableUser: freezed == applicableUser
          ? _value.applicableUser
          : applicableUser // ignore: cast_nullable_to_non_nullable
              as List<ApplicableUser>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumStudyPage: freezed == curriculumStudyPage
          ? _value.curriculumStudyPage
          : curriculumStudyPage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      curriculumTotalPage: freezed == curriculumTotalPage
          ? _value.curriculumTotalPage
          : curriculumTotalPage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonTimeId: freezed == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isFtl: null == isFtl
          ? _value.isFtl
          : isFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      groupFlag: null == groupFlag
          ? _value.groupFlag
          : groupFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      oneToOneFlag: null == oneToOneFlag
          ? _value.oneToOneFlag
          : oneToOneFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumImplCopyWith<$Res>
    implements $CurriculumCopyWith<$Res> {
  factory _$$CurriculumImplCopyWith(
          _$CurriculumImpl value, $Res Function(_$CurriculumImpl) then) =
      __$$CurriculumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ApplicableUser>? applicableUser,
      String? code,
      dynamic curriculumStudyPage,
      dynamic curriculumTotalPage,
      dynamic description,
      int id,
      String? image,
      String? lead,
      int? lessonTimeId,
      String? name,
      @CTBoolConverter() bool isFtl,
      @CTBoolConverter() bool groupFlag,
      @CTBoolConverter() bool oneToOneFlag});
}

/// @nodoc
class __$$CurriculumImplCopyWithImpl<$Res>
    extends _$CurriculumCopyWithImpl<$Res, _$CurriculumImpl>
    implements _$$CurriculumImplCopyWith<$Res> {
  __$$CurriculumImplCopyWithImpl(
      _$CurriculumImpl _value, $Res Function(_$CurriculumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Curriculum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicableUser = freezed,
    Object? code = freezed,
    Object? curriculumStudyPage = freezed,
    Object? curriculumTotalPage = freezed,
    Object? description = freezed,
    Object? id = null,
    Object? image = freezed,
    Object? lead = freezed,
    Object? lessonTimeId = freezed,
    Object? name = freezed,
    Object? isFtl = null,
    Object? groupFlag = null,
    Object? oneToOneFlag = null,
  }) {
    return _then(_$CurriculumImpl(
      applicableUser: freezed == applicableUser
          ? _value._applicableUser
          : applicableUser // ignore: cast_nullable_to_non_nullable
              as List<ApplicableUser>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      curriculumStudyPage: freezed == curriculumStudyPage
          ? _value.curriculumStudyPage!
          : curriculumStudyPage,
      curriculumTotalPage: freezed == curriculumTotalPage
          ? _value.curriculumTotalPage!
          : curriculumTotalPage,
      description: freezed == description ? _value.description! : description,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonTimeId: freezed == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isFtl: null == isFtl
          ? _value.isFtl
          : isFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      groupFlag: null == groupFlag
          ? _value.groupFlag
          : groupFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      oneToOneFlag: null == oneToOneFlag
          ? _value.oneToOneFlag
          : oneToOneFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurriculumImpl implements _Curriculum {
  const _$CurriculumImpl(
      {final List<ApplicableUser>? applicableUser,
      this.code,
      this.curriculumStudyPage = 0,
      this.curriculumTotalPage = 0,
      this.description = "",
      this.id = 0,
      this.image,
      this.lead,
      this.lessonTimeId,
      this.name,
      @CTBoolConverter() this.isFtl = false,
      @CTBoolConverter() this.groupFlag = false,
      @CTBoolConverter() this.oneToOneFlag = false})
      : _applicableUser = applicableUser;

  factory _$CurriculumImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumImplFromJson(json);

  /// 适用用户列表
  final List<ApplicableUser>? _applicableUser;

  /// 适用用户列表
  @override
  List<ApplicableUser>? get applicableUser {
    final value = _applicableUser;
    if (value == null) return null;
    if (_applicableUser is EqualUnmodifiableListView) return _applicableUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;
  @override
  @JsonKey()
  final dynamic curriculumStudyPage;
  @override
  @JsonKey()
  final dynamic curriculumTotalPage;
  @override
  @JsonKey()
  final dynamic description;
  @override
  @JsonKey()
  final int id;
  @override
  final String? image;
  @override
  final String? lead;
  @override
  final int? lessonTimeId;
  @override
  final String? name;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool isFtl;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool groupFlag;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool oneToOneFlag;

  @override
  String toString() {
    return 'Curriculum(applicableUser: $applicableUser, code: $code, curriculumStudyPage: $curriculumStudyPage, curriculumTotalPage: $curriculumTotalPage, description: $description, id: $id, image: $image, lead: $lead, lessonTimeId: $lessonTimeId, name: $name, isFtl: $isFtl, groupFlag: $groupFlag, oneToOneFlag: $oneToOneFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumImpl &&
            const DeepCollectionEquality()
                .equals(other._applicableUser, _applicableUser) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other.curriculumStudyPage, curriculumStudyPage) &&
            const DeepCollectionEquality()
                .equals(other.curriculumTotalPage, curriculumTotalPage) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lead, lead) || other.lead == lead) &&
            (identical(other.lessonTimeId, lessonTimeId) ||
                other.lessonTimeId == lessonTimeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFtl, isFtl) || other.isFtl == isFtl) &&
            (identical(other.groupFlag, groupFlag) ||
                other.groupFlag == groupFlag) &&
            (identical(other.oneToOneFlag, oneToOneFlag) ||
                other.oneToOneFlag == oneToOneFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_applicableUser),
      code,
      const DeepCollectionEquality().hash(curriculumStudyPage),
      const DeepCollectionEquality().hash(curriculumTotalPage),
      const DeepCollectionEquality().hash(description),
      id,
      image,
      lead,
      lessonTimeId,
      name,
      isFtl,
      groupFlag,
      oneToOneFlag);

  /// Create a copy of Curriculum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumImplCopyWith<_$CurriculumImpl> get copyWith =>
      __$$CurriculumImplCopyWithImpl<_$CurriculumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurriculumImplToJson(
      this,
    );
  }
}

abstract class _Curriculum implements Curriculum {
  const factory _Curriculum(
      {final List<ApplicableUser>? applicableUser,
      final String? code,
      final dynamic curriculumStudyPage,
      final dynamic curriculumTotalPage,
      final dynamic description,
      final int id,
      final String? image,
      final String? lead,
      final int? lessonTimeId,
      final String? name,
      @CTBoolConverter() final bool isFtl,
      @CTBoolConverter() final bool groupFlag,
      @CTBoolConverter() final bool oneToOneFlag}) = _$CurriculumImpl;

  factory _Curriculum.fromJson(Map<String, dynamic> json) =
      _$CurriculumImpl.fromJson;

  /// 适用用户列表
  @override
  List<ApplicableUser>? get applicableUser;
  @override
  String? get code;
  @override
  dynamic get curriculumStudyPage;
  @override
  dynamic get curriculumTotalPage;
  @override
  dynamic get description;
  @override
  int get id;
  @override
  String? get image;
  @override
  String? get lead;
  @override
  int? get lessonTimeId;
  @override
  String? get name;
  @override
  @CTBoolConverter()
  bool get isFtl;
  @override
  @CTBoolConverter()
  bool get groupFlag;
  @override
  @CTBoolConverter()
  bool get oneToOneFlag;

  /// Create a copy of Curriculum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumImplCopyWith<_$CurriculumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
