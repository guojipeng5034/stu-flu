// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String? get code => throw _privateConstructorUsedError;
  String? get createdTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  dynamic get invalid => throw _privateConstructorUsedError;
  int get lessonSize => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TicketTimeRange> get limitedTimeSpansJson =>
      throw _privateConstructorUsedError;
  String get lessonTimeId => throw _privateConstructorUsedError;
  String get maxTeacherPoints => throw _privateConstructorUsedError;
  int get statusId => throw _privateConstructorUsedError;
  int get typeId => throw _privateConstructorUsedError;
  List<TicketAvailableCurriculum>? get availableCurriculum =>
      throw _privateConstructorUsedError;
  List<String>? get availableCurriculumCodes =>
      throw _privateConstructorUsedError;

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String? code,
      String? createdTime,
      String? description,
      dynamic invalid,
      int lessonSize,
      String name,
      List<TicketTimeRange> limitedTimeSpansJson,
      String lessonTimeId,
      String maxTeacherPoints,
      int statusId,
      int typeId,
      List<TicketAvailableCurriculum>? availableCurriculum,
      List<String>? availableCurriculumCodes});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? createdTime = freezed,
    Object? description = freezed,
    Object? invalid = freezed,
    Object? lessonSize = null,
    Object? name = null,
    Object? limitedTimeSpansJson = null,
    Object? lessonTimeId = null,
    Object? maxTeacherPoints = null,
    Object? statusId = null,
    Object? typeId = null,
    Object? availableCurriculum = freezed,
    Object? availableCurriculumCodes = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      invalid: freezed == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lessonSize: null == lessonSize
          ? _value.lessonSize
          : lessonSize // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      limitedTimeSpansJson: null == limitedTimeSpansJson
          ? _value.limitedTimeSpansJson
          : limitedTimeSpansJson // ignore: cast_nullable_to_non_nullable
              as List<TicketTimeRange>,
      lessonTimeId: null == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as String,
      maxTeacherPoints: null == maxTeacherPoints
          ? _value.maxTeacherPoints
          : maxTeacherPoints // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int,
      availableCurriculum: freezed == availableCurriculum
          ? _value.availableCurriculum
          : availableCurriculum // ignore: cast_nullable_to_non_nullable
              as List<TicketAvailableCurriculum>?,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value.availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? createdTime,
      String? description,
      dynamic invalid,
      int lessonSize,
      String name,
      List<TicketTimeRange> limitedTimeSpansJson,
      String lessonTimeId,
      String maxTeacherPoints,
      int statusId,
      int typeId,
      List<TicketAvailableCurriculum>? availableCurriculum,
      List<String>? availableCurriculumCodes});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? createdTime = freezed,
    Object? description = freezed,
    Object? invalid = freezed,
    Object? lessonSize = null,
    Object? name = null,
    Object? limitedTimeSpansJson = null,
    Object? lessonTimeId = null,
    Object? maxTeacherPoints = null,
    Object? statusId = null,
    Object? typeId = null,
    Object? availableCurriculum = freezed,
    Object? availableCurriculumCodes = freezed,
  }) {
    return _then(_$TicketImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      invalid: freezed == invalid
          ? _value.invalid
          : invalid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lessonSize: null == lessonSize
          ? _value.lessonSize
          : lessonSize // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      limitedTimeSpansJson: null == limitedTimeSpansJson
          ? _value._limitedTimeSpansJson
          : limitedTimeSpansJson // ignore: cast_nullable_to_non_nullable
              as List<TicketTimeRange>,
      lessonTimeId: null == lessonTimeId
          ? _value.lessonTimeId
          : lessonTimeId // ignore: cast_nullable_to_non_nullable
              as String,
      maxTeacherPoints: null == maxTeacherPoints
          ? _value.maxTeacherPoints
          : maxTeacherPoints // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      typeId: null == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int,
      availableCurriculum: freezed == availableCurriculum
          ? _value._availableCurriculum
          : availableCurriculum // ignore: cast_nullable_to_non_nullable
              as List<TicketAvailableCurriculum>?,
      availableCurriculumCodes: freezed == availableCurriculumCodes
          ? _value._availableCurriculumCodes
          : availableCurriculumCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {this.code,
      this.createdTime,
      this.description,
      this.invalid,
      this.lessonSize = 0,
      this.name = '0',
      final List<TicketTimeRange> limitedTimeSpansJson = const [],
      this.lessonTimeId = '0',
      this.maxTeacherPoints = '0',
      this.statusId = 0,
      this.typeId = 0,
      final List<TicketAvailableCurriculum>? availableCurriculum,
      final List<String>? availableCurriculumCodes})
      : _limitedTimeSpansJson = limitedTimeSpansJson,
        _availableCurriculum = availableCurriculum,
        _availableCurriculumCodes = availableCurriculumCodes;

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final String? code;
  @override
  final String? createdTime;
  @override
  final String? description;
  @override
  final dynamic invalid;
  @override
  @JsonKey()
  final int lessonSize;
  @override
  @JsonKey()
  final String name;
  final List<TicketTimeRange> _limitedTimeSpansJson;
  @override
  @JsonKey()
  List<TicketTimeRange> get limitedTimeSpansJson {
    if (_limitedTimeSpansJson is EqualUnmodifiableListView)
      return _limitedTimeSpansJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_limitedTimeSpansJson);
  }

  @override
  @JsonKey()
  final String lessonTimeId;
  @override
  @JsonKey()
  final String maxTeacherPoints;
  @override
  @JsonKey()
  final int statusId;
  @override
  @JsonKey()
  final int typeId;
  final List<TicketAvailableCurriculum>? _availableCurriculum;
  @override
  List<TicketAvailableCurriculum>? get availableCurriculum {
    final value = _availableCurriculum;
    if (value == null) return null;
    if (_availableCurriculum is EqualUnmodifiableListView)
      return _availableCurriculum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  @override
  String toString() {
    return 'Ticket(code: $code, createdTime: $createdTime, description: $description, invalid: $invalid, lessonSize: $lessonSize, name: $name, limitedTimeSpansJson: $limitedTimeSpansJson, lessonTimeId: $lessonTimeId, maxTeacherPoints: $maxTeacherPoints, statusId: $statusId, typeId: $typeId, availableCurriculum: $availableCurriculum, availableCurriculumCodes: $availableCurriculumCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.invalid, invalid) &&
            (identical(other.lessonSize, lessonSize) ||
                other.lessonSize == lessonSize) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._limitedTimeSpansJson, _limitedTimeSpansJson) &&
            (identical(other.lessonTimeId, lessonTimeId) ||
                other.lessonTimeId == lessonTimeId) &&
            (identical(other.maxTeacherPoints, maxTeacherPoints) ||
                other.maxTeacherPoints == maxTeacherPoints) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            const DeepCollectionEquality()
                .equals(other._availableCurriculum, _availableCurriculum) &&
            const DeepCollectionEquality().equals(
                other._availableCurriculumCodes, _availableCurriculumCodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      createdTime,
      description,
      const DeepCollectionEquality().hash(invalid),
      lessonSize,
      name,
      const DeepCollectionEquality().hash(_limitedTimeSpansJson),
      lessonTimeId,
      maxTeacherPoints,
      statusId,
      typeId,
      const DeepCollectionEquality().hash(_availableCurriculum),
      const DeepCollectionEquality().hash(_availableCurriculumCodes));

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {final String? code,
      final String? createdTime,
      final String? description,
      final dynamic invalid,
      final int lessonSize,
      final String name,
      final List<TicketTimeRange> limitedTimeSpansJson,
      final String lessonTimeId,
      final String maxTeacherPoints,
      final int statusId,
      final int typeId,
      final List<TicketAvailableCurriculum>? availableCurriculum,
      final List<String>? availableCurriculumCodes}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  String? get code;
  @override
  String? get createdTime;
  @override
  String? get description;
  @override
  dynamic get invalid;
  @override
  int get lessonSize;
  @override
  String get name;
  @override
  List<TicketTimeRange> get limitedTimeSpansJson;
  @override
  String get lessonTimeId;
  @override
  String get maxTeacherPoints;
  @override
  int get statusId;
  @override
  int get typeId;
  @override
  List<TicketAvailableCurriculum>? get availableCurriculum;
  @override
  List<String>? get availableCurriculumCodes;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketAvailableCurriculum _$TicketAvailableCurriculumFromJson(
    Map<String, dynamic> json) {
  return _TicketAvailableCurriculum.fromJson(json);
}

/// @nodoc
mixin _$TicketAvailableCurriculum {
  String get code => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TicketAvailableCurriculum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketAvailableCurriculum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketAvailableCurriculumCopyWith<TicketAvailableCurriculum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketAvailableCurriculumCopyWith<$Res> {
  factory $TicketAvailableCurriculumCopyWith(TicketAvailableCurriculum value,
          $Res Function(TicketAvailableCurriculum) then) =
      _$TicketAvailableCurriculumCopyWithImpl<$Res, TicketAvailableCurriculum>;
  @useResult
  $Res call({String code, int id, String name});
}

/// @nodoc
class _$TicketAvailableCurriculumCopyWithImpl<$Res,
        $Val extends TicketAvailableCurriculum>
    implements $TicketAvailableCurriculumCopyWith<$Res> {
  _$TicketAvailableCurriculumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketAvailableCurriculum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketAvailableCurriculumImplCopyWith<$Res>
    implements $TicketAvailableCurriculumCopyWith<$Res> {
  factory _$$TicketAvailableCurriculumImplCopyWith(
          _$TicketAvailableCurriculumImpl value,
          $Res Function(_$TicketAvailableCurriculumImpl) then) =
      __$$TicketAvailableCurriculumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, int id, String name});
}

/// @nodoc
class __$$TicketAvailableCurriculumImplCopyWithImpl<$Res>
    extends _$TicketAvailableCurriculumCopyWithImpl<$Res,
        _$TicketAvailableCurriculumImpl>
    implements _$$TicketAvailableCurriculumImplCopyWith<$Res> {
  __$$TicketAvailableCurriculumImplCopyWithImpl(
      _$TicketAvailableCurriculumImpl _value,
      $Res Function(_$TicketAvailableCurriculumImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketAvailableCurriculum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TicketAvailableCurriculumImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketAvailableCurriculumImpl implements _TicketAvailableCurriculum {
  const _$TicketAvailableCurriculumImpl(
      {this.code = '', this.id = 0, this.name = ''});

  factory _$TicketAvailableCurriculumImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketAvailableCurriculumImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'TicketAvailableCurriculum(code: $code, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketAvailableCurriculumImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, id, name);

  /// Create a copy of TicketAvailableCurriculum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketAvailableCurriculumImplCopyWith<_$TicketAvailableCurriculumImpl>
      get copyWith => __$$TicketAvailableCurriculumImplCopyWithImpl<
          _$TicketAvailableCurriculumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketAvailableCurriculumImplToJson(
      this,
    );
  }
}

abstract class _TicketAvailableCurriculum implements TicketAvailableCurriculum {
  const factory _TicketAvailableCurriculum(
      {final String code,
      final int id,
      final String name}) = _$TicketAvailableCurriculumImpl;

  factory _TicketAvailableCurriculum.fromJson(Map<String, dynamic> json) =
      _$TicketAvailableCurriculumImpl.fromJson;

  @override
  String get code;
  @override
  int get id;
  @override
  String get name;

  /// Create a copy of TicketAvailableCurriculum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketAvailableCurriculumImplCopyWith<_$TicketAvailableCurriculumImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TicketTimeRange _$TicketTimeRangeFromJson(Map<String, dynamic> json) {
  return _TicketTimeRange.fromJson(json);
}

/// @nodoc
mixin _$TicketTimeRange {
  String get timeFrom => throw _privateConstructorUsedError;
  String get timeTo => throw _privateConstructorUsedError;

  /// Serializes this TicketTimeRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTimeRangeCopyWith<TicketTimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTimeRangeCopyWith<$Res> {
  factory $TicketTimeRangeCopyWith(
          TicketTimeRange value, $Res Function(TicketTimeRange) then) =
      _$TicketTimeRangeCopyWithImpl<$Res, TicketTimeRange>;
  @useResult
  $Res call({String timeFrom, String timeTo});
}

/// @nodoc
class _$TicketTimeRangeCopyWithImpl<$Res, $Val extends TicketTimeRange>
    implements $TicketTimeRangeCopyWith<$Res> {
  _$TicketTimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrom = null,
    Object? timeTo = null,
  }) {
    return _then(_value.copyWith(
      timeFrom: null == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      timeTo: null == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTimeRangeImplCopyWith<$Res>
    implements $TicketTimeRangeCopyWith<$Res> {
  factory _$$TicketTimeRangeImplCopyWith(_$TicketTimeRangeImpl value,
          $Res Function(_$TicketTimeRangeImpl) then) =
      __$$TicketTimeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String timeFrom, String timeTo});
}

/// @nodoc
class __$$TicketTimeRangeImplCopyWithImpl<$Res>
    extends _$TicketTimeRangeCopyWithImpl<$Res, _$TicketTimeRangeImpl>
    implements _$$TicketTimeRangeImplCopyWith<$Res> {
  __$$TicketTimeRangeImplCopyWithImpl(
      _$TicketTimeRangeImpl _value, $Res Function(_$TicketTimeRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrom = null,
    Object? timeTo = null,
  }) {
    return _then(_$TicketTimeRangeImpl(
      timeFrom: null == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      timeTo: null == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTimeRangeImpl implements _TicketTimeRange {
  const _$TicketTimeRangeImpl({this.timeFrom = '', this.timeTo = ''});

  factory _$TicketTimeRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTimeRangeImplFromJson(json);

  @override
  @JsonKey()
  final String timeFrom;
  @override
  @JsonKey()
  final String timeTo;

  @override
  String toString() {
    return 'TicketTimeRange(timeFrom: $timeFrom, timeTo: $timeTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTimeRangeImpl &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timeFrom, timeTo);

  /// Create a copy of TicketTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTimeRangeImplCopyWith<_$TicketTimeRangeImpl> get copyWith =>
      __$$TicketTimeRangeImplCopyWithImpl<_$TicketTimeRangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTimeRangeImplToJson(
      this,
    );
  }
}

abstract class _TicketTimeRange implements TicketTimeRange {
  const factory _TicketTimeRange({final String timeFrom, final String timeTo}) =
      _$TicketTimeRangeImpl;

  factory _TicketTimeRange.fromJson(Map<String, dynamic> json) =
      _$TicketTimeRangeImpl.fromJson;

  @override
  String get timeFrom;
  @override
  String get timeTo;

  /// Create a copy of TicketTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTimeRangeImplCopyWith<_$TicketTimeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
