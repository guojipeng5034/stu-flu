// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointsBean _$PointsBeanFromJson(Map<String, dynamic> json) {
  return _PointsBean.fromJson(json);
}

/// @nodoc
mixin _$PointsBean {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  String? get perMin => throw _privateConstructorUsedError;

  /// Serializes this PointsBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointsBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsBeanCopyWith<PointsBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsBeanCopyWith<$Res> {
  factory $PointsBeanCopyWith(
          PointsBean value, $Res Function(PointsBean) then) =
      _$PointsBeanCopyWithImpl<$Res, PointsBean>;
  @useResult
  $Res call({int? id, String? name, int? points, String? perMin});
}

/// @nodoc
class _$PointsBeanCopyWithImpl<$Res, $Val extends PointsBean>
    implements $PointsBeanCopyWith<$Res> {
  _$PointsBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? points = freezed,
    Object? perMin = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      perMin: freezed == perMin
          ? _value.perMin
          : perMin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsBeanImplCopyWith<$Res>
    implements $PointsBeanCopyWith<$Res> {
  factory _$$PointsBeanImplCopyWith(
          _$PointsBeanImpl value, $Res Function(_$PointsBeanImpl) then) =
      __$$PointsBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, int? points, String? perMin});
}

/// @nodoc
class __$$PointsBeanImplCopyWithImpl<$Res>
    extends _$PointsBeanCopyWithImpl<$Res, _$PointsBeanImpl>
    implements _$$PointsBeanImplCopyWith<$Res> {
  __$$PointsBeanImplCopyWithImpl(
      _$PointsBeanImpl _value, $Res Function(_$PointsBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? points = freezed,
    Object? perMin = freezed,
  }) {
    return _then(_$PointsBeanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      perMin: freezed == perMin
          ? _value.perMin
          : perMin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsBeanImpl implements _PointsBean {
  const _$PointsBeanImpl({this.id, this.name, this.points, this.perMin});

  factory _$PointsBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? points;
  @override
  final String? perMin;

  @override
  String toString() {
    return 'PointsBean(id: $id, name: $name, points: $points, perMin: $perMin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.perMin, perMin) || other.perMin == perMin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, points, perMin);

  /// Create a copy of PointsBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsBeanImplCopyWith<_$PointsBeanImpl> get copyWith =>
      __$$PointsBeanImplCopyWithImpl<_$PointsBeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsBeanImplToJson(
      this,
    );
  }
}

abstract class _PointsBean implements PointsBean {
  const factory _PointsBean(
      {final int? id,
      final String? name,
      final int? points,
      final String? perMin}) = _$PointsBeanImpl;

  factory _PointsBean.fromJson(Map<String, dynamic> json) =
      _$PointsBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get points;
  @override
  String? get perMin;

  /// Create a copy of PointsBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsBeanImplCopyWith<_$PointsBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointsList _$PointsListFromJson(Map<String, dynamic> json) {
  return _PointsList.fromJson(json);
}

/// @nodoc
mixin _$PointsList {
  List<PointsBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this PointsList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsListCopyWith<PointsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsListCopyWith<$Res> {
  factory $PointsListCopyWith(
          PointsList value, $Res Function(PointsList) then) =
      _$PointsListCopyWithImpl<$Res, PointsList>;
  @useResult
  $Res call({List<PointsBean>? data});
}

/// @nodoc
class _$PointsListCopyWithImpl<$Res, $Val extends PointsList>
    implements $PointsListCopyWith<$Res> {
  _$PointsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsList
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
              as List<PointsBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsListImplCopyWith<$Res>
    implements $PointsListCopyWith<$Res> {
  factory _$$PointsListImplCopyWith(
          _$PointsListImpl value, $Res Function(_$PointsListImpl) then) =
      __$$PointsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PointsBean>? data});
}

/// @nodoc
class __$$PointsListImplCopyWithImpl<$Res>
    extends _$PointsListCopyWithImpl<$Res, _$PointsListImpl>
    implements _$$PointsListImplCopyWith<$Res> {
  __$$PointsListImplCopyWithImpl(
      _$PointsListImpl _value, $Res Function(_$PointsListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$PointsListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PointsBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsListImpl implements _PointsList {
  const _$PointsListImpl({final List<PointsBean>? data}) : _data = data;

  factory _$PointsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsListImplFromJson(json);

  final List<PointsBean>? _data;
  @override
  List<PointsBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PointsList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of PointsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsListImplCopyWith<_$PointsListImpl> get copyWith =>
      __$$PointsListImplCopyWithImpl<_$PointsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsListImplToJson(
      this,
    );
  }
}

abstract class _PointsList implements PointsList {
  const factory _PointsList({final List<PointsBean>? data}) = _$PointsListImpl;

  factory _PointsList.fromJson(Map<String, dynamic> json) =
      _$PointsListImpl.fromJson;

  @override
  List<PointsBean>? get data;

  /// Create a copy of PointsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsListImplCopyWith<_$PointsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
