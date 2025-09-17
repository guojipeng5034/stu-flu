import 'package:cptop/core/utils/json_converters.dart' show CTBoolConverter;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/shared/index.dart';

part 'student.freezed.dart';
part 'student.g.dart';

/// 学生数据模型
///
/// 使用 freezed 自动生成 copyWith、toString、hashCode、== 等方法
/// 使用 json_serializable 自动处理 JSON 序列化/反序列化
@freezed
class Student with _$Student {
  const factory Student({
    String? birthday,
    List<Curriculum>? commonCurriculumIds,

    int? countsOfMessages,
    ApplicableUser? curriculumApplicableUser,
    String? defaultVideoTool,
    String? defaultVideoToolProvider,
    String? email,
    List<FamilyMember>? family,
    String? firstName,
    String? gender,
    int? genderId,
    @CTBoolConverter()  @Default(false) bool completedFtl,
    @CTBoolConverter()  @Default(false) bool hasActiveSubscription,
    @CTBoolConverter()  @Default(false) bool hasActiveTickets,
    @CTBoolConverter()  @Default(false) bool hasFtlLesson,
    @CTBoolConverter()  @Default(false) bool skipFtl,

    String? helpLink,
    int? id,
    String? imageFile,
    String? lang,
    String? lastName,
    String? mobile,
    String? name,
    String? nickname,
    int? points,
    dynamic requireSubstitute,
    int? siteId,
    String? siteName,
    int? subscriptionId,
    String? tel,
    String? timeZone,
    int? totalFollow,
    String? totalTicketLog,
    dynamic typeId,
    String? uid,
  }) = _Student;

  /// 从 JSON 创建 Student 实例
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}


/// 家庭成员数据模型
@freezed
class FamilyMember with _$FamilyMember {
  const factory FamilyMember({
    int? id,
    String? imageFile,
    String? nickname,
    @CTBoolConverter()  @Default(false) bool skipFtl,
    String? uid,
  }) = _FamilyMember;

  /// 从 JSON 创建 FamilyMember 实例
  factory FamilyMember.fromJson(Map<String, dynamic> json) => _$FamilyMemberFromJson(json);
}

/// 学生数据容器模型
@freezed
class StudentData with _$StudentData {
  const factory StudentData({
    String? apiDomain,
    String? domain,
    List<String>? hotReserveTime,
    Student? student,
    String? token,
  }) = _StudentData;

  /// 从 JSON 创建 StudentData 实例
  factory StudentData.fromJson(Map<String, dynamic> json) => _$StudentDataFromJson(json);
}
