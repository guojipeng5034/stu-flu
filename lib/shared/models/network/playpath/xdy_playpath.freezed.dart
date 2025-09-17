// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xdy_playpath.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

XdyPlaypath _$XdyPlaypathFromJson(Map<String, dynamic> json) {
  return _XdyPlaypath.fromJson(json);
}

/// @nodoc
mixin _$XdyPlaypath {
  String? get playpath => throw _privateConstructorUsedError;
  String? get defaultVideoToolProvider => throw _privateConstructorUsedError;
  String? get lessonId => throw _privateConstructorUsedError;

  /// Serializes this XdyPlaypath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of XdyPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $XdyPlaypathCopyWith<XdyPlaypath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XdyPlaypathCopyWith<$Res> {
  factory $XdyPlaypathCopyWith(
          XdyPlaypath value, $Res Function(XdyPlaypath) then) =
      _$XdyPlaypathCopyWithImpl<$Res, XdyPlaypath>;
  @useResult
  $Res call(
      {String? playpath, String? defaultVideoToolProvider, String? lessonId});
}

/// @nodoc
class _$XdyPlaypathCopyWithImpl<$Res, $Val extends XdyPlaypath>
    implements $XdyPlaypathCopyWith<$Res> {
  _$XdyPlaypathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of XdyPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playpath = freezed,
    Object? defaultVideoToolProvider = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(_value.copyWith(
      playpath: freezed == playpath
          ? _value.playpath
          : playpath // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultVideoToolProvider: freezed == defaultVideoToolProvider
          ? _value.defaultVideoToolProvider
          : defaultVideoToolProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$XdyPlaypathImplCopyWith<$Res>
    implements $XdyPlaypathCopyWith<$Res> {
  factory _$$XdyPlaypathImplCopyWith(
          _$XdyPlaypathImpl value, $Res Function(_$XdyPlaypathImpl) then) =
      __$$XdyPlaypathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? playpath, String? defaultVideoToolProvider, String? lessonId});
}

/// @nodoc
class __$$XdyPlaypathImplCopyWithImpl<$Res>
    extends _$XdyPlaypathCopyWithImpl<$Res, _$XdyPlaypathImpl>
    implements _$$XdyPlaypathImplCopyWith<$Res> {
  __$$XdyPlaypathImplCopyWithImpl(
      _$XdyPlaypathImpl _value, $Res Function(_$XdyPlaypathImpl) _then)
      : super(_value, _then);

  /// Create a copy of XdyPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playpath = freezed,
    Object? defaultVideoToolProvider = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(_$XdyPlaypathImpl(
      playpath: freezed == playpath
          ? _value.playpath
          : playpath // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultVideoToolProvider: freezed == defaultVideoToolProvider
          ? _value.defaultVideoToolProvider
          : defaultVideoToolProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XdyPlaypathImpl extends _XdyPlaypath {
  const _$XdyPlaypathImpl(
      {this.playpath, this.defaultVideoToolProvider, this.lessonId})
      : super._();

  factory _$XdyPlaypathImpl.fromJson(Map<String, dynamic> json) =>
      _$$XdyPlaypathImplFromJson(json);

  @override
  final String? playpath;
  @override
  final String? defaultVideoToolProvider;
  @override
  final String? lessonId;

  @override
  String toString() {
    return 'XdyPlaypath(playpath: $playpath, defaultVideoToolProvider: $defaultVideoToolProvider, lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XdyPlaypathImpl &&
            (identical(other.playpath, playpath) ||
                other.playpath == playpath) &&
            (identical(
                    other.defaultVideoToolProvider, defaultVideoToolProvider) ||
                other.defaultVideoToolProvider == defaultVideoToolProvider) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, playpath, defaultVideoToolProvider, lessonId);

  /// Create a copy of XdyPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$XdyPlaypathImplCopyWith<_$XdyPlaypathImpl> get copyWith =>
      __$$XdyPlaypathImplCopyWithImpl<_$XdyPlaypathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XdyPlaypathImplToJson(
      this,
    );
  }
}

abstract class _XdyPlaypath extends XdyPlaypath {
  const factory _XdyPlaypath(
      {final String? playpath,
      final String? defaultVideoToolProvider,
      final String? lessonId}) = _$XdyPlaypathImpl;
  const _XdyPlaypath._() : super._();

  factory _XdyPlaypath.fromJson(Map<String, dynamic> json) =
      _$XdyPlaypathImpl.fromJson;

  @override
  String? get playpath;
  @override
  String? get defaultVideoToolProvider;
  @override
  String? get lessonId;

  /// Create a copy of XdyPlaypath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$XdyPlaypathImplCopyWith<_$XdyPlaypathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
