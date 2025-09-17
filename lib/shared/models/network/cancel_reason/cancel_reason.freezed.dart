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

CancelReason _$CancelReasonFromJson(Map<String, dynamic> json) {
  return _CancelReason.fromJson(json);
}

/// @nodoc
mixin _$CancelReason {
  int get id => throw _privateConstructorUsedError;
  String get labe =>
      throw _privateConstructorUsedError; // 注意：原Android代码中拼写错误，保持一致
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get refundDescription => throw _privateConstructorUsedError;
  CancelReasonRefund? get refund => throw _privateConstructorUsedError;
  String get by => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get hide => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get alertToStudent => throw _privateConstructorUsedError;

  /// Serializes this CancelReason to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReasonCopyWith<CancelReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonCopyWith<$Res> {
  factory $CancelReasonCopyWith(
          CancelReason value, $Res Function(CancelReason) then) =
      _$CancelReasonCopyWithImpl<$Res, CancelReason>;
  @useResult
  $Res call(
      {int id,
      String labe,
      String name,
      String description,
      String refundDescription,
      CancelReasonRefund? refund,
      String by,
      @CTBoolConverter() bool hide,
      @CTBoolConverter() bool alertToStudent});

  $CancelReasonRefundCopyWith<$Res>? get refund;
}

