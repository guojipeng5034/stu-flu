// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupBanner _$GroupBannerFromJson(Map<String, dynamic> json) {
  return _GroupBanner.fromJson(json);
}

/// @nodoc
mixin _$GroupBanner {
  String? get image => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this GroupBanner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupBannerCopyWith<GroupBanner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupBannerCopyWith<$Res> {
  factory $GroupBannerCopyWith(
          GroupBanner value, $Res Function(GroupBanner) then) =
      _$GroupBannerCopyWithImpl<$Res, GroupBanner>;
  @useResult
  $Res call({String? image, String? url});
}

/// @nodoc
class _$GroupBannerCopyWithImpl<$Res, $Val extends GroupBanner>
    implements $GroupBannerCopyWith<$Res> {
  _$GroupBannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupBannerImplCopyWith<$Res>
    implements $GroupBannerCopyWith<$Res> {
  factory _$$GroupBannerImplCopyWith(
          _$GroupBannerImpl value, $Res Function(_$GroupBannerImpl) then) =
      __$$GroupBannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? image, String? url});
}

/// @nodoc
class __$$GroupBannerImplCopyWithImpl<$Res>
    extends _$GroupBannerCopyWithImpl<$Res, _$GroupBannerImpl>
    implements _$$GroupBannerImplCopyWith<$Res> {
  __$$GroupBannerImplCopyWithImpl(
      _$GroupBannerImpl _value, $Res Function(_$GroupBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? url = freezed,
  }) {
    return _then(_$GroupBannerImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupBannerImpl implements _GroupBanner {
  const _$GroupBannerImpl({this.image, this.url});

  factory _$GroupBannerImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupBannerImplFromJson(json);

  @override
  final String? image;
  @override
  final String? url;

  @override
  String toString() {
    return 'GroupBanner(image: $image, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupBannerImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, url);

  /// Create a copy of GroupBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupBannerImplCopyWith<_$GroupBannerImpl> get copyWith =>
      __$$GroupBannerImplCopyWithImpl<_$GroupBannerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupBannerImplToJson(
      this,
    );
  }
}

abstract class _GroupBanner implements GroupBanner {
  const factory _GroupBanner({final String? image, final String? url}) =
      _$GroupBannerImpl;

  factory _GroupBanner.fromJson(Map<String, dynamic> json) =
      _$GroupBannerImpl.fromJson;

  @override
  String? get image;
  @override
  String? get url;

  /// Create a copy of GroupBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupBannerImplCopyWith<_$GroupBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
