import 'timezone.dart';

/// 时区工具扩展方法
extension TimeZoneBeanExtensions on TimeZoneBean {
  /// 获取完整的时区显示文本
  String get displayText => '${name ?? ''} (${offset ?? ''})';

  /// 获取带标签的显示文本
  String get fullDisplayText => '${name ?? ''} - ${label ?? ''} (${offset ?? ''})';

  /// 检查是否为正偏移量
  bool get isPositiveOffset {
    final offsetStr = offset ?? '';
    return offsetStr.startsWith('+');
  }

  /// 检查是否为负偏移量
  bool get isNegativeOffset {
    final offsetStr = offset ?? '';
    return offsetStr.startsWith('-');
  }

  /// 检查是否为UTC时区
  bool get isUTC {
    final offsetStr = offset ?? '';
    return offsetStr == '+00:00' || offsetStr == '-00:00';
  }

  /// 获取偏移小时数
  int get offsetHours {
    final offsetStr = offset ?? '';
    if (offsetStr.length >= 3) {
      try {
        final sign = offsetStr.startsWith('-') ? -1 : 1;
        final hours = int.parse(offsetStr.substring(1, 3));
        return sign * hours;
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  /// 获取偏移分钟数
  int get offsetMinutes {
    final offsetStr = offset ?? '';
    if (offsetStr.length >= 6) {
      try {
        final sign = offsetStr.startsWith('-') ? -1 : 1;
        final minutes = int.parse(offsetStr.substring(4, 6));
        return sign * minutes;
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  /// 获取总偏移分钟数
  int get totalOffsetMinutes {
    return offsetHours * 60 + offsetMinutes;
  }

  /// 检查是否为常用时区
  bool get isCommonTimeZone {
    final commonZones = [
      'Asia/Shanghai',
      'Asia/Tokyo',
      'America/New_York',
      'America/Los_Angeles',
      'Europe/London',
      'Europe/Paris',
      'Asia/Manila',
      'Asia/Taipei',
      'Asia/Seoul',
      'Asia/Bangkok',
    ];
    return commonZones.contains(label);
  }

  /// 检查是否为亚洲时区
  bool get isAsianTimeZone {
    return label?.startsWith('Asia/') ?? false;
  }

  /// 检查是否为美洲时区
  bool get isAmericanTimeZone {
    return label?.startsWith('America/') ?? false;
  }

  /// 检查是否为欧洲时区
  bool get isEuropeanTimeZone {
    return label?.startsWith('Europe/') ?? false;
  }

  /// 检查是否为太平洋时区
  bool get isPacificTimeZone {
    return label?.startsWith('Pacific/') ?? false;
  }

  /// 获取时区区域
  String get region {
    final labelStr = label ?? '';
    if (labelStr.contains('/')) {
      return labelStr.split('/').first;
    }
    return 'Unknown';
  }

  /// 获取时区城市
  String get city {
    final labelStr = label ?? '';
    if (labelStr.contains('/')) {
      final parts = labelStr.split('/');
      return parts.length > 1 ? parts.last.replaceAll('_', ' ') : '';
    }
    return labelStr;
  }
}