/// @nodoc
class _$CancelReasonCopyWithImpl<$Res, $Val extends CancelReason>
    implements $CancelReasonCopyWith<$Res> {
  _$CancelReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labe = null,
    Object? name = null,
    Object? description = null,
    Object? refundDescription = null,
    Object? refund = freezed,
    Object? by = null,
    Object? hide = null,
    Object? alertToStudent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      labe: null == labe
          ? _value.labe
          : labe // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      refundDescription: null == refundDescription
          ? _value.refundDescription
          : refundDescription // ignore: cast_nullable_to_non_nullable
              as String,
      refund: freezed == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as CancelReasonRefund?,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      alertToStudent: null == alertToStudent
          ? _value.alertToStudent
          : alertToStudent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CancelReasonRefundCopyWith<$Res>? get refund {
    if (_value.refund == null) {
      return null;
    }

    return $CancelReasonRefundCopyWith<$Res>(_value.refund!, (value) {
      return _then(_value.copyWith(refund: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CancelReasonImplCopyWith<$Res>
    implements $CancelReasonCopyWith<$Res> {
  factory _$$CancelReasonImplCopyWith(
          _$CancelReasonImpl value, $Res Function(_$CancelReasonImpl) then) =
      __$$CancelReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String labe,
      String name,
      String description,
      String refundDescription,
      CancelReasonRefund? refund,
      String by,
      @CTBoolConverter() bool hide,
      @CTBoolConverter() bool alertToStudent});

  @override
  $CancelReasonRefundCopyWith<$Res>? get refund;
}

/// @nodoc
class __$$CancelReasonImplCopyWithImpl<$Res>
    extends _$CancelReasonCopyWithImpl<$Res, _$CancelReasonImpl>
    implements _$$CancelReasonImplCopyWith<$Res> {
  __$$CancelReasonImplCopyWithImpl(
      _$CancelReasonImpl _value, $Res Function(_$CancelReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labe = null,
    Object? name = null,
    Object? description = null,
    Object? refundDescription = null,
    Object? refund = freezed,
    Object? by = null,
    Object? hide = null,
    Object? alertToStudent = null,
  }) {
    return _then(_$CancelReasonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      labe: null == labe
          ? _value.labe
          : labe // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      refundDescription: null == refundDescription
          ? _value.refundDescription
          : refundDescription // ignore: cast_nullable_to_non_nullable
              as String,
      refund: freezed == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as CancelReasonRefund?,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
      hide: null == hide
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      alertToStudent: null == alertToStudent
          ? _value.alertToStudent
          : alertToStudent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonImpl implements _CancelReason {
  const _$CancelReasonImpl(
      {this.id = 0,
      this.labe = '',
      this.name = '',
      this.description = '',
      this.refundDescription = '',
      this.refund,
      this.by = '',
      @CTBoolConverter() this.hide = false,
      @CTBoolConverter() this.alertToStudent = false});

  factory _$CancelReasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String labe;
// 注意：原Android代码中拼写错误，保持一致
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String refundDescription;
  @override
  final CancelReasonRefund? refund;
  @override
  @JsonKey()
  final String by;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool hide;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool alertToStudent;

  @override
  String toString() {
    return 'CancelReason(id: $id, labe: $labe, name: $name, description: $description, refundDescription: $refundDescription, refund: $refund, by: $by, hide: $hide, alertToStudent: $alertToStudent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.labe, labe) || other.labe == labe) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.refundDescription, refundDescription) ||
                other.refundDescription == refundDescription) &&
            (identical(other.refund, refund) || other.refund == refund) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.alertToStudent, alertToStudent) ||
                other.alertToStudent == alertToStudent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, labe, name, description,
      refundDescription, refund, by, hide, alertToStudent);

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonImplCopyWith<_$CancelReasonImpl> get copyWith =>
      __$$CancelReasonImplCopyWithImpl<_$CancelReasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonImplToJson(
      this,
    );
  }
}

abstract class _CancelReason implements CancelReason {
  const factory _CancelReason(
      {final int id,
      final String labe,
      final String name,
      final String description,
      final String refundDescription,
      final CancelReasonRefund? refund,
      final String by,
      @CTBoolConverter() final bool hide,
      @CTBoolConverter() final bool alertToStudent}) = _$CancelReasonImpl;

  factory _CancelReason.fromJson(Map<String, dynamic> json) =
      _$CancelReasonImpl.fromJson;

  @override
  int get id;
  @override
  String get labe; // 注意：原Android代码中拼写错误，保持一致
  @override
  String get name;
  @override
  String get description;
  @override
  String get refundDescription;
  @override
  CancelReasonRefund? get refund;
  @override
  String get by;
  @override
  @CTBoolConverter()
  bool get hide;
  @override
  @CTBoolConverter()
  bool get alertToStudent;

  /// Create a copy of CancelReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReasonImplCopyWith<_$CancelReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelReasonRefund _$CancelReasonRefundFromJson(Map<String, dynamic> json) {
  return _CancelReasonRefund.fromJson(json);
}

/// @nodoc
mixin _$CancelReasonRefund {
  @CTBoolConverter()
  bool get points => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get ticket => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get everyday => throw _privateConstructorUsedError;

  /// Serializes this CancelReasonRefund to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReasonRefund
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReasonRefundCopyWith<CancelReasonRefund> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonRefundCopyWith<$Res> {
  factory $CancelReasonRefundCopyWith(
          CancelReasonRefund value, $Res Function(CancelReasonRefund) then) =
      _$CancelReasonRefundCopyWithImpl<$Res, CancelReasonRefund>;
  @useResult
  $Res call(
      {@CTBoolConverter() bool points,
      @CTBoolConverter() bool ticket,
      @CTBoolConverter() bool everyday});
}

/// @nodoc
class _$CancelReasonRefundCopyWithImpl<$Res, $Val extends CancelReasonRefund>
    implements $CancelReasonRefundCopyWith<$Res> {
  _$CancelReasonRefundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReasonRefund
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? ticket = null,
    Object? everyday = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as bool,
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as bool,
      everyday: null == everyday
          ? _value.everyday
          : everyday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelReasonRefundImplCopyWith<$Res>
    implements $CancelReasonRefundCopyWith<$Res> {
  factory _$$CancelReasonRefundImplCopyWith(_$CancelReasonRefundImpl value,
          $Res Function(_$CancelReasonRefundImpl) then) =
      __$$CancelReasonRefundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@CTBoolConverter() bool points,
      @CTBoolConverter() bool ticket,
      @CTBoolConverter() bool everyday});
}

/// @nodoc
class __$$CancelReasonRefundImplCopyWithImpl<$Res>
    extends _$CancelReasonRefundCopyWithImpl<$Res, _$CancelReasonRefundImpl>
    implements _$$CancelReasonRefundImplCopyWith<$Res> {
  __$$CancelReasonRefundImplCopyWithImpl(_$CancelReasonRefundImpl _value,
      $Res Function(_$CancelReasonRefundImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReasonRefund
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? ticket = null,
    Object? everyday = null,
  }) {
    return _then(_$CancelReasonRefundImpl(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as bool,
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as bool,
      everyday: null == everyday
          ? _value.everyday
          : everyday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonRefundImpl implements _CancelReasonRefund {
  const _$CancelReasonRefundImpl(
      {@CTBoolConverter() this.points = false,
      @CTBoolConverter() this.ticket = false,
      @CTBoolConverter() this.everyday = false});

  factory _$CancelReasonRefundImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonRefundImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool points;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool ticket;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool everyday;

  @override
  String toString() {
    return 'CancelReasonRefund(points: $points, ticket: $ticket, everyday: $everyday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonRefundImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.everyday, everyday) ||
                other.everyday == everyday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, points, ticket, everyday);

  /// Create a copy of CancelReasonRefund
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonRefundImplCopyWith<_$CancelReasonRefundImpl> get copyWith =>
      __$$CancelReasonRefundImplCopyWithImpl<_$CancelReasonRefundImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonRefundImplToJson(
      this,
    );
  }
}

abstract class _CancelReasonRefund implements CancelReasonRefund {
  const factory _CancelReasonRefund(
      {@CTBoolConverter() final bool points,
      @CTBoolConverter() final bool ticket,
      @CTBoolConverter() final bool everyday}) = _$CancelReasonRefundImpl;

  factory _CancelReasonRefund.fromJson(Map<String, dynamic> json) =
      _$CancelReasonRefundImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get points;
  @override
  @CTBoolConverter()
  bool get ticket;
  @override
  @CTBoolConverter()
  bool get everyday;

  /// Create a copy of CancelReasonRefund
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReasonRefundImplCopyWith<_$CancelReasonRefundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
