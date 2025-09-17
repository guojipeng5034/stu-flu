import 'teacher.dart';
import 'teacher_station.dart';

/// Teacher类的扩展方法
extension TeacherX on Teacher {
  /// 获取教师图片URL
  String getImage() => imageFile;

  /// 检查是否已收藏
  bool hasBookmarked() => bookmarked == 1;

  /// 获取收藏数量字符串
  String getBookmarkedNumToString() {
    final num = collections == 0 ? bookmarked : collections;
    return num < 10 ? ' $num ' : '$num';
  }

  /// 设置收藏状态
  Teacher setIsBookMarked(int isBookmarked) {
    return copyWith(bookmarked: isBookmarked);
  }

  /// 获取性别字符串
  String getGenderStr() {
    // 这里需要从Master数据中获取性别信息
    switch (gender) {
      case 'male':
        return '男';
      case 'female':
        return '女';
      default:
        return '--';
    }
  }

  /// 获取积分字符串
  String get pointsStr => '${points}pts';

  /// 获取教师站点名称列表
  List<String> get teacherStationsName {
    return teacherStations.map((station) => station.allName).toList();
  }

  /// 检查是否有电影
  bool hasMovie() {
    if (detail == null) return false;
    if (detail!.movieUrl.isEmpty) return false;
    // 这里需要检查是否为测试邮箱
    return true; // 临时实现
  }

  /// 检查是否可以固定
  bool hasFix() => isCanFixed;

  /// 获取只显示一个站点名称的HTML字符串
  String getStationsNameOnlyOne() {
    final stations = teacherStationsName;
    if (stations.isEmpty) return '';

    final sb = StringBuffer();
    sb.write(stations.first);
    if (stations.length > 1) {
      sb.write('  more'); // 可以添加样式
    }
    return sb.toString();
  }

  /// 获取时间段字符串列表
  List<String> get slotsString {
    final list = <String>[];
    for (final block in blocks) {
      final slot = block.timeFrom;
      if (slot != null) {
        list.add(slot);
      }
    }
    return list;
  }

  /// 获取可用时间段列表（排除已预约时间）
  List<String> getSlotsList(List<dynamic> reserveListTime) {
    final canReserveTime = <String>[];
    for (final str in slotsString) {
      if (!reserveListTime.contains(str)) {
        canReserveTime.add(str);
      }
    }
    return canReserveTime;
  }

  /// 获取时间段字符串（带删除线标记已预约时间）
  String getSlotsString(List<dynamic> reserveListTime) {
    final sb = StringBuffer();
    sb.write(' ');
    for (final str in slotsString) {
      if (reserveListTime.contains(str)) {
        sb.write('~~$str~~'); // 删除线效果
        sb.write('    ');
        continue;
      }
      sb.write(str);
      sb.write('    ');
    }
    return sb.toString();
  }

  /// 检查是否可以预约时间段
  bool canReserveSlot(List<dynamic>? reserveListTime) {
    if (reserveListTime == null || reserveListTime.isEmpty) {
      return slotsString.isNotEmpty;
    }
    return getSlotsList(reserveListTime).isNotEmpty;
  }

  /// 检查是否有详情信息
  bool get hasDetail => detail != null;

  /// 检查是否有可用课程代码
  bool get hasAvailableCurriculumCodes => availableCurriculumCodes.isNotEmpty;

  /// 检查是否有教师站点
  bool get hasTeacherStations => teacherStations.isNotEmpty;

  /// 检查是否有时间块
  bool get hasBlocks => blocks.isNotEmpty;

  /// 检查是否为有效教师
  bool get isValid => name != null && name!.isNotEmpty;

  /// 获取教师ID的整数值

  /// 检查是否有UID
  bool get hasUid => teacherUid.isNotEmpty;

  /// 获取用于API调用的ID信息
  Map<String, String> getIdBeanUse() {
    if (id == '0') {
      return {'key': 'teacher_uid', 'value': teacherUid};
    } else {
      return {'key': 'teacher_id', 'value': id.toString()};
    }
  }
}

/// TeacherStation类的扩展方法
extension TeacherStationX on TeacherStation {
  /// 获取完整名称
  String get allName => '$storey $name';
}

/// TeacherDetail类的扩展方法
extension TeacherDetailX on TeacherDetail {
  /// 获取关于我信息（如果为空返回默认值）
  String getAboutMe() => aboutMe.isEmpty ? '-' : aboutMe;

  /// 获取职业信息（如果为空返回默认值）
  String getCareer() => career.isEmpty ? '-' : career;

  /// 获取国家信息（如果为空返回默认值）
  String getCountry() => country.isEmpty ? '-' : country;

  /// 获取学位信息（如果为空返回默认值）
  String getDegree() => degree.isEmpty ? '-' : degree;

  /// 获取毕业学校信息（如果为空返回默认值）
  String getSchoolGraduated() =>
      schoolGraduated.isEmpty ? '-' : schoolGraduated;

  /// 检查是否有TESOL认证
  bool get isTesol => certificationType == 'tesol';

  /// 检查是否有电影URL
  bool get hasMovieUrl => movieUrl.isNotEmpty;

  /// 检查是否有认证文件
  bool get hasCertificationFile => certificationFile.isNotEmpty;

  /// 检查是否有教师推荐
  bool get hasTeacherReference => teacherReference.isNotEmpty;
}

/// TeacherBlock类的扩展方法
extension TeacherBlockX on TeacherBlock {
  /// 检查是否可用
  bool get isAvailable => statusForStudent == 'open';

  /// 检查是否已被预约
  bool get isReserved => isAlready == '1';

  /// 检查是否为我的课程
  bool get isMine => this.isMine != null;

  /// 获取时间范围描述
  String get timeRange => '$timeFrom-$timeTo';

  /// 检查是否有课程
  bool get hasLesson => lesson != null;
}
