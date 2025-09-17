// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  int get fairId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get pagesSummary => throw _privateConstructorUsedError;

  /// Serializes this Assessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
          Assessment value, $Res Function(Assessment) then) =
      _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call({int fairId, String message, String pagesSummary});
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fairId = null,
    Object? message = null,
    Object? pagesSummary = null,
  }) {
    return _then(_value.copyWith(
      fairId: null == fairId
          ? _value.fairId
          : fairId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pagesSummary: null == pagesSummary
          ? _value.pagesSummary
          : pagesSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentImplCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$AssessmentImplCopyWith(
          _$AssessmentImpl value, $Res Function(_$AssessmentImpl) then) =
      __$$AssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int fairId, String message, String pagesSummary});
}

/// @nodoc
class __$$AssessmentImplCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$AssessmentImpl>
    implements _$$AssessmentImplCopyWith<$Res> {
  __$$AssessmentImplCopyWithImpl(
      _$AssessmentImpl _value, $Res Function(_$AssessmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fairId = null,
    Object? message = null,
    Object? pagesSummary = null,
  }) {
    return _then(_$AssessmentImpl(
      fairId: null == fairId
          ? _value.fairId
          : fairId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pagesSummary: null == pagesSummary
          ? _value.pagesSummary
          : pagesSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentImpl implements _Assessment {
  const _$AssessmentImpl(
      {this.fairId = 0, this.message = '', this.pagesSummary = ''});

  factory _$AssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentImplFromJson(json);

  @override
  @JsonKey()
  final int fairId;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String pagesSummary;

  @override
  String toString() {
    return 'Assessment(fairId: $fairId, message: $message, pagesSummary: $pagesSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentImpl &&
            (identical(other.fairId, fairId) || other.fairId == fairId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pagesSummary, pagesSummary) ||
                other.pagesSummary == pagesSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fairId, message, pagesSummary);

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      __$$AssessmentImplCopyWithImpl<_$AssessmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentImplToJson(
      this,
    );
  }
}

abstract class _Assessment implements Assessment {
  const factory _Assessment(
      {final int fairId,
      final String message,
      final String pagesSummary}) = _$AssessmentImpl;

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$AssessmentImpl.fromJson;

  @override
  int get fairId;
  @override
  String get message;
  @override
  String get pagesSummary;

  /// Create a copy of Assessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
