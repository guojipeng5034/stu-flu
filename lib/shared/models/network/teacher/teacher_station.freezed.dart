// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherStation _$TeacherStationFromJson(Map<String, dynamic> json) {
  return _TeacherStation.fromJson(json);
}

/// @nodoc
mixin _$TeacherStation {
  String? get storey => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this TeacherStation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherStationCopyWith<TeacherStation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherStationCopyWith<$Res> {
  factory $TeacherStationCopyWith(
          TeacherStation value, $Res Function(TeacherStation) then) =
      _$TeacherStationCopyWithImpl<$Res, TeacherStation>;
  @useResult
  $Res call({String? storey, String? name});
}

/// @nodoc
class _$TeacherStationCopyWithImpl<$Res, $Val extends TeacherStation>
    implements $TeacherStationCopyWith<$Res> {
  _$TeacherStationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storey = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      storey: freezed == storey
          ? _value.storey
          : storey // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherStationImplCopyWith<$Res>
    implements $TeacherStationCopyWith<$Res> {
  factory _$$TeacherStationImplCopyWith(_$TeacherStationImpl value,
          $Res Function(_$TeacherStationImpl) then) =
      __$$TeacherStationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? storey, String? name});
}

/// @nodoc
class __$$TeacherStationImplCopyWithImpl<$Res>
    extends _$TeacherStationCopyWithImpl<$Res, _$TeacherStationImpl>
    implements _$$TeacherStationImplCopyWith<$Res> {
  __$$TeacherStationImplCopyWithImpl(
      _$TeacherStationImpl _value, $Res Function(_$TeacherStationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherStation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storey = freezed,
    Object? name = freezed,
  }) {
    return _then(_$TeacherStationImpl(
      storey: freezed == storey
          ? _value.storey
          : storey // ignore: cast_nullable_to_non_nullable
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
class _$TeacherStationImpl implements _TeacherStation {
  const _$TeacherStationImpl({this.storey, this.name});

  factory _$TeacherStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherStationImplFromJson(json);

  @override
  final String? storey;
  @override
  final String? name;

  @override
  String toString() {
    return 'TeacherStation(storey: $storey, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherStationImpl &&
            (identical(other.storey, storey) || other.storey == storey) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, storey, name);

  /// Create a copy of TeacherStation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherStationImplCopyWith<_$TeacherStationImpl> get copyWith =>
      __$$TeacherStationImplCopyWithImpl<_$TeacherStationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherStationImplToJson(
      this,
    );
  }
}

abstract class _TeacherStation implements TeacherStation {
  const factory _TeacherStation({final String? storey, final String? name}) =
      _$TeacherStationImpl;

  factory _TeacherStation.fromJson(Map<String, dynamic> json) =
      _$TeacherStationImpl.fromJson;

  @override
  String? get storey;
  @override
  String? get name;

  /// Create a copy of TeacherStation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherStationImplCopyWith<_$TeacherStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
