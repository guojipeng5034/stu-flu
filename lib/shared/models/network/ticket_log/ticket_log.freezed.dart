// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketLog _$TicketLogFromJson(Map<String, dynamic> json) {
  return _TicketLog.fromJson(json);
}

/// @nodoc
mixin _$TicketLog {
  String? get canReserveToTime => throw _privateConstructorUsedError;
  String? get createdTime => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get studentId => throw _privateConstructorUsedError;
  int get usedTotal => throw _privateConstructorUsedError;
  Ticket? get ticket => throw _privateConstructorUsedError;
  bool get isShow => throw _privateConstructorUsedError;

  /// Serializes this TicketLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketLogCopyWith<TicketLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketLogCopyWith<$Res> {
  factory $TicketLogCopyWith(TicketLog value, $Res Function(TicketLog) then) =
      _$TicketLogCopyWithImpl<$Res, TicketLog>;
  @useResult
  $Res call(
      {String? canReserveToTime,
      String? createdTime,
      int id,
      String? studentId,
      int usedTotal,
      Ticket? ticket,
      bool isShow});

  $TicketCopyWith<$Res>? get ticket;
}

/// @nodoc
class _$TicketLogCopyWithImpl<$Res, $Val extends TicketLog>
    implements $TicketLogCopyWith<$Res> {
  _$TicketLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canReserveToTime = freezed,
    Object? createdTime = freezed,
    Object? id = null,
    Object? studentId = freezed,
    Object? usedTotal = null,
    Object? ticket = freezed,
    Object? isShow = null,
  }) {
    return _then(_value.copyWith(
      canReserveToTime: freezed == canReserveToTime
          ? _value.canReserveToTime
          : canReserveToTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      usedTotal: null == usedTotal
          ? _value.usedTotal
          : usedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket?,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketCopyWith<$Res>? get ticket {
    if (_value.ticket == null) {
      return null;
    }

    return $TicketCopyWith<$Res>(_value.ticket!, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketLogImplCopyWith<$Res>
    implements $TicketLogCopyWith<$Res> {
  factory _$$TicketLogImplCopyWith(
          _$TicketLogImpl value, $Res Function(_$TicketLogImpl) then) =
      __$$TicketLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? canReserveToTime,
      String? createdTime,
      int id,
      String? studentId,
      int usedTotal,
      Ticket? ticket,
      bool isShow});

  @override
  $TicketCopyWith<$Res>? get ticket;
}

/// @nodoc
class __$$TicketLogImplCopyWithImpl<$Res>
    extends _$TicketLogCopyWithImpl<$Res, _$TicketLogImpl>
    implements _$$TicketLogImplCopyWith<$Res> {
  __$$TicketLogImplCopyWithImpl(
      _$TicketLogImpl _value, $Res Function(_$TicketLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canReserveToTime = freezed,
    Object? createdTime = freezed,
    Object? id = null,
    Object? studentId = freezed,
    Object? usedTotal = null,
    Object? ticket = freezed,
    Object? isShow = null,
  }) {
    return _then(_$TicketLogImpl(
      canReserveToTime: freezed == canReserveToTime
          ? _value.canReserveToTime
          : canReserveToTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      usedTotal: null == usedTotal
          ? _value.usedTotal
          : usedTotal // ignore: cast_nullable_to_non_nullable
              as int,
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket?,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketLogImpl implements _TicketLog {
  const _$TicketLogImpl(
      {this.canReserveToTime,
      this.createdTime,
      this.id = 0,
      this.studentId,
      this.usedTotal = 0,
      this.ticket,
      this.isShow = false});

  factory _$TicketLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketLogImplFromJson(json);

  @override
  final String? canReserveToTime;
  @override
  final String? createdTime;
  @override
  @JsonKey()
  final int id;
  @override
  final String? studentId;
  @override
  @JsonKey()
  final int usedTotal;
  @override
  final Ticket? ticket;
  @override
  @JsonKey()
  final bool isShow;

  @override
  String toString() {
    return 'TicketLog(canReserveToTime: $canReserveToTime, createdTime: $createdTime, id: $id, studentId: $studentId, usedTotal: $usedTotal, ticket: $ticket, isShow: $isShow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketLogImpl &&
            (identical(other.canReserveToTime, canReserveToTime) ||
                other.canReserveToTime == canReserveToTime) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.usedTotal, usedTotal) ||
                other.usedTotal == usedTotal) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.isShow, isShow) || other.isShow == isShow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, canReserveToTime, createdTime,
      id, studentId, usedTotal, ticket, isShow);

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketLogImplCopyWith<_$TicketLogImpl> get copyWith =>
      __$$TicketLogImplCopyWithImpl<_$TicketLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketLogImplToJson(
      this,
    );
  }
}

abstract class _TicketLog implements TicketLog {
  const factory _TicketLog(
      {final String? canReserveToTime,
      final String? createdTime,
      final int id,
      final String? studentId,
      final int usedTotal,
      final Ticket? ticket,
      final bool isShow}) = _$TicketLogImpl;

  factory _TicketLog.fromJson(Map<String, dynamic> json) =
      _$TicketLogImpl.fromJson;

  @override
  String? get canReserveToTime;
  @override
  String? get createdTime;
  @override
  int get id;
  @override
  String? get studentId;
  @override
  int get usedTotal;
  @override
  Ticket? get ticket;
  @override
  bool get isShow;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketLogImplCopyWith<_$TicketLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
