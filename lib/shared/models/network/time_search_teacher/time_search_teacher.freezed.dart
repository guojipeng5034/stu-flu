// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_search_teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeSearchTeacher _$TimeSearchTeacherFromJson(Map<String, dynamic> json) {
  return _TimeSearchTeacher.fromJson(json);
}

/// @nodoc
mixin _$TimeSearchTeacher {
  TimeSearchTeacherData? get data => throw _privateConstructorUsedError;
  int get isSuccess => throw _privateConstructorUsedError;
  String? get serviceName => throw _privateConstructorUsedError;
  List<dynamic> get errors => throw _privateConstructorUsedError;

  /// Serializes this TimeSearchTeacher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSearchTeacherCopyWith<TimeSearchTeacher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSearchTeacherCopyWith<$Res> {
  factory $TimeSearchTeacherCopyWith(
          TimeSearchTeacher value, $Res Function(TimeSearchTeacher) then) =
      _$TimeSearchTeacherCopyWithImpl<$Res, TimeSearchTeacher>;
  @useResult
  $Res call(
      {TimeSearchTeacherData? data,
      int isSuccess,
      String? serviceName,
      List<dynamic> errors});

  $TimeSearchTeacherDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TimeSearchTeacherCopyWithImpl<$Res, $Val extends TimeSearchTeacher>
    implements $TimeSearchTeacherCopyWith<$Res> {
  _$TimeSearchTeacherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isSuccess = null,
    Object? serviceName = freezed,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TimeSearchTeacherData?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeSearchTeacherDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TimeSearchTeacherDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimeSearchTeacherImplCopyWith<$Res>
    implements $TimeSearchTeacherCopyWith<$Res> {
  factory _$$TimeSearchTeacherImplCopyWith(_$TimeSearchTeacherImpl value,
          $Res Function(_$TimeSearchTeacherImpl) then) =
      __$$TimeSearchTeacherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimeSearchTeacherData? data,
      int isSuccess,
      String? serviceName,
      List<dynamic> errors});

  @override
  $TimeSearchTeacherDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TimeSearchTeacherImplCopyWithImpl<$Res>
    extends _$TimeSearchTeacherCopyWithImpl<$Res, _$TimeSearchTeacherImpl>
    implements _$$TimeSearchTeacherImplCopyWith<$Res> {
  __$$TimeSearchTeacherImplCopyWithImpl(_$TimeSearchTeacherImpl _value,
      $Res Function(_$TimeSearchTeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isSuccess = null,
    Object? serviceName = freezed,
    Object? errors = null,
  }) {
    return _then(_$TimeSearchTeacherImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TimeSearchTeacherData?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: freezed == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSearchTeacherImpl implements _TimeSearchTeacher {
  const _$TimeSearchTeacherImpl(
      {this.data,
      this.isSuccess = 0,
      this.serviceName,
      final List<dynamic> errors = const []})
      : _errors = errors;

  factory _$TimeSearchTeacherImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSearchTeacherImplFromJson(json);

  @override
  final TimeSearchTeacherData? data;
  @override
  @JsonKey()
  final int isSuccess;
  @override
  final String? serviceName;
  final List<dynamic> _errors;
  @override
  @JsonKey()
  List<dynamic> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'TimeSearchTeacher(data: $data, isSuccess: $isSuccess, serviceName: $serviceName, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSearchTeacherImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, isSuccess, serviceName,
      const DeepCollectionEquality().hash(_errors));

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSearchTeacherImplCopyWith<_$TimeSearchTeacherImpl> get copyWith =>
      __$$TimeSearchTeacherImplCopyWithImpl<_$TimeSearchTeacherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSearchTeacherImplToJson(
      this,
    );
  }
}

abstract class _TimeSearchTeacher implements TimeSearchTeacher {
  const factory _TimeSearchTeacher(
      {final TimeSearchTeacherData? data,
      final int isSuccess,
      final String? serviceName,
      final List<dynamic> errors}) = _$TimeSearchTeacherImpl;

  factory _TimeSearchTeacher.fromJson(Map<String, dynamic> json) =
      _$TimeSearchTeacherImpl.fromJson;

  @override
  TimeSearchTeacherData? get data;
  @override
  int get isSuccess;
  @override
  String? get serviceName;
  @override
  List<dynamic> get errors;

  /// Create a copy of TimeSearchTeacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSearchTeacherImplCopyWith<_$TimeSearchTeacherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSearchTeacherData _$TimeSearchTeacherDataFromJson(
    Map<String, dynamic> json) {
  return _TimeSearchTeacherData.fromJson(json);
}

/// @nodoc
mixin _$TimeSearchTeacherData {
  @CTBoolConverter()
  bool get canReserve => throw _privateConstructorUsedError;
  List<Teacher> get list => throw _privateConstructorUsedError;
  Page? get pager => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get requireFtl => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get requireLogin => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get requireSubscription => throw _privateConstructorUsedError;

  /// Serializes this TimeSearchTeacherData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSearchTeacherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSearchTeacherDataCopyWith<TimeSearchTeacherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSearchTeacherDataCopyWith<$Res> {
  factory $TimeSearchTeacherDataCopyWith(TimeSearchTeacherData value,
          $Res Function(TimeSearchTeacherData) then) =
      _$TimeSearchTeacherDataCopyWithImpl<$Res, TimeSearchTeacherData>;
  @useResult
  $Res call(
      {@CTBoolConverter() bool canReserve,
      List<Teacher> list,
      Page? pager,
      @CTBoolConverter() bool requireFtl,
      @CTBoolConverter() bool requireLogin,
      @CTBoolConverter() bool requireSubscription});

  $PageCopyWith<$Res>? get pager;
}

/// @nodoc
class _$TimeSearchTeacherDataCopyWithImpl<$Res,
        $Val extends TimeSearchTeacherData>
    implements $TimeSearchTeacherDataCopyWith<$Res> {
  _$TimeSearchTeacherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSearchTeacherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canReserve = null,
    Object? list = null,
    Object? pager = freezed,
    Object? requireFtl = null,
    Object? requireLogin = null,
    Object? requireSubscription = null,
  }) {
    return _then(_value.copyWith(
      canReserve: null == canReserve
          ? _value.canReserve
          : canReserve // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Teacher>,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Page?,
      requireFtl: null == requireFtl
          ? _value.requireFtl
          : requireFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      requireLogin: null == requireLogin
          ? _value.requireLogin
          : requireLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      requireSubscription: null == requireSubscription
          ? _value.requireSubscription
          : requireSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TimeSearchTeacherData
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
abstract class _$$TimeSearchTeacherDataImplCopyWith<$Res>
    implements $TimeSearchTeacherDataCopyWith<$Res> {
  factory _$$TimeSearchTeacherDataImplCopyWith(
          _$TimeSearchTeacherDataImpl value,
          $Res Function(_$TimeSearchTeacherDataImpl) then) =
      __$$TimeSearchTeacherDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@CTBoolConverter() bool canReserve,
      List<Teacher> list,
      Page? pager,
      @CTBoolConverter() bool requireFtl,
      @CTBoolConverter() bool requireLogin,
      @CTBoolConverter() bool requireSubscription});

  @override
  $PageCopyWith<$Res>? get pager;
}

/// @nodoc
class __$$TimeSearchTeacherDataImplCopyWithImpl<$Res>
    extends _$TimeSearchTeacherDataCopyWithImpl<$Res,
        _$TimeSearchTeacherDataImpl>
    implements _$$TimeSearchTeacherDataImplCopyWith<$Res> {
  __$$TimeSearchTeacherDataImplCopyWithImpl(_$TimeSearchTeacherDataImpl _value,
      $Res Function(_$TimeSearchTeacherDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeSearchTeacherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canReserve = null,
    Object? list = null,
    Object? pager = freezed,
    Object? requireFtl = null,
    Object? requireLogin = null,
    Object? requireSubscription = null,
  }) {
    return _then(_$TimeSearchTeacherDataImpl(
      canReserve: null == canReserve
          ? _value.canReserve
          : canReserve // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Teacher>,
      pager: freezed == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Page?,
      requireFtl: null == requireFtl
          ? _value.requireFtl
          : requireFtl // ignore: cast_nullable_to_non_nullable
              as bool,
      requireLogin: null == requireLogin
          ? _value.requireLogin
          : requireLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      requireSubscription: null == requireSubscription
          ? _value.requireSubscription
          : requireSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSearchTeacherDataImpl implements _TimeSearchTeacherData {
  const _$TimeSearchTeacherDataImpl(
      {@CTBoolConverter() this.canReserve = false,
      final List<Teacher> list = const [],
      this.pager,
      @CTBoolConverter() this.requireFtl = false,
      @CTBoolConverter() this.requireLogin = false,
      @CTBoolConverter() this.requireSubscription = false})
      : _list = list;

  factory _$TimeSearchTeacherDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSearchTeacherDataImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool canReserve;
  final List<Teacher> _list;
  @override
  @JsonKey()
  List<Teacher> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final Page? pager;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool requireFtl;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool requireLogin;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool requireSubscription;

  @override
  String toString() {
    return 'TimeSearchTeacherData(canReserve: $canReserve, list: $list, pager: $pager, requireFtl: $requireFtl, requireLogin: $requireLogin, requireSubscription: $requireSubscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSearchTeacherDataImpl &&
            (identical(other.canReserve, canReserve) ||
                other.canReserve == canReserve) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.pager, pager) || other.pager == pager) &&
            (identical(other.requireFtl, requireFtl) ||
                other.requireFtl == requireFtl) &&
            (identical(other.requireLogin, requireLogin) ||
                other.requireLogin == requireLogin) &&
            (identical(other.requireSubscription, requireSubscription) ||
                other.requireSubscription == requireSubscription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      canReserve,
      const DeepCollectionEquality().hash(_list),
      pager,
      requireFtl,
      requireLogin,
      requireSubscription);

  /// Create a copy of TimeSearchTeacherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSearchTeacherDataImplCopyWith<_$TimeSearchTeacherDataImpl>
      get copyWith => __$$TimeSearchTeacherDataImplCopyWithImpl<
          _$TimeSearchTeacherDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSearchTeacherDataImplToJson(
      this,
    );
  }
}

abstract class _TimeSearchTeacherData implements TimeSearchTeacherData {
  const factory _TimeSearchTeacherData(
          {@CTBoolConverter() final bool canReserve,
          final List<Teacher> list,
          final Page? pager,
          @CTBoolConverter() final bool requireFtl,
          @CTBoolConverter() final bool requireLogin,
          @CTBoolConverter() final bool requireSubscription}) =
      _$TimeSearchTeacherDataImpl;

  factory _TimeSearchTeacherData.fromJson(Map<String, dynamic> json) =
      _$TimeSearchTeacherDataImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get canReserve;
  @override
  List<Teacher> get list;
  @override
  Page? get pager;
  @override
  @CTBoolConverter()
  bool get requireFtl;
  @override
  @CTBoolConverter()
  bool get requireLogin;
  @override
  @CTBoolConverter()
  bool get requireSubscription;

  /// Create a copy of TimeSearchTeacherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSearchTeacherDataImplCopyWith<_$TimeSearchTeacherDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
