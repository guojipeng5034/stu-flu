// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_list_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonListApi _$LessonListApiFromJson(Map<String, dynamic> json) {
  return _LessonListApi.fromJson(json);
}

/// @nodoc
mixin _$LessonListApi {
  int get ftlReportLessonId => throw _privateConstructorUsedError;
  List<Lesson> get list => throw _privateConstructorUsedError;
  int get nowTime => throw _privateConstructorUsedError;
  Page? get pager => throw _privateConstructorUsedError;

  /// Serializes this LessonListApi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonListApiCopyWith<LessonListApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonListApiCopyWith<$Res> {
  factory $LessonListApiCopyWith(
          LessonListApi value, $Res Function(LessonListApi) then) =
      _$LessonListApiCopyWithImpl<$Res, LessonListApi>;
  @useResult
  $Res call(
      {int ftlReportLessonId, List<Lesson> list, int nowTime, Page? pager});

  $PageCopyWith<$Res>? get pager;
}

/// @nodoc
class _$LessonListApiCopyWithImpl<$Res, $Val extends LessonListApi>
    implements $LessonListApiCopyWith<$Res> {
  _$LessonListApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ftlReportLessonId = null,
    Object? list = null,
    Object? nowTime = null,
    Object? pager = freezed,
  }) {
    return _then(_value.copyWith(
      ftlReportLessonId: null == ftlReportLessonId
          ? _value.ftlReportLessonId
          : ftlReportLessonId // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      nowTime: null == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as int,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Page?,
    ) as $Val);
  }

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res>? get pager {
    if (_value.pager == null) {
      return null;
    }

    return $PageCopyWith<$Res>(_value.pager!, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonListApiImplCopyWith<$Res>
    implements $LessonListApiCopyWith<$Res> {
  factory _$$LessonListApiImplCopyWith(
          _$LessonListApiImpl value, $Res Function(_$LessonListApiImpl) then) =
      __$$LessonListApiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int ftlReportLessonId, List<Lesson> list, int nowTime, Page? pager});

  @override
  $PageCopyWith<$Res>? get pager;
}

/// @nodoc
class __$$LessonListApiImplCopyWithImpl<$Res>
    extends _$LessonListApiCopyWithImpl<$Res, _$LessonListApiImpl>
    implements _$$LessonListApiImplCopyWith<$Res> {
  __$$LessonListApiImplCopyWithImpl(
      _$LessonListApiImpl _value, $Res Function(_$LessonListApiImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ftlReportLessonId = null,
    Object? list = null,
    Object? nowTime = null,
    Object? pager = freezed,
  }) {
    return _then(_$LessonListApiImpl(
      ftlReportLessonId: null == ftlReportLessonId
          ? _value.ftlReportLessonId
          : ftlReportLessonId // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      nowTime: null == nowTime
          ? _value.nowTime
          : nowTime // ignore: cast_nullable_to_non_nullable
              as int,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Page?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonListApiImpl implements _LessonListApi {
  const _$LessonListApiImpl(
      {this.ftlReportLessonId = 0,
      final List<Lesson> list = const [],
      this.nowTime = 0,
      this.pager})
      : _list = list;

  factory _$LessonListApiImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonListApiImplFromJson(json);

  @override
  @JsonKey()
  final int ftlReportLessonId;
  final List<Lesson> _list;
  @override
  @JsonKey()
  List<Lesson> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final int nowTime;
  @override
  final Page? pager;

  @override
  String toString() {
    return 'LessonListApi(ftlReportLessonId: $ftlReportLessonId, list: $list, nowTime: $nowTime, pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonListApiImpl &&
            (identical(other.ftlReportLessonId, ftlReportLessonId) ||
                other.ftlReportLessonId == ftlReportLessonId) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.nowTime, nowTime) || other.nowTime == nowTime) &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ftlReportLessonId,
      const DeepCollectionEquality().hash(_list), nowTime, pager);

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonListApiImplCopyWith<_$LessonListApiImpl> get copyWith =>
      __$$LessonListApiImplCopyWithImpl<_$LessonListApiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonListApiImplToJson(
      this,
    );
  }
}

abstract class _LessonListApi implements LessonListApi {
  const factory _LessonListApi(
      {final int ftlReportLessonId,
      final List<Lesson> list,
      final int nowTime,
      final Page? pager}) = _$LessonListApiImpl;

  factory _LessonListApi.fromJson(Map<String, dynamic> json) =
      _$LessonListApiImpl.fromJson;

  @override
  int get ftlReportLessonId;
  @override
  List<Lesson> get list;
  @override
  int get nowTime;
  @override
  Page? get pager;

  /// Create a copy of LessonListApi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonListApiImplCopyWith<_$LessonListApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
