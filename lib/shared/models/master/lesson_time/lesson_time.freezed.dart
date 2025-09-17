// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonTimeBean _$LessonTimeBeanFromJson(Map<String, dynamic> json) {
  return _LessonTimeBean.fromJson(json);
}

/// @nodoc
mixin _$LessonTimeBean {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get abbr => throw _privateConstructorUsedError;
  String? get mins => throw _privateConstructorUsedError;
  int? get openRestriction => throw _privateConstructorUsedError;
  List<int>? get unavailableLessonStart => throw _privateConstructorUsedError;

  /// Serializes this LessonTimeBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonTimeBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonTimeBeanCopyWith<LessonTimeBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonTimeBeanCopyWith<$Res> {
  factory $LessonTimeBeanCopyWith(
          LessonTimeBean value, $Res Function(LessonTimeBean) then) =
      _$LessonTimeBeanCopyWithImpl<$Res, LessonTimeBean>;
  @useResult
  $Res call(
      {int? id,
      String? label,
      String? name,
      String? abbr,
      String? mins,
      int? openRestriction,
      List<int>? unavailableLessonStart});
}

/// @nodoc
class _$LessonTimeBeanCopyWithImpl<$Res, $Val extends LessonTimeBean>
    implements $LessonTimeBeanCopyWith<$Res> {
  _$LessonTimeBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonTimeBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? abbr = freezed,
    Object? mins = freezed,
    Object? openRestriction = freezed,
    Object? unavailableLessonStart = freezed,
  }) {
    return _then(_value.copyWith(
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
      abbr: freezed == abbr
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      mins: freezed == mins
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as String?,
      openRestriction: freezed == openRestriction
          ? _value.openRestriction
          : openRestriction // ignore: cast_nullable_to_non_nullable
              as int?,
      unavailableLessonStart: freezed == unavailableLessonStart
          ? _value.unavailableLessonStart
          : unavailableLessonStart // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonTimeBeanImplCopyWith<$Res>
    implements $LessonTimeBeanCopyWith<$Res> {
  factory _$$LessonTimeBeanImplCopyWith(_$LessonTimeBeanImpl value,
          $Res Function(_$LessonTimeBeanImpl) then) =
      __$$LessonTimeBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? label,
      String? name,
      String? abbr,
      String? mins,
      int? openRestriction,
      List<int>? unavailableLessonStart});
}

/// @nodoc
class __$$LessonTimeBeanImplCopyWithImpl<$Res>
    extends _$LessonTimeBeanCopyWithImpl<$Res, _$LessonTimeBeanImpl>
    implements _$$LessonTimeBeanImplCopyWith<$Res> {
  __$$LessonTimeBeanImplCopyWithImpl(
      _$LessonTimeBeanImpl _value, $Res Function(_$LessonTimeBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonTimeBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? abbr = freezed,
    Object? mins = freezed,
    Object? openRestriction = freezed,
    Object? unavailableLessonStart = freezed,
  }) {
    return _then(_$LessonTimeBeanImpl(
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
      abbr: freezed == abbr
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      mins: freezed == mins
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as String?,
      openRestriction: freezed == openRestriction
          ? _value.openRestriction
          : openRestriction // ignore: cast_nullable_to_non_nullable
              as int?,
      unavailableLessonStart: freezed == unavailableLessonStart
          ? _value._unavailableLessonStart
          : unavailableLessonStart // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonTimeBeanImpl implements _LessonTimeBean {
  const _$LessonTimeBeanImpl(
      {this.id,
      this.label,
      this.name,
      this.abbr,
      this.mins,
      this.openRestriction,
      final List<int>? unavailableLessonStart})
      : _unavailableLessonStart = unavailableLessonStart;

  factory _$LessonTimeBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonTimeBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final String? abbr;
  @override
  final String? mins;
  @override
  final int? openRestriction;
  final List<int>? _unavailableLessonStart;
  @override
  List<int>? get unavailableLessonStart {
    final value = _unavailableLessonStart;
    if (value == null) return null;
    if (_unavailableLessonStart is EqualUnmodifiableListView)
      return _unavailableLessonStart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonTimeBean(id: $id, label: $label, name: $name, abbr: $abbr, mins: $mins, openRestriction: $openRestriction, unavailableLessonStart: $unavailableLessonStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonTimeBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.abbr, abbr) || other.abbr == abbr) &&
            (identical(other.mins, mins) || other.mins == mins) &&
            (identical(other.openRestriction, openRestriction) ||
                other.openRestriction == openRestriction) &&
            const DeepCollectionEquality().equals(
                other._unavailableLessonStart, _unavailableLessonStart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      name,
      abbr,
      mins,
      openRestriction,
      const DeepCollectionEquality().hash(_unavailableLessonStart));

  /// Create a copy of LessonTimeBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonTimeBeanImplCopyWith<_$LessonTimeBeanImpl> get copyWith =>
      __$$LessonTimeBeanImplCopyWithImpl<_$LessonTimeBeanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonTimeBeanImplToJson(
      this,
    );
  }
}

abstract class _LessonTimeBean implements LessonTimeBean {
  const factory _LessonTimeBean(
      {final int? id,
      final String? label,
      final String? name,
      final String? abbr,
      final String? mins,
      final int? openRestriction,
      final List<int>? unavailableLessonStart}) = _$LessonTimeBeanImpl;

  factory _LessonTimeBean.fromJson(Map<String, dynamic> json) =
      _$LessonTimeBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get name;
  @override
  String? get abbr;
  @override
  String? get mins;
  @override
  int? get openRestriction;
  @override
  List<int>? get unavailableLessonStart;

  /// Create a copy of LessonTimeBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonTimeBeanImplCopyWith<_$LessonTimeBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonTimeList _$LessonTimeListFromJson(Map<String, dynamic> json) {
  return _LessonTimeList.fromJson(json);
}

/// @nodoc
mixin _$LessonTimeList {
  List<LessonTimeBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this LessonTimeList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonTimeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonTimeListCopyWith<LessonTimeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonTimeListCopyWith<$Res> {
  factory $LessonTimeListCopyWith(
          LessonTimeList value, $Res Function(LessonTimeList) then) =
      _$LessonTimeListCopyWithImpl<$Res, LessonTimeList>;
  @useResult
  $Res call({List<LessonTimeBean>? data});
}

/// @nodoc
class _$LessonTimeListCopyWithImpl<$Res, $Val extends LessonTimeList>
    implements $LessonTimeListCopyWith<$Res> {
  _$LessonTimeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonTimeList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LessonTimeBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonTimeListImplCopyWith<$Res>
    implements $LessonTimeListCopyWith<$Res> {
  factory _$$LessonTimeListImplCopyWith(_$LessonTimeListImpl value,
          $Res Function(_$LessonTimeListImpl) then) =
      __$$LessonTimeListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LessonTimeBean>? data});
}

/// @nodoc
class __$$LessonTimeListImplCopyWithImpl<$Res>
    extends _$LessonTimeListCopyWithImpl<$Res, _$LessonTimeListImpl>
    implements _$$LessonTimeListImplCopyWith<$Res> {
  __$$LessonTimeListImplCopyWithImpl(
      _$LessonTimeListImpl _value, $Res Function(_$LessonTimeListImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonTimeList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LessonTimeListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LessonTimeBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonTimeListImpl implements _LessonTimeList {
  const _$LessonTimeListImpl({final List<LessonTimeBean>? data}) : _data = data;

  factory _$LessonTimeListImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonTimeListImplFromJson(json);

  final List<LessonTimeBean>? _data;
  @override
  List<LessonTimeBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LessonTimeList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonTimeListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of LessonTimeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonTimeListImplCopyWith<_$LessonTimeListImpl> get copyWith =>
      __$$LessonTimeListImplCopyWithImpl<_$LessonTimeListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonTimeListImplToJson(
      this,
    );
  }
}

abstract class _LessonTimeList implements LessonTimeList {
  const factory _LessonTimeList({final List<LessonTimeBean>? data}) =
      _$LessonTimeListImpl;

  factory _LessonTimeList.fromJson(Map<String, dynamic> json) =
      _$LessonTimeListImpl.fromJson;

  @override
  List<LessonTimeBean>? get data;

  /// Create a copy of LessonTimeList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonTimeListImplCopyWith<_$LessonTimeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
