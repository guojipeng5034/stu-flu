// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_lang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportLang _$SupportLangFromJson(Map<String, dynamic> json) {
  return _SupportLang.fromJson(json);
}

/// @nodoc
mixin _$SupportLang {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get showName => throw _privateConstructorUsedError;

  /// Serializes this SupportLang to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportLang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportLangCopyWith<SupportLang> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportLangCopyWith<$Res> {
  factory $SupportLangCopyWith(
          SupportLang value, $Res Function(SupportLang) then) =
      _$SupportLangCopyWithImpl<$Res, SupportLang>;
  @useResult
  $Res call({String? key, String? name, String? showName});
}

/// @nodoc
class _$SupportLangCopyWithImpl<$Res, $Val extends SupportLang>
    implements $SupportLangCopyWith<$Res> {
  _$SupportLangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportLang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? showName = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      showName: freezed == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportLangImplCopyWith<$Res>
    implements $SupportLangCopyWith<$Res> {
  factory _$$SupportLangImplCopyWith(
          _$SupportLangImpl value, $Res Function(_$SupportLangImpl) then) =
      __$$SupportLangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? name, String? showName});
}

/// @nodoc
class __$$SupportLangImplCopyWithImpl<$Res>
    extends _$SupportLangCopyWithImpl<$Res, _$SupportLangImpl>
    implements _$$SupportLangImplCopyWith<$Res> {
  __$$SupportLangImplCopyWithImpl(
      _$SupportLangImpl _value, $Res Function(_$SupportLangImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportLang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? showName = freezed,
  }) {
    return _then(_$SupportLangImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      showName: freezed == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportLangImpl implements _SupportLang {
  const _$SupportLangImpl({this.key, this.name, this.showName});

  factory _$SupportLangImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportLangImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? showName;

  @override
  String toString() {
    return 'SupportLang(key: $key, name: $name, showName: $showName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportLangImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.showName, showName) ||
                other.showName == showName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, showName);

  /// Create a copy of SupportLang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportLangImplCopyWith<_$SupportLangImpl> get copyWith =>
      __$$SupportLangImplCopyWithImpl<_$SupportLangImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportLangImplToJson(
      this,
    );
  }
}

abstract class _SupportLang implements SupportLang {
  const factory _SupportLang(
      {final String? key,
      final String? name,
      final String? showName}) = _$SupportLangImpl;

  factory _SupportLang.fromJson(Map<String, dynamic> json) =
      _$SupportLangImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  String? get showName;

  /// Create a copy of SupportLang
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportLangImplCopyWith<_$SupportLangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
