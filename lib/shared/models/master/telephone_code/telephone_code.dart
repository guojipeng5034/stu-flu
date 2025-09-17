import 'package:freezed_annotation/freezed_annotation.dart';

part 'telephone_code.freezed.dart';
part 'telephone_code.g.dart';

/// 电话区号数据模型
/// 
/// 对应Android项目中的DataBean类
@freezed
class TelephoneCodeBean with _$TelephoneCodeBean {
  const factory TelephoneCodeBean({
    String? code,
    String? name,
    String? country,
  }) = _TelephoneCodeBean;

  factory TelephoneCodeBean.fromJson(Map<String, dynamic> json) =>
      _$TelephoneCodeBeanFromJson(json);
}

/// 电话区号列表数据模型
@freezed
class TelephoneCodeList with _$TelephoneCodeList {
  const factory TelephoneCodeList({
    List<TelephoneCodeBean>? data,
  }) = _TelephoneCodeList;

  factory TelephoneCodeList.fromJson(Map<String, dynamic> json) =>
      _$TelephoneCodeListFromJson(json);
}
