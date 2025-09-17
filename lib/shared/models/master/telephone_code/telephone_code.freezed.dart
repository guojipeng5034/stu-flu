// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telephone_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TelephoneCodeBean _$TelephoneCodeBeanFromJson(Map<String, dynamic> json) {
  return _TelephoneCodeBean.fromJson(json);
}

/// @nodoc
mixin _$TelephoneCodeBean {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this TelephoneCodeBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TelephoneCodeBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TelephoneCodeBeanCopyWith<TelephoneCodeBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelephoneCodeBeanCopyWith<$Res> {
  factory $TelephoneCodeBeanCopyWith(
          TelephoneCodeBean value, $Res Function(TelephoneCodeBean) then) =
      _$TelephoneCodeBeanCopyWithImpl<$Res, TelephoneCodeBean>;
  @useResult
  $Res call({String? code, String? name, String? country});
}

/// @nodoc
class _$TelephoneCodeBeanCopyWithImpl<$Res, $Val extends TelephoneCodeBean>
    implements $TelephoneCodeBeanCopyWith<$Res> {
  _$TelephoneCodeBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TelephoneCodeBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TelephoneCodeBeanImplCopyWith<$Res>
    implements $TelephoneCodeBeanCopyWith<$Res> {
  factory _$$TelephoneCodeBeanImplCopyWith(_$TelephoneCodeBeanImpl value,
          $Res Function(_$TelephoneCodeBeanImpl) then) =
      __$$TelephoneCodeBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? name, String? country});
}

/// @nodoc
class __$$TelephoneCodeBeanImplCopyWithImpl<$Res>
    extends _$TelephoneCodeBeanCopyWithImpl<$Res, _$TelephoneCodeBeanImpl>
    implements _$$TelephoneCodeBeanImplCopyWith<$Res> {
  __$$TelephoneCodeBeanImplCopyWithImpl(_$TelephoneCodeBeanImpl _value,
      $Res Function(_$TelephoneCodeBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TelephoneCodeBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? country = freezed,
  }) {
    return _then(_$TelephoneCodeBeanImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TelephoneCodeBeanImpl implements _TelephoneCodeBean {
  const _$TelephoneCodeBeanImpl({this.code, this.name, this.country});

  factory _$TelephoneCodeBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$TelephoneCodeBeanImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? country;

  @override
  String toString() {
    return 'TelephoneCodeBean(code: $code, name: $name, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelephoneCodeBeanImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, country);

  /// Create a copy of TelephoneCodeBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TelephoneCodeBeanImplCopyWith<_$TelephoneCodeBeanImpl> get copyWith =>
      __$$TelephoneCodeBeanImplCopyWithImpl<_$TelephoneCodeBeanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TelephoneCodeBeanImplToJson(
      this,
    );
  }
}

abstract class _TelephoneCodeBean implements TelephoneCodeBean {
  const factory _TelephoneCodeBean(
      {final String? code,
      final String? name,
      final String? country}) = _$TelephoneCodeBeanImpl;

  factory _TelephoneCodeBean.fromJson(Map<String, dynamic> json) =
      _$TelephoneCodeBeanImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get country;

  /// Create a copy of TelephoneCodeBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TelephoneCodeBeanImplCopyWith<_$TelephoneCodeBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TelephoneCodeList _$TelephoneCodeListFromJson(Map<String, dynamic> json) {
  return _TelephoneCodeList.fromJson(json);
}

/// @nodoc
mixin _$TelephoneCodeList {
  List<TelephoneCodeBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this TelephoneCodeList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TelephoneCodeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TelephoneCodeListCopyWith<TelephoneCodeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelephoneCodeListCopyWith<$Res> {
  factory $TelephoneCodeListCopyWith(
          TelephoneCodeList value, $Res Function(TelephoneCodeList) then) =
      _$TelephoneCodeListCopyWithImpl<$Res, TelephoneCodeList>;
  @useResult
  $Res call({List<TelephoneCodeBean>? data});
}

/// @nodoc
class _$TelephoneCodeListCopyWithImpl<$Res, $Val extends TelephoneCodeList>
    implements $TelephoneCodeListCopyWith<$Res> {
  _$TelephoneCodeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TelephoneCodeList
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
              as List<TelephoneCodeBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TelephoneCodeListImplCopyWith<$Res>
    implements $TelephoneCodeListCopyWith<$Res> {
  factory _$$TelephoneCodeListImplCopyWith(_$TelephoneCodeListImpl value,
          $Res Function(_$TelephoneCodeListImpl) then) =
      __$$TelephoneCodeListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TelephoneCodeBean>? data});
}

/// @nodoc
class __$$TelephoneCodeListImplCopyWithImpl<$Res>
    extends _$TelephoneCodeListCopyWithImpl<$Res, _$TelephoneCodeListImpl>
    implements _$$TelephoneCodeListImplCopyWith<$Res> {
  __$$TelephoneCodeListImplCopyWithImpl(_$TelephoneCodeListImpl _value,
      $Res Function(_$TelephoneCodeListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TelephoneCodeList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TelephoneCodeListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TelephoneCodeBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TelephoneCodeListImpl implements _TelephoneCodeList {
  const _$TelephoneCodeListImpl({final List<TelephoneCodeBean>? data})
      : _data = data;

  factory _$TelephoneCodeListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TelephoneCodeListImplFromJson(json);

  final List<TelephoneCodeBean>? _data;
  @override
  List<TelephoneCodeBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TelephoneCodeList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelephoneCodeListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TelephoneCodeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TelephoneCodeListImplCopyWith<_$TelephoneCodeListImpl> get copyWith =>
      __$$TelephoneCodeListImplCopyWithImpl<_$TelephoneCodeListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TelephoneCodeListImplToJson(
      this,
    );
  }
}

abstract class _TelephoneCodeList implements TelephoneCodeList {
  const factory _TelephoneCodeList({final List<TelephoneCodeBean>? data}) =
      _$TelephoneCodeListImpl;

  factory _TelephoneCodeList.fromJson(Map<String, dynamic> json) =
      _$TelephoneCodeListImpl.fromJson;

  @override
  List<TelephoneCodeBean>? get data;

  /// Create a copy of TelephoneCodeList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TelephoneCodeListImplCopyWith<_$TelephoneCodeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
