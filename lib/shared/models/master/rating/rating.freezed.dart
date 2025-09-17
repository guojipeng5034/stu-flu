// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RatingBean _$RatingBeanFromJson(Map<String, dynamic> json) {
  return _RatingBean.fromJson(json);
}

/// @nodoc
mixin _$RatingBean {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  /// Serializes this RatingBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingBeanCopyWith<RatingBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingBeanCopyWith<$Res> {
  factory $RatingBeanCopyWith(
          RatingBean value, $Res Function(RatingBean) then) =
      _$RatingBeanCopyWithImpl<$Res, RatingBean>;
  @useResult
  $Res call(
      {int? id, String? label, String? name, String? description, int? value});
}

/// @nodoc
class _$RatingBeanCopyWithImpl<$Res, $Val extends RatingBean>
    implements $RatingBeanCopyWith<$Res> {
  _$RatingBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingBeanImplCopyWith<$Res>
    implements $RatingBeanCopyWith<$Res> {
  factory _$$RatingBeanImplCopyWith(
          _$RatingBeanImpl value, $Res Function(_$RatingBeanImpl) then) =
      __$$RatingBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? label, String? name, String? description, int? value});
}

/// @nodoc
class __$$RatingBeanImplCopyWithImpl<$Res>
    extends _$RatingBeanCopyWithImpl<$Res, _$RatingBeanImpl>
    implements _$$RatingBeanImplCopyWith<$Res> {
  __$$RatingBeanImplCopyWithImpl(
      _$RatingBeanImpl _value, $Res Function(_$RatingBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
  }) {
    return _then(_$RatingBeanImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingBeanImpl implements _RatingBean {
  const _$RatingBeanImpl(
      {this.id, this.label, this.name, this.description, this.value});

  factory _$RatingBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? value;

  @override
  String toString() {
    return 'RatingBean(id: $id, label: $label, name: $name, description: $description, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, name, description, value);

  /// Create a copy of RatingBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingBeanImplCopyWith<_$RatingBeanImpl> get copyWith =>
      __$$RatingBeanImplCopyWithImpl<_$RatingBeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingBeanImplToJson(
      this,
    );
  }
}

abstract class _RatingBean implements RatingBean {
  const factory _RatingBean(
      {final int? id,
      final String? label,
      final String? name,
      final String? description,
      final int? value}) = _$RatingBeanImpl;

  factory _RatingBean.fromJson(Map<String, dynamic> json) =
      _$RatingBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get value;

  /// Create a copy of RatingBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingBeanImplCopyWith<_$RatingBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingList _$RatingListFromJson(Map<String, dynamic> json) {
  return _RatingList.fromJson(json);
}

/// @nodoc
mixin _$RatingList {
  List<RatingBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this RatingList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingListCopyWith<RatingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingListCopyWith<$Res> {
  factory $RatingListCopyWith(
          RatingList value, $Res Function(RatingList) then) =
      _$RatingListCopyWithImpl<$Res, RatingList>;
  @useResult
  $Res call({List<RatingBean>? data});
}

/// @nodoc
class _$RatingListCopyWithImpl<$Res, $Val extends RatingList>
    implements $RatingListCopyWith<$Res> {
  _$RatingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingList
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
              as List<RatingBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingListImplCopyWith<$Res>
    implements $RatingListCopyWith<$Res> {
  factory _$$RatingListImplCopyWith(
          _$RatingListImpl value, $Res Function(_$RatingListImpl) then) =
      __$$RatingListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RatingBean>? data});
}

/// @nodoc
class __$$RatingListImplCopyWithImpl<$Res>
    extends _$RatingListCopyWithImpl<$Res, _$RatingListImpl>
    implements _$$RatingListImplCopyWith<$Res> {
  __$$RatingListImplCopyWithImpl(
      _$RatingListImpl _value, $Res Function(_$RatingListImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RatingListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RatingBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingListImpl implements _RatingList {
  const _$RatingListImpl({final List<RatingBean>? data}) : _data = data;

  factory _$RatingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingListImplFromJson(json);

  final List<RatingBean>? _data;
  @override
  List<RatingBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RatingList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RatingList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingListImplCopyWith<_$RatingListImpl> get copyWith =>
      __$$RatingListImplCopyWithImpl<_$RatingListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingListImplToJson(
      this,
    );
  }
}

abstract class _RatingList implements RatingList {
  const factory _RatingList({final List<RatingBean>? data}) = _$RatingListImpl;

  factory _RatingList.fromJson(Map<String, dynamic> json) =
      _$RatingListImpl.fromJson;

  @override
  List<RatingBean>? get data;

  /// Create a copy of RatingList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingListImplCopyWith<_$RatingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
