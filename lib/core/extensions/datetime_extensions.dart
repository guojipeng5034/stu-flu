/// DateTime 扩展方法
/// 提供常用的日期时间处理功能
library;

extension DateTimeExtensions on DateTime {
  /// 判断是否为今天
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// 判断是否为昨天
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// 判断是否为明天
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// 判断是否为本周
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  /// 判断是否为本月
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// 判断是否为本年
  bool get isThisYear {
    final now = DateTime.now();
    return year == now.year;
  }

  /// 获取一天的开始时间 (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// 获取一天的结束时间 (23:59:59.999)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  /// 获取一周的开始时间 (周一 00:00:00)
  DateTime get startOfWeek {
    final daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).startOfDay;
  }

  /// 获取一周的结束时间 (周日 23:59:59.999)
  DateTime get endOfWeek {
    return startOfWeek.add(const Duration(days: 6)).endOfDay;
  }

  /// 获取一个月的开始时间
  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  /// 获取一个月的结束时间
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 1)
        .subtract(const Duration(days: 1))
        .endOfDay;
  }

  /// 获取一年的开始时间
  DateTime get startOfYear {
    return DateTime(year, 1, 1);
  }

  /// 获取一年的结束时间
  DateTime get endOfYear {
    return DateTime(year, 12, 31).endOfDay;
  }

  /// 获取年龄（基于当前日期）
  int get age {
    final now = DateTime.now();
    int age = now.year - year;

    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }

    return age;
  }

  /// 获取距离现在的天数差
  int get daysFromNow {
    final now = DateTime.now();
    return difference(now).inDays;
  }

  /// 获取距离现在的小时数差
  int get hoursFromNow {
    final now = DateTime.now();
    return difference(now).inHours;
  }

  /// 获取距离现在的分钟数差
  int get minutesFromNow {
    final now = DateTime.now();
    return difference(now).inMinutes;
  }

  /// 添加工作日（跳过周末）
  DateTime addBusinessDays(int days) {
    DateTime result = this;
    int addedDays = 0;

    while (addedDays < days) {
      result = result.add(const Duration(days: 1));
      // 如果不是周末（周六=6，周日=7），则计数
      if (result.weekday < 6) {
        addedDays++;
      }
    }

    return result;
  }

  /// 减去工作日（跳过周末）
  DateTime subtractBusinessDays(int days) {
    DateTime result = this;
    int subtractedDays = 0;

    while (subtractedDays < days) {
      result = result.subtract(const Duration(days: 1));
      // 如果不是周末，则计数
      if (result.weekday < 6) {
        subtractedDays++;
      }
    }

    return result;
  }

  /// 判断是否为工作日
  bool get isWeekday => weekday < 6;

  /// 判断是否为周末
  bool get isWeekend => weekday >= 6;

  /// 判断是否为闰年
  bool get isLeapYear {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// 获取该月的天数
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// 格式化为相对时间字符串（如：2小时前、3天后）
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return '${difference.inDays}天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inSeconds > 0) {
      return '${difference.inSeconds}秒前';
    } else if (difference.inSeconds < 0) {
      final futureDiff = difference.abs();
      if (futureDiff.inDays > 0) {
        return '${futureDiff.inDays}天后';
      } else if (futureDiff.inHours > 0) {
        return '${futureDiff.inHours}小时后';
      } else if (futureDiff.inMinutes > 0) {
        return '${futureDiff.inMinutes}分钟后';
      } else {
        return '${futureDiff.inSeconds}秒后';
      }
    } else {
      return '刚刚';
    }
  }

  /// 复制并修改日期时间的某些部分
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
