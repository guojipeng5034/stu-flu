import 'package:freezed_annotation/freezed_annotation.dart';
import 'abs_playpath.dart';

part 'talk_playpath.freezed.dart';
part 'talk_playpath.g.dart';

/// Talk播放路径数据模型
///
/// 用于Talk平台的播放路径配置
@freezed
class TalkPlaypath with _$TalkPlaypath implements AbsPlayPath {
  const factory TalkPlaypath({
    String? playpath,
    String? serial,
    String? recordtitle,
    String? recordpath,
  }) = _TalkPlaypath;

  const TalkPlaypath._();

  /// 从 JSON 创建 TalkPlaypath 实例
  factory TalkPlaypath.fromJson(Map<String, dynamic> json) => _$TalkPlaypathFromJson(json);

  @override
  String getPlayPathUrl() {
    return '${playpath ?? ''}?serial=${serial ?? ''}'
        '&recordtitle=${recordtitle ?? ''}'
        '&recordpath=${recordpath ?? ''}'
        '&playback_classroom_type=1';
  }
}
