import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/core/utils/json_converters.dart';
import 'package:cptop/shared/index.dart';

part 'student.freezed.dart';
part 'student.g.dart';

/// 学生数据模型
///
/// 用于学生信息管理和用户配置
@freezed
class Student with _$Student {
  const factory Student({
    String? birthday,
    String? uid,
    ApplicableUser? curriculumApplicableUser,
    String? defaultVideoTool,
    String? email,
    String? phone,
    @Default([]) List<StudentFamily> family,
    String? gender,
    @Default(0) int genderId,
    String? helpLink,
    @Default(0) int id,
    String? imageFile,
    String? name,
    String? firstName,
    String? lastName,
    String? nickname,
    String? points,
    @Default(0) int siteId,
    String? subscriptionId,
    String? tel,
    String? timeZone,
    String? totalFollow,
    String? totalTicketLog,
    @Default([]) List<Curriculum> commonCurriculumIds,
    @CTBoolConverter() @Default(false) bool requireSubstitute,
    @CTBoolConverter() @Default(false) bool completedFtl,
    @CTBoolConverter() @Default(false) bool hasActiveSubscription,
    @CTBoolConverter() @Default(false) bool hasActiveTickets,
    @CTBoolConverter() @Default(false) bool hasFtlLesson,
    @CTBoolConverter() @Default(false) bool skipFtl,

    String? lang,
    String? siteName,
    String? mobile,
    String? defaultVideoToolProvider,
  }) = _Student;

  /// 从 JSON 创建 Student 实例
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}


/// 学生家庭成员
@freezed
class StudentFamily with _$StudentFamily {
  const factory StudentFamily({
    @Default(0) int id,
    String? imageFile,
    String? nickname,
  }) = _StudentFamily;

  /// 从 JSON 创建 StudentFamily 实例
  factory StudentFamily.fromJson(Map<String, dynamic> json) => _$StudentFamilyFromJson(json);
}
