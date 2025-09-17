// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timezone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeZoneBean _$TimeZoneBeanFromJson(Map<String, dynamic> json) {
  return _TimeZoneBean.fromJson(json);
}

/// @nodoc
mixin _$TimeZoneBean {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get offset => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this TimeZoneBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeZoneBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeZoneBeanCopyWith<TimeZoneBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeZoneBeanCopyWith<$Res> {
  factory $TimeZoneBeanCopyWith(
          TimeZoneBean value, $Res Function(TimeZoneBean) then) =
      _$TimeZoneBeanCopyWithImpl<$Res, TimeZoneBean>;
  @useResult
  $Res call({int? id, String? label, String? offset, String? name});
}

/// @nodoc
class _$TimeZoneBeanCopyWithImpl<$Res, $Val extends TimeZoneBean>
    implements $TimeZoneBeanCopyWith<$Res> {
  _$TimeZoneBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeZoneBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? offset = freezed,
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
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeZoneBeanImplCopyWith<$Res>
    implements $TimeZoneBeanCopyWith<$Res> {
  factory _$$TimeZoneBeanImplCopyWith(
          _$TimeZoneBeanImpl value, $Res Function(_$TimeZoneBeanImpl) then) =
      __$$TimeZoneBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? label, String? offset, String? name});
}

/// @nodoc
class __$$TimeZoneBeanImplCopyWithImpl<$Res>
    extends _$TimeZoneBeanCopyWithImpl<$Res, _$TimeZoneBeanImpl>
    implements _$$TimeZoneBeanImplCopyWith<$Res> {
  __$$TimeZoneBeanImplCopyWithImpl(
      _$TimeZoneBeanImpl _value, $Res Function(_$TimeZoneBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeZoneBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? offset = freezed,
    Object? name = freezed,
  }) {
    return _then(_$TimeZoneBeanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
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
class _$TimeZoneBeanImpl implements _TimeZoneBean {
  const _$TimeZoneBeanImpl({this.id, this.label, this.offset, this.name});

  factory _$TimeZoneBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeZoneBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? offset;
  @override
  final String? name;

  @override
  String toString() {
    return 'TimeZoneBean(id: $id, label: $label, offset: $offset, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeZoneBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, offset, name);

  /// Create a copy of TimeZoneBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeZoneBeanImplCopyWith<_$TimeZoneBeanImpl> get copyWith =>
      __$$TimeZoneBeanImplCopyWithImpl<_$TimeZoneBeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeZoneBeanImplToJson(
      this,
    );
  }
}

abstract class _TimeZoneBean implements TimeZoneBean {
  const factory _TimeZoneBean(
      {final int? id,
      final String? label,
      final String? offset,
      final String? name}) = _$TimeZoneBeanImpl;

  factory _TimeZoneBean.fromJson(Map<String, dynamic> json) =
      _$TimeZoneBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get offset;
  @override
  String? get name;

  /// Create a copy of TimeZoneBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeZoneBeanImplCopyWith<_$TimeZoneBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeZoneList _$TimeZoneListFromJson(Map<String, dynamic> json) {
  return _TimeZoneList.fromJson(json);
}

/// @nodoc
mixin _$TimeZoneList {
  @JsonKey(name: 'TimeZone')
  List<TimeZoneBean>? get timeZone => throw _privateConstructorUsedError;

  /// Serializes this TimeZoneList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeZoneList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeZoneListCopyWith<TimeZoneList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeZoneListCopyWith<$Res> {
  factory $TimeZoneListCopyWith(
          TimeZoneList value, $Res Function(TimeZoneList) then) =
      _$TimeZoneListCopyWithImpl<$Res, TimeZoneList>;
  @useResult
  $Res call({@JsonKey(name: 'TimeZone') List<TimeZoneBean>? timeZone});
}

/// @nodoc
class _$TimeZoneListCopyWithImpl<$Res, $Val extends TimeZoneList>
    implements $TimeZoneListCopyWith<$Res> {
  _$TimeZoneListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeZoneList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeZone = freezed,
  }) {
    return _then(_value.copyWith(
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as List<TimeZoneBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeZoneListImplCopyWith<$Res>
    implements $TimeZoneListCopyWith<$Res> {
  factory _$$TimeZoneListImplCopyWith(
          _$TimeZoneListImpl value, $Res Function(_$TimeZoneListImpl) then) =
      __$$TimeZoneListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TimeZone') List<TimeZoneBean>? timeZone});
}

/// @nodoc
class __$$TimeZoneListImplCopyWithImpl<$Res>
    extends _$TimeZoneListCopyWithImpl<$Res, _$TimeZoneListImpl>
    implements _$$TimeZoneListImplCopyWith<$Res> {
  __$$TimeZoneListImplCopyWithImpl(
      _$TimeZoneListImpl _value, $Res Function(_$TimeZoneListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeZoneList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeZone = freezed,
  }) {
    return _then(_$TimeZoneListImpl(
      timeZone: freezed == timeZone
          ? _value._timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as List<TimeZoneBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeZoneListImpl implements _TimeZoneList {
  const _$TimeZoneListImpl(
      {@JsonKey(name: 'TimeZone') final List<TimeZoneBean>? timeZone})
      : _timeZone = timeZone;

  factory _$TimeZoneListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeZoneListImplFromJson(json);

  final List<TimeZoneBean>? _timeZone;
  @override
  @JsonKey(name: 'TimeZone')
  List<TimeZoneBean>? get timeZone {
    final value = _timeZone;
    if (value == null) return null;
    if (_timeZone is EqualUnmodifiableListView) return _timeZone;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TimeZoneList(timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeZoneListImpl &&
            const DeepCollectionEquality().equals(other._timeZone, _timeZone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_timeZone));

  /// Create a copy of TimeZoneList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeZoneListImplCopyWith<_$TimeZoneListImpl> get copyWith =>
      __$$TimeZoneListImplCopyWithImpl<_$TimeZoneListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeZoneListImplToJson(
      this,
    );
  }
}

abstract class _TimeZoneList implements TimeZoneList {
  const factory _TimeZoneList(
          {@JsonKey(name: 'TimeZone') final List<TimeZoneBean>? timeZone}) =
      _$TimeZoneListImpl;

  factory _TimeZoneList.fromJson(Map<String, dynamic> json) =
      _$TimeZoneListImpl.fromJson;

  @override
  @JsonKey(name: 'TimeZone')
  List<TimeZoneBean>? get timeZone;

  /// Create a copy of TimeZoneList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeZoneListImplCopyWith<_$TimeZoneListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
