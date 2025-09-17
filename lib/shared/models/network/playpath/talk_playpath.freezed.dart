// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'talk_playpath.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TalkPlaypath _$TalkPlaypathFromJson(Map<String, dynamic> json) {
  return _TalkPlaypath.fromJson(json);
}

/// @nodoc
mixin _$TalkPlaypath {
  String? get playpath => throw _privateConstructorUsedError;
  String? get serial => throw _privateConstructorUsedError;
  String? get recordtitle => throw _privateConstructorUsedError;
  String? get recordpath => throw _privateConstructorUsedError;

  /// Serializes this TalkPlaypath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TalkPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TalkPlaypathCopyWith<TalkPlaypath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalkPlaypathCopyWith<$Res> {
  factory $TalkPlaypathCopyWith(
          TalkPlaypath value, $Res Function(TalkPlaypath) then) =
      _$TalkPlaypathCopyWithImpl<$Res, TalkPlaypath>;
  @useResult
  $Res call(
      {String? playpath,
      String? serial,
      String? recordtitle,
      String? recordpath});
}

/// @nodoc
class _$TalkPlaypathCopyWithImpl<$Res, $Val extends TalkPlaypath>
    implements $TalkPlaypathCopyWith<$Res> {
  _$TalkPlaypathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TalkPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playpath = freezed,
    Object? serial = freezed,
    Object? recordtitle = freezed,
    Object? recordpath = freezed,
  }) {
    return _then(_value.copyWith(
      playpath: freezed == playpath
          ? _value.playpath
          : playpath // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      recordtitle: freezed == recordtitle
          ? _value.recordtitle
          : recordtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      recordpath: freezed == recordpath
          ? _value.recordpath
          : recordpath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TalkPlaypathImplCopyWith<$Res>
    implements $TalkPlaypathCopyWith<$Res> {
  factory _$$TalkPlaypathImplCopyWith(
          _$TalkPlaypathImpl value, $Res Function(_$TalkPlaypathImpl) then) =
      __$$TalkPlaypathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? playpath,
      String? serial,
      String? recordtitle,
      String? recordpath});
}

/// @nodoc
class __$$TalkPlaypathImplCopyWithImpl<$Res>
    extends _$TalkPlaypathCopyWithImpl<$Res, _$TalkPlaypathImpl>
    implements _$$TalkPlaypathImplCopyWith<$Res> {
  __$$TalkPlaypathImplCopyWithImpl(
      _$TalkPlaypathImpl _value, $Res Function(_$TalkPlaypathImpl) _then)
      : super(_value, _then);

  /// Create a copy of TalkPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playpath = freezed,
    Object? serial = freezed,
    Object? recordtitle = freezed,
    Object? recordpath = freezed,
  }) {
    return _then(_$TalkPlaypathImpl(
      playpath: freezed == playpath
          ? _value.playpath
          : playpath // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      recordtitle: freezed == recordtitle
          ? _value.recordtitle
          : recordtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      recordpath: freezed == recordpath
          ? _value.recordpath
          : recordpath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TalkPlaypathImpl extends _TalkPlaypath {
  const _$TalkPlaypathImpl(
      {this.playpath, this.serial, this.recordtitle, this.recordpath})
      : super._();

  factory _$TalkPlaypathImpl.fromJson(Map<String, dynamic> json) =>
      _$$TalkPlaypathImplFromJson(json);

  @override
  final String? playpath;
  @override
  final String? serial;
  @override
  final String? recordtitle;
  @override
  final String? recordpath;

  @override
  String toString() {
    return 'TalkPlaypath(playpath: $playpath, serial: $serial, recordtitle: $recordtitle, recordpath: $recordpath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TalkPlaypathImpl &&
            (identical(other.playpath, playpath) ||
                other.playpath == playpath) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.recordtitle, recordtitle) ||
                other.recordtitle == recordtitle) &&
            (identical(other.recordpath, recordpath) ||
                other.recordpath == recordpath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, playpath, serial, recordtitle, recordpath);

  /// Create a copy of TalkPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TalkPlaypathImplCopyWith<_$TalkPlaypathImpl> get copyWith =>
      __$$TalkPlaypathImplCopyWithImpl<_$TalkPlaypathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TalkPlaypathImplToJson(
      this,
    );
  }
}

abstract class _TalkPlaypath extends TalkPlaypath {
  const factory _TalkPlaypath(
      {final String? playpath,
      final String? serial,
      final String? recordtitle,
      final String? recordpath}) = _$TalkPlaypathImpl;
  const _TalkPlaypath._() : super._();

  factory _TalkPlaypath.fromJson(Map<String, dynamic> json) =
      _$TalkPlaypathImpl.fromJson;

  @override
  String? get playpath;
  @override
  String? get serial;
  @override
  String? get recordtitle;
  @override
  String? get recordpath;

  /// Create a copy of TalkPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TalkPlaypathImplCopyWith<_$TalkPlaypathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
