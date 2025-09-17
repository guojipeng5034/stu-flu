import 'page.dart';

/// Page类的扩展方法
extension PageX on Page {
  /// 获取计数的整数值
  int get countsInt => int.tryParse(counts ?? '0') ?? 0;

  /// 获取限制的整数值
  int get limitInt => int.tryParse(limit ?? '0') ?? 0;

  /// 获取偏移量的整数值
  int get offsetInt => int.tryParse(offset ?? '0') ?? 0;

  /// 获取总数的整数值
  int get totalInt => int.tryParse(total ?? '0') ?? 0;

  /// 检查是否有下一页
  bool get hasNext => next > 0;

  /// 检查是否有上一页
  bool get hasPrev => prev != null;

  /// 检查是否为第一页
  bool get isFirstPage => page <= 1;

  /// 检查是否为最后一页
  bool get isLastPage => page >= pagesTotal;

  /// 获取当前页的范围描述
  String get rangeDescription {
    if (totalInt == 0) return '0 - 0 of 0';
    return '$start - $end of $totalInt';
  }
}
