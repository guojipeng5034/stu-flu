import 'package:dart_mappable/dart_mappable.dart';

part 'common_result.mapper.dart';

/// 通用API响应包装类
@MappableClass(
  caseStyle: CaseStyle.camelCase,
)
class CommonResult<T> with CommonResultMappable<T> {
  /// 响应状态码
  final int code;

  /// 响应数据
  final T? data;

  /// 响应消息
  final String? msg;

  CommonResult({
    required this.code,
    this.data,
    this.msg,
  });

  /// 判断请求是否成功
  bool get isSuccess => code == 0;

  static const fromJson = CommonResultMapper.fromJson;
}
