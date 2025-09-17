// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Page _$PageFromJson(Map<String, dynamic> json) {
  return _Page.fromJson(json);
}

/// @nodoc
mixin _$Page {
  String? get counts => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;
  String? get limit => throw _privateConstructorUsedError;
  int get next => throw _privateConstructorUsedError;
  String? get offset => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pagesTotal => throw _privateConstructorUsedError;
  dynamic get prev => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res, Page>;
  @useResult
  $Res call(
      {String? counts,
      int end,
      String? limit,
      int next,
      String? offset,
      int page,
      int pagesTotal,
      dynamic prev,
      int start,
      String? total});
}

/// @nodoc
class _$PageCopyWithImpl<$Res, $Val extends Page>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counts = freezed,
    Object? end = null,
    Object? limit = freezed,
    Object? next = null,
    Object? offset = freezed,
    Object? page = null,
    Object? pagesTotal = null,
    Object? prev = freezed,
    Object? start = null,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      counts: freezed == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as String?,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pagesTotal: null == pagesTotal
          ? _value.pagesTotal
          : pagesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageImplCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$PageImplCopyWith(
          _$PageImpl value, $Res Function(_$PageImpl) then) =
      __$$PageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? counts,
      int end,
      String? limit,
      int next,
      String? offset,
      int page,
      int pagesTotal,
      dynamic prev,
      int start,
      String? total});
}

/// @nodoc
class __$$PageImplCopyWithImpl<$Res>
    extends _$PageCopyWithImpl<$Res, _$PageImpl>
    implements _$$PageImplCopyWith<$Res> {
  __$$PageImplCopyWithImpl(_$PageImpl _value, $Res Function(_$PageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counts = freezed,
    Object? end = null,
    Object? limit = freezed,
    Object? next = null,
    Object? offset = freezed,
    Object? page = null,
    Object? pagesTotal = null,
    Object? prev = freezed,
    Object? start = null,
    Object? total = freezed,
  }) {
    return _then(_$PageImpl(
      counts: freezed == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as String?,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String?,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pagesTotal: null == pagesTotal
          ? _value.pagesTotal
          : pagesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as dynamic,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageImpl implements _Page {
  const _$PageImpl(
      {this.counts,
      this.end = 0,
      this.limit,
      this.next = 0,
      this.offset,
      this.page = 0,
      this.pagesTotal = 0,
      this.prev,
      this.start = 0,
      this.total});

  factory _$PageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageImplFromJson(json);

  @override
  final String? counts;
  @override
  @JsonKey()
  final int end;
  @override
  final String? limit;
  @override
  @JsonKey()
  final int next;
  @override
  final String? offset;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pagesTotal;
  @override
  final dynamic prev;
  @override
  @JsonKey()
  final int start;
  @override
  final String? total;

  @override
  String toString() {
    return 'Page(counts: $counts, end: $end, limit: $limit, next: $next, offset: $offset, page: $page, pagesTotal: $pagesTotal, prev: $prev, start: $start, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageImpl &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pagesTotal, pagesTotal) ||
                other.pagesTotal == pagesTotal) &&
            const DeepCollectionEquality().equals(other.prev, prev) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      counts,
      end,
      limit,
      next,
      offset,
      page,
      pagesTotal,
      const DeepCollectionEquality().hash(prev),
      start,
      total);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      __$$PageImplCopyWithImpl<_$PageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageImplToJson(
      this,
    );
  }
}

abstract class _Page implements Page {
  const factory _Page(
      {final String? counts,
      final int end,
      final String? limit,
      final int next,
      final String? offset,
      final int page,
      final int pagesTotal,
      final dynamic prev,
      final int start,
      final String? total}) = _$PageImpl;

  factory _Page.fromJson(Map<String, dynamic> json) = _$PageImpl.fromJson;

  @override
  String? get counts;
  @override
  int get end;
  @override
  String? get limit;
  @override
  int get next;
  @override
  String? get offset;
  @override
  int get page;
  @override
  int get pagesTotal;
  @override
  dynamic get prev;
  @override
  int get start;
  @override
  String? get total;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
