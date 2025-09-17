// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicable_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicableUser _$ApplicableUserFromJson(Map<String, dynamic> json) {
  return _ApplicableUser.fromJson(json);
}

/// @nodoc
mixin _$ApplicableUser {
  String? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ApplicableUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicableUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicableUserCopyWith<ApplicableUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicableUserCopyWith<$Res> {
  factory $ApplicableUserCopyWith(
          ApplicableUser value, $Res Function(ApplicableUser) then) =
      _$ApplicableUserCopyWithImpl<$Res, ApplicableUser>;
  @useResult
  $Res call({String? id, String? label, String? name});
}

/// @nodoc
class _$ApplicableUserCopyWithImpl<$Res, $Val extends ApplicableUser>
    implements $ApplicableUserCopyWith<$Res> {
  _$ApplicableUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicableUser
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
              as String?,
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
abstract class _$$ApplicableUserImplCopyWith<$Res>
    implements $ApplicableUserCopyWith<$Res> {
  factory _$$ApplicableUserImplCopyWith(_$ApplicableUserImpl value,
          $Res Function(_$ApplicableUserImpl) then) =
      __$$ApplicableUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? label, String? name});
}

/// @nodoc
class __$$ApplicableUserImplCopyWithImpl<$Res>
    extends _$ApplicableUserCopyWithImpl<$Res, _$ApplicableUserImpl>
    implements _$$ApplicableUserImplCopyWith<$Res> {
  __$$ApplicableUserImplCopyWithImpl(
      _$ApplicableUserImpl _value, $Res Function(_$ApplicableUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicableUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ApplicableUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ApplicableUserImpl implements _ApplicableUser {
  const _$ApplicableUserImpl({this.id, this.label, this.name});

  factory _$ApplicableUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicableUserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? label;
  @override
  final String? name;

  @override
  String toString() {
    return 'ApplicableUser(id: $id, label: $label, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicableUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, name);

  /// Create a copy of ApplicableUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicableUserImplCopyWith<_$ApplicableUserImpl> get copyWith =>
      __$$ApplicableUserImplCopyWithImpl<_$ApplicableUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicableUserImplToJson(
      this,
    );
  }
}

abstract class _ApplicableUser implements ApplicableUser {
  const factory _ApplicableUser(
      {final String? id,
      final String? label,
      final String? name}) = _$ApplicableUserImpl;

  factory _ApplicableUser.fromJson(Map<String, dynamic> json) =
      _$ApplicableUserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get label;
  @override
  String? get name;

  /// Create a copy of ApplicableUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicableUserImplCopyWith<_$ApplicableUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
