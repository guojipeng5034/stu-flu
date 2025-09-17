import 'teacher_review.dart';

/// TeacherReview类的扩展方法
extension TeacherReviewX on TeacherReview {
  /// 获取评分数值（转换为浮点数）
  double get ratingNum {
    // 假设评分ID需要除以10来获取实际评分
    return ratingId / 10.0;
  }

  /// 检查是否为公开评价
  bool get isPublic => publicFlag == 't';

  /// 检查是否被拒绝
  bool get isRejected => rejectedFlag == 't';

  /// 检查是否有评论内容
  bool get hasComment => comment != null && comment!.isNotEmpty;

  /// 检查是否有学生信息
  bool get hasStudent => student != null;

  /// 获取显示用的评分文本
  String get ratingText {
    return ratingNum.toStringAsFixed(1);
  }
}
