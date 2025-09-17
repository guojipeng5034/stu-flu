// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenderBean _$GenderBeanFromJson(Map<String, dynamic> json) {
  return _GenderBean.fromJson(json);
}

/// @nodoc
mixin _$GenderBean {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this GenderBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenderBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenderBeanCopyWith<GenderBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderBeanCopyWith<$Res> {
  factory $GenderBeanCopyWith(
          GenderBean value, $Res Function(GenderBean) then) =
      _$GenderBeanCopyWithImpl<$Res, GenderBean>;
  @useResult
  $Res call({int? id, String? label, String? name});
}

/// @nodoc
class _$GenderBeanCopyWithImpl<$Res, $Val extends GenderBean>
    implements $GenderBeanCopyWith<$Res> {
  _$GenderBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenderBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderBeanImplCopyWith<$Res>
    implements $GenderBeanCopyWith<$Res> {
  factory _$$GenderBeanImplCopyWith(
          _$GenderBeanImpl value, $Res Function(_$GenderBeanImpl) then) =
      __$$GenderBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? label, String? name});
}

/// @nodoc
class __$$GenderBeanImplCopyWithImpl<$Res>
    extends _$GenderBeanCopyWithImpl<$Res, _$GenderBeanImpl>
    implements _$$GenderBeanImplCopyWith<$Res> {
  __$$GenderBeanImplCopyWithImpl(
      _$GenderBeanImpl _value, $Res Function(_$GenderBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenderBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
  }) {
    return _then(_$GenderBeanImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenderBeanImpl implements _GenderBean {
  const _$GenderBeanImpl({this.id, this.label, this.name});

  factory _$GenderBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? name;

  @override
  String toString() {
    return 'GenderBean(id: $id, label: $label, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, name);

  /// Create a copy of GenderBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderBeanImplCopyWith<_$GenderBeanImpl> get copyWith =>
      __$$GenderBeanImplCopyWithImpl<_$GenderBeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderBeanImplToJson(
      this,
    );
  }
}

abstract class _GenderBean implements GenderBean {
  const factory _GenderBean(
      {final int? id,
      final String? label,
      final String? name}) = _$GenderBeanImpl;

  factory _GenderBean.fromJson(Map<String, dynamic> json) =
      _$GenderBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get name;

  /// Create a copy of GenderBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenderBeanImplCopyWith<_$GenderBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenderList _$GenderListFromJson(Map<String, dynamic> json) {
  return _GenderList.fromJson(json);
}

/// @nodoc
mixin _$GenderList {
  List<GenderBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this GenderList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenderListCopyWith<GenderList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderListCopyWith<$Res> {
  factory $GenderListCopyWith(
          GenderList value, $Res Function(GenderList) then) =
      _$GenderListCopyWithImpl<$Res, GenderList>;
  @useResult
  $Res call({List<GenderBean>? data});
}

/// @nodoc
class _$GenderListCopyWithImpl<$Res, $Val extends GenderList>
    implements $GenderListCopyWith<$Res> {
  _$GenderListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenderList
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
              as List<GenderBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderListImplCopyWith<$Res>
    implements $GenderListCopyWith<$Res> {
  factory _$$GenderListImplCopyWith(
          _$GenderListImpl value, $Res Function(_$GenderListImpl) then) =
      __$$GenderListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GenderBean>? data});
}

/// @nodoc
class __$$GenderListImplCopyWithImpl<$Res>
    extends _$GenderListCopyWithImpl<$Res, _$GenderListImpl>
    implements _$$GenderListImplCopyWith<$Res> {
  __$$GenderListImplCopyWithImpl(
      _$GenderListImpl _value, $Res Function(_$GenderListImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenderList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GenderListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GenderBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenderListImpl implements _GenderList {
  const _$GenderListImpl({final List<GenderBean>? data}) : _data = data;

  factory _$GenderListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderListImplFromJson(json);

  final List<GenderBean>? _data;
  @override
  List<GenderBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenderList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of GenderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderListImplCopyWith<_$GenderListImpl> get copyWith =>
      __$$GenderListImplCopyWithImpl<_$GenderListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderListImplToJson(
      this,
    );
  }
}

abstract class _GenderList implements GenderList {
  const factory _GenderList({final List<GenderBean>? data}) = _$GenderListImpl;

  factory _GenderList.fromJson(Map<String, dynamic> json) =
      _$GenderListImpl.fromJson;

  @override
  List<GenderBean>? get data;

  /// Create a copy of GenderList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenderListImplCopyWith<_$GenderListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
