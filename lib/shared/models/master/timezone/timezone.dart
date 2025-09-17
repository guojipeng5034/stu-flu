import 'package:freezed_annotation/freezed_annotation.dart';

part 'timezone.freezed.dart';
part 'timezone.g.dart';

/// 时区数据模型
/// 
/// 对应Android项目中的TimeZoneBean类
@freezed
class TimeZoneBean with _$TimeZoneBean {
  const factory TimeZoneBean({
    int? id,
    String? label,
    String? offset,
    String? name,
  }) = _TimeZoneBean;

  factory TimeZoneBean.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneBeanFromJson(json);
}

/// 时区列表数据模型
@freezed
class TimeZoneList with _$TimeZoneList {
  const factory TimeZoneList({
    @JsonKey(name: 'TimeZone') List<TimeZoneBean>? timeZone,
  }) = _TimeZoneList;

  factory TimeZoneList.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneListFromJson(json);
}
