// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestCategoryBean _$RequestCategoryBeanFromJson(Map<String, dynamic> json) {
  return _RequestCategoryBean.fromJson(json);
}

/// @nodoc
mixin _$RequestCategoryBean {
  int? get id => throw _privateConstructorUsedError;
  int? get mappingIndex => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this RequestCategoryBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCategoryBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCategoryBeanCopyWith<RequestCategoryBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCategoryBeanCopyWith<$Res> {
  factory $RequestCategoryBeanCopyWith(
          RequestCategoryBean value, $Res Function(RequestCategoryBean) then) =
      _$RequestCategoryBeanCopyWithImpl<$Res, RequestCategoryBean>;
  @useResult
  $Res call({int? id, int? mappingIndex, String? name});
}

/// @nodoc
class _$RequestCategoryBeanCopyWithImpl<$Res, $Val extends RequestCategoryBean>
    implements $RequestCategoryBeanCopyWith<$Res> {
  _$RequestCategoryBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCategoryBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mappingIndex = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mappingIndex: freezed == mappingIndex
          ? _value.mappingIndex
          : mappingIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCategoryBeanImplCopyWith<$Res>
    implements $RequestCategoryBeanCopyWith<$Res> {
  factory _$$RequestCategoryBeanImplCopyWith(_$RequestCategoryBeanImpl value,
          $Res Function(_$RequestCategoryBeanImpl) then) =
      __$$RequestCategoryBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? mappingIndex, String? name});
}

/// @nodoc
class __$$RequestCategoryBeanImplCopyWithImpl<$Res>
    extends _$RequestCategoryBeanCopyWithImpl<$Res, _$RequestCategoryBeanImpl>
    implements _$$RequestCategoryBeanImplCopyWith<$Res> {
  __$$RequestCategoryBeanImplCopyWithImpl(_$RequestCategoryBeanImpl _value,
      $Res Function(_$RequestCategoryBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCategoryBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mappingIndex = freezed,
    Object? name = freezed,
  }) {
    return _then(_$RequestCategoryBeanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mappingIndex: freezed == mappingIndex
          ? _value.mappingIndex
          : mappingIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestCategoryBeanImpl implements _RequestCategoryBean {
  const _$RequestCategoryBeanImpl({this.id, this.mappingIndex, this.name});

  factory _$RequestCategoryBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestCategoryBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final int? mappingIndex;
  @override
  final String? name;

  @override
  String toString() {
    return 'RequestCategoryBean(id: $id, mappingIndex: $mappingIndex, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCategoryBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mappingIndex, mappingIndex) ||
                other.mappingIndex == mappingIndex) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mappingIndex, name);

  /// Create a copy of RequestCategoryBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCategoryBeanImplCopyWith<_$RequestCategoryBeanImpl> get copyWith =>
      __$$RequestCategoryBeanImplCopyWithImpl<_$RequestCategoryBeanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestCategoryBeanImplToJson(
      this,
    );
  }
}

abstract class _RequestCategoryBean implements RequestCategoryBean {
  const factory _RequestCategoryBean(
      {final int? id,
      final int? mappingIndex,
      final String? name}) = _$RequestCategoryBeanImpl;

  factory _RequestCategoryBean.fromJson(Map<String, dynamic> json) =
      _$RequestCategoryBeanImpl.fromJson;

  @override
  int? get id;
  @override
  int? get mappingIndex;
  @override
  String? get name;

  /// Create a copy of RequestCategoryBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestCategoryBeanImplCopyWith<_$RequestCategoryBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestCategoryList _$RequestCategoryListFromJson(Map<String, dynamic> json) {
  return _RequestCategoryList.fromJson(json);
}

/// @nodoc
mixin _$RequestCategoryList {
  List<RequestCategoryBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this RequestCategoryList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCategoryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCategoryListCopyWith<RequestCategoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCategoryListCopyWith<$Res> {
  factory $RequestCategoryListCopyWith(
          RequestCategoryList value, $Res Function(RequestCategoryList) then) =
      _$RequestCategoryListCopyWithImpl<$Res, RequestCategoryList>;
  @useResult
  $Res call({List<RequestCategoryBean>? data});
}

/// @nodoc
class _$RequestCategoryListCopyWithImpl<$Res, $Val extends RequestCategoryList>
    implements $RequestCategoryListCopyWith<$Res> {
  _$RequestCategoryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCategoryList
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
              as List<RequestCategoryBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCategoryListImplCopyWith<$Res>
    implements $RequestCategoryListCopyWith<$Res> {
  factory _$$RequestCategoryListImplCopyWith(_$RequestCategoryListImpl value,
          $Res Function(_$RequestCategoryListImpl) then) =
      __$$RequestCategoryListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RequestCategoryBean>? data});
}

/// @nodoc
class __$$RequestCategoryListImplCopyWithImpl<$Res>
    extends _$RequestCategoryListCopyWithImpl<$Res, _$RequestCategoryListImpl>
    implements _$$RequestCategoryListImplCopyWith<$Res> {
  __$$RequestCategoryListImplCopyWithImpl(_$RequestCategoryListImpl _value,
      $Res Function(_$RequestCategoryListImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCategoryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RequestCategoryListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RequestCategoryBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestCategoryListImpl implements _RequestCategoryList {
  const _$RequestCategoryListImpl({final List<RequestCategoryBean>? data})
      : _data = data;

  factory _$RequestCategoryListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestCategoryListImplFromJson(json);

  final List<RequestCategoryBean>? _data;
  @override
  List<RequestCategoryBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RequestCategoryList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCategoryListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RequestCategoryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCategoryListImplCopyWith<_$RequestCategoryListImpl> get copyWith =>
      __$$RequestCategoryListImplCopyWithImpl<_$RequestCategoryListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestCategoryListImplToJson(
      this,
    );
  }
}

abstract class _RequestCategoryList implements RequestCategoryList {
  const factory _RequestCategoryList({final List<RequestCategoryBean>? data}) =
      _$RequestCategoryListImpl;

  factory _RequestCategoryList.fromJson(Map<String, dynamic> json) =
      _$RequestCategoryListImpl.fromJson;

  @override
  List<RequestCategoryBean>? get data;

  /// Create a copy of RequestCategoryList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestCategoryListImplCopyWith<_$RequestCategoryListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
