// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Information _$InformationFromJson(Map<String, dynamic> json) {
  return _Information.fromJson(json);
}

/// @nodoc
mixin _$Information {
  String get content => throw _privateConstructorUsedError;
  String get contentHtmlFlag => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get postedTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<InformationLink> get linksJson => throw _privateConstructorUsedError;
  List<InformationLink> get links => throw _privateConstructorUsedError;

  /// Serializes this Information to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Information
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InformationCopyWith<Information> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationCopyWith<$Res> {
  factory $InformationCopyWith(
          Information value, $Res Function(Information) then) =
      _$InformationCopyWithImpl<$Res, Information>;
  @useResult
  $Res call(
      {String content,
      String contentHtmlFlag,
      int id,
      String postedTime,
      String title,
      List<InformationLink> linksJson,
      List<InformationLink> links});
}

/// @nodoc
class _$InformationCopyWithImpl<$Res, $Val extends Information>
    implements $InformationCopyWith<$Res> {
  _$InformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Information
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentHtmlFlag = null,
    Object? id = null,
    Object? postedTime = null,
    Object? title = null,
    Object? linksJson = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentHtmlFlag: null == contentHtmlFlag
          ? _value.contentHtmlFlag
          : contentHtmlFlag // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postedTime: null == postedTime
          ? _value.postedTime
          : postedTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      linksJson: null == linksJson
          ? _value.linksJson
          : linksJson // ignore: cast_nullable_to_non_nullable
              as List<InformationLink>,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<InformationLink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationImplCopyWith<$Res>
    implements $InformationCopyWith<$Res> {
  factory _$$InformationImplCopyWith(
          _$InformationImpl value, $Res Function(_$InformationImpl) then) =
      __$$InformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String contentHtmlFlag,
      int id,
      String postedTime,
      String title,
      List<InformationLink> linksJson,
      List<InformationLink> links});
}

/// @nodoc
class __$$InformationImplCopyWithImpl<$Res>
    extends _$InformationCopyWithImpl<$Res, _$InformationImpl>
    implements _$$InformationImplCopyWith<$Res> {
  __$$InformationImplCopyWithImpl(
      _$InformationImpl _value, $Res Function(_$InformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Information
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentHtmlFlag = null,
    Object? id = null,
    Object? postedTime = null,
    Object? title = null,
    Object? linksJson = null,
    Object? links = null,
  }) {
    return _then(_$InformationImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentHtmlFlag: null == contentHtmlFlag
          ? _value.contentHtmlFlag
          : contentHtmlFlag // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postedTime: null == postedTime
          ? _value.postedTime
          : postedTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      linksJson: null == linksJson
          ? _value._linksJson
          : linksJson // ignore: cast_nullable_to_non_nullable
              as List<InformationLink>,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<InformationLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InformationImpl implements _Information {
  const _$InformationImpl(
      {this.content = '',
      this.contentHtmlFlag = '',
      this.id = 0,
      this.postedTime = '',
      this.title = '',
      final List<InformationLink> linksJson = const [],
      final List<InformationLink> links = const []})
      : _linksJson = linksJson,
        _links = links;

  factory _$InformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InformationImplFromJson(json);

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String contentHtmlFlag;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String postedTime;
  @override
  @JsonKey()
  final String title;
  final List<InformationLink> _linksJson;
  @override
  @JsonKey()
  List<InformationLink> get linksJson {
    if (_linksJson is EqualUnmodifiableListView) return _linksJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linksJson);
  }

  final List<InformationLink> _links;
  @override
  @JsonKey()
  List<InformationLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'Information(content: $content, contentHtmlFlag: $contentHtmlFlag, id: $id, postedTime: $postedTime, title: $title, linksJson: $linksJson, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentHtmlFlag, contentHtmlFlag) ||
                other.contentHtmlFlag == contentHtmlFlag) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postedTime, postedTime) ||
                other.postedTime == postedTime) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._linksJson, _linksJson) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      contentHtmlFlag,
      id,
      postedTime,
      title,
      const DeepCollectionEquality().hash(_linksJson),
      const DeepCollectionEquality().hash(_links));

  /// Create a copy of Information
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationImplCopyWith<_$InformationImpl> get copyWith =>
      __$$InformationImplCopyWithImpl<_$InformationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InformationImplToJson(
      this,
    );
  }
}

abstract class _Information implements Information {
  const factory _Information(
      {final String content,
      final String contentHtmlFlag,
      final int id,
      final String postedTime,
      final String title,
      final List<InformationLink> linksJson,
      final List<InformationLink> links}) = _$InformationImpl;

  factory _Information.fromJson(Map<String, dynamic> json) =
      _$InformationImpl.fromJson;

  @override
  String get content;
  @override
  String get contentHtmlFlag;
  @override
  int get id;
  @override
  String get postedTime;
  @override
  String get title;
  @override
  List<InformationLink> get linksJson;
  @override
  List<InformationLink> get links;

  /// Create a copy of Information
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InformationImplCopyWith<_$InformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InformationLink _$InformationLinkFromJson(Map<String, dynamic> json) {
  return _InformationLink.fromJson(json);
}

/// @nodoc
mixin _$InformationLink {
  String get target => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this InformationLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InformationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InformationLinkCopyWith<InformationLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationLinkCopyWith<$Res> {
  factory $InformationLinkCopyWith(
          InformationLink value, $Res Function(InformationLink) then) =
      _$InformationLinkCopyWithImpl<$Res, InformationLink>;
  @useResult
  $Res call({String target, String title, String url});
}

/// @nodoc
class _$InformationLinkCopyWithImpl<$Res, $Val extends InformationLink>
    implements $InformationLinkCopyWith<$Res> {
  _$InformationLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InformationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationLinkImplCopyWith<$Res>
    implements $InformationLinkCopyWith<$Res> {
  factory _$$InformationLinkImplCopyWith(_$InformationLinkImpl value,
          $Res Function(_$InformationLinkImpl) then) =
      __$$InformationLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String target, String title, String url});
}

/// @nodoc
class __$$InformationLinkImplCopyWithImpl<$Res>
    extends _$InformationLinkCopyWithImpl<$Res, _$InformationLinkImpl>
    implements _$$InformationLinkImplCopyWith<$Res> {
  __$$InformationLinkImplCopyWithImpl(
      _$InformationLinkImpl _value, $Res Function(_$InformationLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of InformationLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$InformationLinkImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InformationLinkImpl implements _InformationLink {
  const _$InformationLinkImpl(
      {this.target = '', this.title = '', this.url = ''});

  factory _$InformationLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$InformationLinkImplFromJson(json);

  @override
  @JsonKey()
  final String target;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'InformationLink(target: $target, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationLinkImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, target, title, url);

  /// Create a copy of InformationLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationLinkImplCopyWith<_$InformationLinkImpl> get copyWith =>
      __$$InformationLinkImplCopyWithImpl<_$InformationLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InformationLinkImplToJson(
      this,
    );
  }
}

abstract class _InformationLink implements InformationLink {
  const factory _InformationLink(
      {final String target,
      final String title,
      final String url}) = _$InformationLinkImpl;

  factory _InformationLink.fromJson(Map<String, dynamic> json) =
      _$InformationLinkImpl.fromJson;

  @override
  String get target;
  @override
  String get title;
  @override
  String get url;

  /// Create a copy of InformationLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InformationLinkImplCopyWith<_$InformationLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
