// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiteConfig _$SiteConfigFromJson(Map<String, dynamic> json) {
  return _SiteConfig.fromJson(json);
}

/// @nodoc
mixin _$SiteConfig {
  int? get siteId => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get countryDefault => throw _privateConstructorUsedError;
  String? get defaultTimeZone => throw _privateConstructorUsedError;
  List<Banner>? get aigcBanner => throw _privateConstructorUsedError;
  List<Curriculum>? get aigcCurriculum => throw _privateConstructorUsedError;
  String? get aigcDomain => throw _privateConstructorUsedError;
  Fixing? get fixing => throw _privateConstructorUsedError;
  Game? get game => throw _privateConstructorUsedError;
  List<Banner>? get groupBanner => throw _privateConstructorUsedError;
  List<String>? get studentNameOrder => throw _privateConstructorUsedError;
  List<SupportLang>? get supportLang => throw _privateConstructorUsedError;
  String? get telephoneCodeDefault => throw _privateConstructorUsedError;
  String? get uriHttpsBase => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get specialLessonAllow => throw _privateConstructorUsedError;
  @CTBoolConverter()
  bool get useFixing => throw _privateConstructorUsedError;

  /// Serializes this SiteConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteConfigCopyWith<SiteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteConfigCopyWith<$Res> {
  factory $SiteConfigCopyWith(
          SiteConfig value, $Res Function(SiteConfig) then) =
      _$SiteConfigCopyWithImpl<$Res, SiteConfig>;
  @useResult
  $Res call(
      {int? siteId,
      String? label,
      String? countryDefault,
      String? defaultTimeZone,
      List<Banner>? aigcBanner,
      List<Curriculum>? aigcCurriculum,
      String? aigcDomain,
      Fixing? fixing,
      Game? game,
      List<Banner>? groupBanner,
      List<String>? studentNameOrder,
      List<SupportLang>? supportLang,
      String? telephoneCodeDefault,
      String? uriHttpsBase,
      @CTBoolConverter() bool specialLessonAllow,
      @CTBoolConverter() bool useFixing});

  $FixingCopyWith<$Res>? get fixing;
  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class _$SiteConfigCopyWithImpl<$Res, $Val extends SiteConfig>
    implements $SiteConfigCopyWith<$Res> {
  _$SiteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = freezed,
    Object? label = freezed,
    Object? countryDefault = freezed,
    Object? defaultTimeZone = freezed,
    Object? aigcBanner = freezed,
    Object? aigcCurriculum = freezed,
    Object? aigcDomain = freezed,
    Object? fixing = freezed,
    Object? game = freezed,
    Object? groupBanner = freezed,
    Object? studentNameOrder = freezed,
    Object? supportLang = freezed,
    Object? telephoneCodeDefault = freezed,
    Object? uriHttpsBase = freezed,
    Object? specialLessonAllow = null,
    Object? useFixing = null,
  }) {
    return _then(_value.copyWith(
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDefault: freezed == countryDefault
          ? _value.countryDefault
          : countryDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTimeZone: freezed == defaultTimeZone
          ? _value.defaultTimeZone
          : defaultTimeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      aigcBanner: freezed == aigcBanner
          ? _value.aigcBanner
          : aigcBanner // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
      aigcCurriculum: freezed == aigcCurriculum
          ? _value.aigcCurriculum
          : aigcCurriculum // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>?,
      aigcDomain: freezed == aigcDomain
          ? _value.aigcDomain
          : aigcDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      fixing: freezed == fixing
          ? _value.fixing
          : fixing // ignore: cast_nullable_to_non_nullable
              as Fixing?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game?,
      groupBanner: freezed == groupBanner
          ? _value.groupBanner
          : groupBanner // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
      studentNameOrder: freezed == studentNameOrder
          ? _value.studentNameOrder
          : studentNameOrder // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supportLang: freezed == supportLang
          ? _value.supportLang
          : supportLang // ignore: cast_nullable_to_non_nullable
              as List<SupportLang>?,
      telephoneCodeDefault: freezed == telephoneCodeDefault
          ? _value.telephoneCodeDefault
          : telephoneCodeDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      uriHttpsBase: freezed == uriHttpsBase
          ? _value.uriHttpsBase
          : uriHttpsBase // ignore: cast_nullable_to_non_nullable
              as String?,
      specialLessonAllow: null == specialLessonAllow
          ? _value.specialLessonAllow
          : specialLessonAllow // ignore: cast_nullable_to_non_nullable
              as bool,
      useFixing: null == useFixing
          ? _value.useFixing
          : useFixing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FixingCopyWith<$Res>? get fixing {
    if (_value.fixing == null) {
      return null;
    }

    return $FixingCopyWith<$Res>(_value.fixing!, (value) {
      return _then(_value.copyWith(fixing: value) as $Val);
    });
  }

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameCopyWith<$Res>? get game {
    if (_value.game == null) {
      return null;
    }

    return $GameCopyWith<$Res>(_value.game!, (value) {
      return _then(_value.copyWith(game: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiteConfigImplCopyWith<$Res>
    implements $SiteConfigCopyWith<$Res> {
  factory _$$SiteConfigImplCopyWith(
          _$SiteConfigImpl value, $Res Function(_$SiteConfigImpl) then) =
      __$$SiteConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? siteId,
      String? label,
      String? countryDefault,
      String? defaultTimeZone,
      List<Banner>? aigcBanner,
      List<Curriculum>? aigcCurriculum,
      String? aigcDomain,
      Fixing? fixing,
      Game? game,
      List<Banner>? groupBanner,
      List<String>? studentNameOrder,
      List<SupportLang>? supportLang,
      String? telephoneCodeDefault,
      String? uriHttpsBase,
      @CTBoolConverter() bool specialLessonAllow,
      @CTBoolConverter() bool useFixing});

  @override
  $FixingCopyWith<$Res>? get fixing;
  @override
  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class __$$SiteConfigImplCopyWithImpl<$Res>
    extends _$SiteConfigCopyWithImpl<$Res, _$SiteConfigImpl>
    implements _$$SiteConfigImplCopyWith<$Res> {
  __$$SiteConfigImplCopyWithImpl(
      _$SiteConfigImpl _value, $Res Function(_$SiteConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = freezed,
    Object? label = freezed,
    Object? countryDefault = freezed,
    Object? defaultTimeZone = freezed,
    Object? aigcBanner = freezed,
    Object? aigcCurriculum = freezed,
    Object? aigcDomain = freezed,
    Object? fixing = freezed,
    Object? game = freezed,
    Object? groupBanner = freezed,
    Object? studentNameOrder = freezed,
    Object? supportLang = freezed,
    Object? telephoneCodeDefault = freezed,
    Object? uriHttpsBase = freezed,
    Object? specialLessonAllow = null,
    Object? useFixing = null,
  }) {
    return _then(_$SiteConfigImpl(
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDefault: freezed == countryDefault
          ? _value.countryDefault
          : countryDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTimeZone: freezed == defaultTimeZone
          ? _value.defaultTimeZone
          : defaultTimeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      aigcBanner: freezed == aigcBanner
          ? _value._aigcBanner
          : aigcBanner // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
      aigcCurriculum: freezed == aigcCurriculum
          ? _value._aigcCurriculum
          : aigcCurriculum // ignore: cast_nullable_to_non_nullable
              as List<Curriculum>?,
      aigcDomain: freezed == aigcDomain
          ? _value.aigcDomain
          : aigcDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      fixing: freezed == fixing
          ? _value.fixing
          : fixing // ignore: cast_nullable_to_non_nullable
              as Fixing?,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game?,
      groupBanner: freezed == groupBanner
          ? _value._groupBanner
          : groupBanner // ignore: cast_nullable_to_non_nullable
              as List<Banner>?,
      studentNameOrder: freezed == studentNameOrder
          ? _value._studentNameOrder
          : studentNameOrder // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supportLang: freezed == supportLang
          ? _value._supportLang
          : supportLang // ignore: cast_nullable_to_non_nullable
              as List<SupportLang>?,
      telephoneCodeDefault: freezed == telephoneCodeDefault
          ? _value.telephoneCodeDefault
          : telephoneCodeDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      uriHttpsBase: freezed == uriHttpsBase
          ? _value.uriHttpsBase
          : uriHttpsBase // ignore: cast_nullable_to_non_nullable
              as String?,
      specialLessonAllow: null == specialLessonAllow
          ? _value.specialLessonAllow
          : specialLessonAllow // ignore: cast_nullable_to_non_nullable
              as bool,
      useFixing: null == useFixing
          ? _value.useFixing
          : useFixing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteConfigImpl implements _SiteConfig {
  const _$SiteConfigImpl(
      {this.siteId,
      this.label,
      this.countryDefault,
      this.defaultTimeZone,
      final List<Banner>? aigcBanner,
      final List<Curriculum>? aigcCurriculum,
      this.aigcDomain,
      this.fixing,
      this.game,
      final List<Banner>? groupBanner,
      final List<String>? studentNameOrder,
      final List<SupportLang>? supportLang,
      this.telephoneCodeDefault,
      this.uriHttpsBase,
      @CTBoolConverter() this.specialLessonAllow = false,
      @CTBoolConverter() this.useFixing = false})
      : _aigcBanner = aigcBanner,
        _aigcCurriculum = aigcCurriculum,
        _groupBanner = groupBanner,
        _studentNameOrder = studentNameOrder,
        _supportLang = supportLang;

  factory _$SiteConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteConfigImplFromJson(json);

  @override
  final int? siteId;
  @override
  final String? label;
  @override
  final String? countryDefault;
  @override
  final String? defaultTimeZone;
  final List<Banner>? _aigcBanner;
  @override
  List<Banner>? get aigcBanner {
    final value = _aigcBanner;
    if (value == null) return null;
    if (_aigcBanner is EqualUnmodifiableListView) return _aigcBanner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Curriculum>? _aigcCurriculum;
  @override
  List<Curriculum>? get aigcCurriculum {
    final value = _aigcCurriculum;
    if (value == null) return null;
    if (_aigcCurriculum is EqualUnmodifiableListView) return _aigcCurriculum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? aigcDomain;
  @override
  final Fixing? fixing;
  @override
  final Game? game;
  final List<Banner>? _groupBanner;
  @override
  List<Banner>? get groupBanner {
    final value = _groupBanner;
    if (value == null) return null;
    if (_groupBanner is EqualUnmodifiableListView) return _groupBanner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _studentNameOrder;
  @override
  List<String>? get studentNameOrder {
    final value = _studentNameOrder;
    if (value == null) return null;
    if (_studentNameOrder is EqualUnmodifiableListView)
      return _studentNameOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SupportLang>? _supportLang;
  @override
  List<SupportLang>? get supportLang {
    final value = _supportLang;
    if (value == null) return null;
    if (_supportLang is EqualUnmodifiableListView) return _supportLang;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? telephoneCodeDefault;
  @override
  final String? uriHttpsBase;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool specialLessonAllow;
  @override
  @JsonKey()
  @CTBoolConverter()
  final bool useFixing;

  @override
  String toString() {
    return 'SiteConfig(siteId: $siteId, label: $label, countryDefault: $countryDefault, defaultTimeZone: $defaultTimeZone, aigcBanner: $aigcBanner, aigcCurriculum: $aigcCurriculum, aigcDomain: $aigcDomain, fixing: $fixing, game: $game, groupBanner: $groupBanner, studentNameOrder: $studentNameOrder, supportLang: $supportLang, telephoneCodeDefault: $telephoneCodeDefault, uriHttpsBase: $uriHttpsBase, specialLessonAllow: $specialLessonAllow, useFixing: $useFixing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteConfigImpl &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.countryDefault, countryDefault) ||
                other.countryDefault == countryDefault) &&
            (identical(other.defaultTimeZone, defaultTimeZone) ||
                other.defaultTimeZone == defaultTimeZone) &&
            const DeepCollectionEquality()
                .equals(other._aigcBanner, _aigcBanner) &&
            const DeepCollectionEquality()
                .equals(other._aigcCurriculum, _aigcCurriculum) &&
            (identical(other.aigcDomain, aigcDomain) ||
                other.aigcDomain == aigcDomain) &&
            (identical(other.fixing, fixing) || other.fixing == fixing) &&
            (identical(other.game, game) || other.game == game) &&
            const DeepCollectionEquality()
                .equals(other._groupBanner, _groupBanner) &&
            const DeepCollectionEquality()
                .equals(other._studentNameOrder, _studentNameOrder) &&
            const DeepCollectionEquality()
                .equals(other._supportLang, _supportLang) &&
            (identical(other.telephoneCodeDefault, telephoneCodeDefault) ||
                other.telephoneCodeDefault == telephoneCodeDefault) &&
            (identical(other.uriHttpsBase, uriHttpsBase) ||
                other.uriHttpsBase == uriHttpsBase) &&
            (identical(other.specialLessonAllow, specialLessonAllow) ||
                other.specialLessonAllow == specialLessonAllow) &&
            (identical(other.useFixing, useFixing) ||
                other.useFixing == useFixing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      siteId,
      label,
      countryDefault,
      defaultTimeZone,
      const DeepCollectionEquality().hash(_aigcBanner),
      const DeepCollectionEquality().hash(_aigcCurriculum),
      aigcDomain,
      fixing,
      game,
      const DeepCollectionEquality().hash(_groupBanner),
      const DeepCollectionEquality().hash(_studentNameOrder),
      const DeepCollectionEquality().hash(_supportLang),
      telephoneCodeDefault,
      uriHttpsBase,
      specialLessonAllow,
      useFixing);

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteConfigImplCopyWith<_$SiteConfigImpl> get copyWith =>
      __$$SiteConfigImplCopyWithImpl<_$SiteConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteConfigImplToJson(
      this,
    );
  }
}

abstract class _SiteConfig implements SiteConfig {
  const factory _SiteConfig(
      {final int? siteId,
      final String? label,
      final String? countryDefault,
      final String? defaultTimeZone,
      final List<Banner>? aigcBanner,
      final List<Curriculum>? aigcCurriculum,
      final String? aigcDomain,
      final Fixing? fixing,
      final Game? game,
      final List<Banner>? groupBanner,
      final List<String>? studentNameOrder,
      final List<SupportLang>? supportLang,
      final String? telephoneCodeDefault,
      final String? uriHttpsBase,
      @CTBoolConverter() final bool specialLessonAllow,
      @CTBoolConverter() final bool useFixing}) = _$SiteConfigImpl;

  factory _SiteConfig.fromJson(Map<String, dynamic> json) =
      _$SiteConfigImpl.fromJson;

  @override
  int? get siteId;
  @override
  String? get label;
  @override
  String? get countryDefault;
  @override
  String? get defaultTimeZone;
  @override
  List<Banner>? get aigcBanner;
  @override
  List<Curriculum>? get aigcCurriculum;
  @override
  String? get aigcDomain;
  @override
  Fixing? get fixing;
  @override
  Game? get game;
  @override
  List<Banner>? get groupBanner;
  @override
  List<String>? get studentNameOrder;
  @override
  List<SupportLang>? get supportLang;
  @override
  String? get telephoneCodeDefault;
  @override
  String? get uriHttpsBase;
  @override
  @CTBoolConverter()
  bool get specialLessonAllow;
  @override
  @CTBoolConverter()
  bool get useFixing;

  /// Create a copy of SiteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteConfigImplCopyWith<_$SiteConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Fixing _$FixingFromJson(Map<String, dynamic> json) {
  return _Fixing.fromJson(json);
}

/// @nodoc
mixin _$Fixing {
  @CTBoolConverter()
  bool get available => throw _privateConstructorUsedError;

  /// Serializes this Fixing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fixing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FixingCopyWith<Fixing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixingCopyWith<$Res> {
  factory $FixingCopyWith(Fixing value, $Res Function(Fixing) then) =
      _$FixingCopyWithImpl<$Res, Fixing>;
  @useResult
  $Res call({@CTBoolConverter() bool available});
}

/// @nodoc
class _$FixingCopyWithImpl<$Res, $Val extends Fixing>
    implements $FixingCopyWith<$Res> {
  _$FixingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fixing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FixingImplCopyWith<$Res> implements $FixingCopyWith<$Res> {
  factory _$$FixingImplCopyWith(
          _$FixingImpl value, $Res Function(_$FixingImpl) then) =
      __$$FixingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@CTBoolConverter() bool available});
}

/// @nodoc
class __$$FixingImplCopyWithImpl<$Res>
    extends _$FixingCopyWithImpl<$Res, _$FixingImpl>
    implements _$$FixingImplCopyWith<$Res> {
  __$$FixingImplCopyWithImpl(
      _$FixingImpl _value, $Res Function(_$FixingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fixing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_$FixingImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FixingImpl implements _Fixing {
  const _$FixingImpl({@CTBoolConverter() this.available = false});

  factory _$FixingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FixingImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool available;

  @override
  String toString() {
    return 'Fixing(available: $available)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixingImpl &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, available);

  /// Create a copy of Fixing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FixingImplCopyWith<_$FixingImpl> get copyWith =>
      __$$FixingImplCopyWithImpl<_$FixingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FixingImplToJson(
      this,
    );
  }
}

abstract class _Fixing implements Fixing {
  const factory _Fixing({@CTBoolConverter() final bool available}) =
      _$FixingImpl;

  factory _Fixing.fromJson(Map<String, dynamic> json) = _$FixingImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get available;

  /// Create a copy of Fixing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FixingImplCopyWith<_$FixingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  @CTBoolConverter()
  bool get canPlayPuzzleGame => throw _privateConstructorUsedError;

  /// Serializes this Game to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call({@CTBoolConverter() bool canPlayPuzzleGame});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canPlayPuzzleGame = null,
  }) {
    return _then(_value.copyWith(
      canPlayPuzzleGame: null == canPlayPuzzleGame
          ? _value.canPlayPuzzleGame
          : canPlayPuzzleGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@CTBoolConverter() bool canPlayPuzzleGame});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canPlayPuzzleGame = null,
  }) {
    return _then(_$GameImpl(
      canPlayPuzzleGame: null == canPlayPuzzleGame
          ? _value.canPlayPuzzleGame
          : canPlayPuzzleGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameImpl implements _Game {
  const _$GameImpl({@CTBoolConverter() this.canPlayPuzzleGame = false});

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  @JsonKey()
  @CTBoolConverter()
  final bool canPlayPuzzleGame;

  @override
  String toString() {
    return 'Game(canPlayPuzzleGame: $canPlayPuzzleGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.canPlayPuzzleGame, canPlayPuzzleGame) ||
                other.canPlayPuzzleGame == canPlayPuzzleGame));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, canPlayPuzzleGame);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game({@CTBoolConverter() final bool canPlayPuzzleGame}) =
      _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  @CTBoolConverter()
  bool get canPlayPuzzleGame;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MasterConfig _$MasterConfigFromJson(Map<String, dynamic> json) {
  return _MasterConfig.fromJson(json);
}

/// @nodoc
mixin _$MasterConfig {
  List<SiteConfig> get data => throw _privateConstructorUsedError;

  /// Serializes this MasterConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterConfigCopyWith<MasterConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterConfigCopyWith<$Res> {
  factory $MasterConfigCopyWith(
          MasterConfig value, $Res Function(MasterConfig) then) =
      _$MasterConfigCopyWithImpl<$Res, MasterConfig>;
  @useResult
  $Res call({List<SiteConfig> data});
}

/// @nodoc
class _$MasterConfigCopyWithImpl<$Res, $Val extends MasterConfig>
    implements $MasterConfigCopyWith<$Res> {
  _$MasterConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SiteConfig>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterConfigImplCopyWith<$Res>
    implements $MasterConfigCopyWith<$Res> {
  factory _$$MasterConfigImplCopyWith(
          _$MasterConfigImpl value, $Res Function(_$MasterConfigImpl) then) =
      __$$MasterConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SiteConfig> data});
}

/// @nodoc
class __$$MasterConfigImplCopyWithImpl<$Res>
    extends _$MasterConfigCopyWithImpl<$Res, _$MasterConfigImpl>
    implements _$$MasterConfigImplCopyWith<$Res> {
  __$$MasterConfigImplCopyWithImpl(
      _$MasterConfigImpl _value, $Res Function(_$MasterConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MasterConfigImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SiteConfig>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasterConfigImpl implements _MasterConfig {
  const _$MasterConfigImpl({final List<SiteConfig> data = const []})
      : _data = data;

  factory _$MasterConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterConfigImplFromJson(json);

  final List<SiteConfig> _data;
  @override
  @JsonKey()
  List<SiteConfig> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MasterConfig(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterConfigImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of MasterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterConfigImplCopyWith<_$MasterConfigImpl> get copyWith =>
      __$$MasterConfigImplCopyWithImpl<_$MasterConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterConfigImplToJson(
      this,
    );
  }
}

abstract class _MasterConfig implements MasterConfig {
  const factory _MasterConfig({final List<SiteConfig> data}) =
      _$MasterConfigImpl;

  factory _MasterConfig.fromJson(Map<String, dynamic> json) =
      _$MasterConfigImpl.fromJson;

  @override
  List<SiteConfig> get data;

  /// Create a copy of MasterConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterConfigImplCopyWith<_$MasterConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
