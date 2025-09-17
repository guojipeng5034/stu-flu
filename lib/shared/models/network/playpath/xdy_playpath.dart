import 'package:freezed_annotation/freezed_annotation.dart';
import 'abs_playpath.dart';

part 'xdy_playpath.freezed.dart';
part 'xdy_playpath.g.dart';

/// 学点云播放路径数据模型
///
/// 用于学点云平台的播放路径配置
@freezed
class XdyPlaypath with _$XdyPlaypath implements AbsPlayPath {
  const factory XdyPlaypath({
    String? playpath,
    String? defaultVideoToolProvider,
    String? lessonId,
  }) = _XdyPlaypath;

  const XdyPlaypath._();

  /// 从 JSON 创建 XdyPlaypath 实例
  factory XdyPlaypath.fromJson(Map<String, dynamic> json) => _$XdyPlaypathFromJson(json);

  @override
  String getPlayPathUrl() {
    return playpath ?? '';
  }
}
