// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancelReasonBean _$CancelReasonBeanFromJson(Map<String, dynamic> json) {
  return _CancelReasonBean.fromJson(json);
}

/// @nodoc
mixin _$CancelReasonBean {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get refundDescription => throw _privateConstructorUsedError;
  CancelRefund? get refund => throw _privateConstructorUsedError;
  String? get by => throw _privateConstructorUsedError;
  int? get hide => throw _privateConstructorUsedError;

  /// Serializes this CancelReasonBean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReasonBeanCopyWith<CancelReasonBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonBeanCopyWith<$Res> {
  factory $CancelReasonBeanCopyWith(
          CancelReasonBean value, $Res Function(CancelReasonBean) then) =
      _$CancelReasonBeanCopyWithImpl<$Res, CancelReasonBean>;
  @useResult
  $Res call(
      {int? id,
      String? label,
      String? name,
      String? description,
      String? refundDescription,
      CancelRefund? refund,
      String? by,
      int? hide});

  $CancelRefundCopyWith<$Res>? get refund;
}

/// @nodoc
class _$CancelReasonBeanCopyWithImpl<$Res, $Val extends CancelReasonBean>
    implements $CancelReasonBeanCopyWith<$Res> {
  _$CancelReasonBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? refundDescription = freezed,
    Object? refund = freezed,
    Object? by = freezed,
    Object? hide = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      refundDescription: freezed == refundDescription
          ? _value.refundDescription
          : refundDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      refund: freezed == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as CancelRefund?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: freezed == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CancelRefundCopyWith<$Res>? get refund {
    if (_value.refund == null) {
      return null;
    }

    return $CancelRefundCopyWith<$Res>(_value.refund!, (value) {
      return _then(_value.copyWith(refund: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CancelReasonBeanImplCopyWith<$Res>
    implements $CancelReasonBeanCopyWith<$Res> {
  factory _$$CancelReasonBeanImplCopyWith(_$CancelReasonBeanImpl value,
          $Res Function(_$CancelReasonBeanImpl) then) =
      __$$CancelReasonBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? label,
      String? name,
      String? description,
      String? refundDescription,
      CancelRefund? refund,
      String? by,
      int? hide});

  @override
  $CancelRefundCopyWith<$Res>? get refund;
}

/// @nodoc
class __$$CancelReasonBeanImplCopyWithImpl<$Res>
    extends _$CancelReasonBeanCopyWithImpl<$Res, _$CancelReasonBeanImpl>
    implements _$$CancelReasonBeanImplCopyWith<$Res> {
  __$$CancelReasonBeanImplCopyWithImpl(_$CancelReasonBeanImpl _value,
      $Res Function(_$CancelReasonBeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? refundDescription = freezed,
    Object? refund = freezed,
    Object? by = freezed,
    Object? hide = freezed,
  }) {
    return _then(_$CancelReasonBeanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      refundDescription: freezed == refundDescription
          ? _value.refundDescription
          : refundDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      refund: freezed == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as CancelRefund?,
      by: freezed == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String?,
      hide: freezed == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonBeanImpl implements _CancelReasonBean {
  const _$CancelReasonBeanImpl(
      {this.id,
      this.label,
      this.name,
      this.description,
      this.refundDescription,
      this.refund,
      this.by,
      this.hide});

  factory _$CancelReasonBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonBeanImplFromJson(json);

  @override
  final int? id;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? refundDescription;
  @override
  final CancelRefund? refund;
  @override
  final String? by;
  @override
  final int? hide;

  @override
  String toString() {
    return 'CancelReasonBean(id: $id, label: $label, name: $name, description: $description, refundDescription: $refundDescription, refund: $refund, by: $by, hide: $hide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonBeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.refundDescription, refundDescription) ||
                other.refundDescription == refundDescription) &&
            (identical(other.refund, refund) || other.refund == refund) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, name, description,
      refundDescription, refund, by, hide);

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonBeanImplCopyWith<_$CancelReasonBeanImpl> get copyWith =>
      __$$CancelReasonBeanImplCopyWithImpl<_$CancelReasonBeanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonBeanImplToJson(
      this,
    );
  }
}

abstract class _CancelReasonBean implements CancelReasonBean {
  const factory _CancelReasonBean(
      {final int? id,
      final String? label,
      final String? name,
      final String? description,
      final String? refundDescription,
      final CancelRefund? refund,
      final String? by,
      final int? hide}) = _$CancelReasonBeanImpl;

  factory _CancelReasonBean.fromJson(Map<String, dynamic> json) =
      _$CancelReasonBeanImpl.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get refundDescription;
  @override
  CancelRefund? get refund;
  @override
  String? get by;
  @override
  int? get hide;

  /// Create a copy of CancelReasonBean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReasonBeanImplCopyWith<_$CancelReasonBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelRefund _$CancelRefundFromJson(Map<String, dynamic> json) {
  return _CancelRefund.fromJson(json);
}

/// @nodoc
mixin _$CancelRefund {
  int? get points => throw _privateConstructorUsedError;
  int? get ticket => throw _privateConstructorUsedError;
  int? get everyday => throw _privateConstructorUsedError;

  /// Serializes this CancelRefund to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelRefund
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelRefundCopyWith<CancelRefund> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelRefundCopyWith<$Res> {
  factory $CancelRefundCopyWith(
          CancelRefund value, $Res Function(CancelRefund) then) =
      _$CancelRefundCopyWithImpl<$Res, CancelRefund>;
  @useResult
  $Res call({int? points, int? ticket, int? everyday});
}

/// @nodoc
class _$CancelRefundCopyWithImpl<$Res, $Val extends CancelRefund>
    implements $CancelRefundCopyWith<$Res> {
  _$CancelRefundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelRefund
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = freezed,
    Object? ticket = freezed,
    Object? everyday = freezed,
  }) {
    return _then(_value.copyWith(
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as int?,
      everyday: freezed == everyday
          ? _value.everyday
          : everyday // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelRefundImplCopyWith<$Res>
    implements $CancelRefundCopyWith<$Res> {
  factory _$$CancelRefundImplCopyWith(
          _$CancelRefundImpl value, $Res Function(_$CancelRefundImpl) then) =
      __$$CancelRefundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? points, int? ticket, int? everyday});
}

/// @nodoc
class __$$CancelRefundImplCopyWithImpl<$Res>
    extends _$CancelRefundCopyWithImpl<$Res, _$CancelRefundImpl>
    implements _$$CancelRefundImplCopyWith<$Res> {
  __$$CancelRefundImplCopyWithImpl(
      _$CancelRefundImpl _value, $Res Function(_$CancelRefundImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelRefund
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = freezed,
    Object? ticket = freezed,
    Object? everyday = freezed,
  }) {
    return _then(_$CancelRefundImpl(
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as int?,
      everyday: freezed == everyday
          ? _value.everyday
          : everyday // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelRefundImpl implements _CancelRefund {
  const _$CancelRefundImpl({this.points, this.ticket, this.everyday});

  factory _$CancelRefundImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelRefundImplFromJson(json);

  @override
  final int? points;
  @override
  final int? ticket;
  @override
  final int? everyday;

  @override
  String toString() {
    return 'CancelRefund(points: $points, ticket: $ticket, everyday: $everyday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelRefundImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.everyday, everyday) ||
                other.everyday == everyday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, points, ticket, everyday);

  /// Create a copy of CancelRefund
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelRefundImplCopyWith<_$CancelRefundImpl> get copyWith =>
      __$$CancelRefundImplCopyWithImpl<_$CancelRefundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelRefundImplToJson(
      this,
    );
  }
}

abstract class _CancelRefund implements CancelRefund {
  const factory _CancelRefund(
      {final int? points,
      final int? ticket,
      final int? everyday}) = _$CancelRefundImpl;

  factory _CancelRefund.fromJson(Map<String, dynamic> json) =
      _$CancelRefundImpl.fromJson;

  @override
  int? get points;
  @override
  int? get ticket;
  @override
  int? get everyday;

  /// Create a copy of CancelRefund
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelRefundImplCopyWith<_$CancelRefundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelReasonList _$CancelReasonListFromJson(Map<String, dynamic> json) {
  return _CancelReasonList.fromJson(json);
}

/// @nodoc
mixin _$CancelReasonList {
  List<CancelReasonBean>? get data => throw _privateConstructorUsedError;

  /// Serializes this CancelReasonList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReasonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReasonListCopyWith<CancelReasonList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonListCopyWith<$Res> {
  factory $CancelReasonListCopyWith(
          CancelReasonList value, $Res Function(CancelReasonList) then) =
      _$CancelReasonListCopyWithImpl<$Res, CancelReasonList>;
  @useResult
  $Res call({List<CancelReasonBean>? data});
}

/// @nodoc
class _$CancelReasonListCopyWithImpl<$Res, $Val extends CancelReasonList>
    implements $CancelReasonListCopyWith<$Res> {
  _$CancelReasonListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReasonList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CancelReasonBean>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelReasonListImplCopyWith<$Res>
    implements $CancelReasonListCopyWith<$Res> {
  factory _$$CancelReasonListImplCopyWith(_$CancelReasonListImpl value,
          $Res Function(_$CancelReasonListImpl) then) =
      __$$CancelReasonListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CancelReasonBean>? data});
}

/// @nodoc
class __$$CancelReasonListImplCopyWithImpl<$Res>
    extends _$CancelReasonListCopyWithImpl<$Res, _$CancelReasonListImpl>
    implements _$$CancelReasonListImplCopyWith<$Res> {
  __$$CancelReasonListImplCopyWithImpl(_$CancelReasonListImpl _value,
      $Res Function(_$CancelReasonListImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReasonList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CancelReasonListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CancelReasonBean>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonListImpl implements _CancelReasonList {
  const _$CancelReasonListImpl({final List<CancelReasonBean>? data})
      : _data = data;

  factory _$CancelReasonListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonListImplFromJson(json);

  final List<CancelReasonBean>? _data;
  @override
  List<CancelReasonBean>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CancelReasonList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CancelReasonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonListImplCopyWith<_$CancelReasonListImpl> get copyWith =>
      __$$CancelReasonListImplCopyWithImpl<_$CancelReasonListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonListImplToJson(
      this,
    );
  }
}

abstract class _CancelReasonList implements CancelReasonList {
  const factory _CancelReasonList({final List<CancelReasonBean>? data}) =
      _$CancelReasonListImpl;

  factory _CancelReasonList.fromJson(Map<String, dynamic> json) =
      _$CancelReasonListImpl.fromJson;

  @override
  List<CancelReasonBean>? get data;

  /// Create a copy of CancelReasonList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReasonListImplCopyWith<_$CancelReasonListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
