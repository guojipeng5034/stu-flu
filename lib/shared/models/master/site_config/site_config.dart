import 'package:cptop/core/utils/json_converters.dart' show CTBoolConverter;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/shared/index.dart';

part 'site_config.freezed.dart';
part 'site_config.g.dart';

/// 站点配置数据模型
///
/// 使用 freezed 自动生成 copyWith、toString、hashCode、== 等方法
/// 使用 json_serializable 自动处理 JSON 序列化/反序列化
/// 使用 @JsonKey 注解处理特殊字段映射，常规字段可省略注解
@freezed
class SiteConfig with _$SiteConfig {
  const factory SiteConfig({
    int? siteId,
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
    @CTBoolConverter() @Default(false) bool specialLessonAllow,
    @CTBoolConverter() @Default(false) bool useFixing,
  }) = _SiteConfig;

  factory SiteConfig.fromJson(Map<String, dynamic> json) =>
      _$SiteConfigFromJson(json);
}


@freezed
class Fixing with _$Fixing {
  const factory Fixing({
    @CTBoolConverter()  @Default(false) bool available,
  }) = _Fixing;

  factory Fixing.fromJson(Map<String, dynamic> json) => _$FixingFromJson(json);
}

@freezed
class Game with _$Game {
  const factory Game({
    @CTBoolConverter()  @Default(false) bool canPlayPuzzleGame,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}



// SupportLanguage 类已移动到 lib/shared/models/network/support_lang/
// 现在统一使用 SupportLang 类

/// Master配置容器类
///
/// 包含所有站点配置的容器
@freezed
class MasterConfig with _$MasterConfig {
  const factory MasterConfig({
    @Default([]) List<SiteConfig> data,
  }) = _MasterConfig;

  factory MasterConfig.fromJson(Map<String, dynamic> json) =>
      _$MasterConfigFromJson(json);
}
