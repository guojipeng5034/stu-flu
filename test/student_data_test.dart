import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:cptop/features/student/data/models/student.dart';

void main() {
  group('StudentData JSON 解析测试', () {
    test('应该能够正确解析您提供的JSON数据', () {
      // 您提供的JSON数据
      const jsonString = '''
      {
        "api_domain": "https://qqeapi.campustop.net/",
        "domain": "https://cn.kuaikuenglish.com/k",
        "hot_reserve_time": [
          "06:00",
          "06:30",
          "07:00",
          "07:30",
          "08:00",
          "18:00",
          "18:30",
          "19:00",
          "19:30",
          "20:00",
          "20:30",
          "21:00"
        ],
        "student": {
          "birthday": "2023-10-07",
          "common_curriculum_ids": [
            {
              "applicable_user": [
                {
                  "id": "1",
                  "label": "kids",
                  "name": "Kids"
                }
              ],
              "code": "C0183",
              "curriculum_study_page": 0,
              "curriculum_total_page": 120,
              "description": "",
              "group_flag": "t",
              "id": 1000493,
              "image_file": "https://cn.kuaikuenglish.com/k/cache/images/curriculum/90/81/54d27591b8156bda99e241a58678323fa56e9081.176x176.cut.png",
              "is_ftl": 0,
              "lead": "",
              "lesson_time_id": 60,
              "name": "跟剑桥学霸学英语看世界(少儿高级)",
              "one_to_one_flag": "f"
            },
            {
              "applicable_user": [
                {
                  "id": "1",
                  "label": "kids",
                  "name": "Kids"
                }
              ],
              "code": "C0441",
              "curriculum_study_page": 0,
              "curriculum_total_page": 425,
              "description": "Smart Kids 系列课程 是快酷少儿英语课程体系中的核心课程。",
              "group_flag": "t",
              "id": 1002158,
              "image_file": "https://cn.kuaikuenglish.com/k/cache/images/curriculum/a6/58/d1f9fab29f7fa934334cd704fb20a38acee3a658.176x176.cut.png",
              "is_ftl": 0,
              "lead": "快酷少儿英语课程体系中的核心课程---Smart Kids系列。",
              "lesson_time_id": 30,
              "name": "少儿主修课 Smart Kids",
              "one_to_one_flag": "t"
            }
          ],
          "completed_ftl": 1,
          "counts_of_messages": 0,
          "curriculum_applicable_user": {
            "id": "1",
            "label": "kids",
            "name": "Kids"
          },
          "default_video_tool": "classroom",
          "default_video_tool_provider": "2",
          "email": "1552952669@qq.com",
          "family": [
            {
              "id": 51303779,
              "image_file": "images/student/bf/2d/92831c54d9f554ae078d1abddd25384ce926bf2d.jpg",
              "nickname": "xiaomi",
              "skip_ftl": null,
              "uid": "4E7CE2EE-0545-11EA-9003-B28BC4DCE9DE"
            },
            {
              "id": 61113992,
              "image_file": "images/student/00/00/noimage_m.png",
              "nickname": "TEST",
              "skip_ftl": null,
              "uid": "F17F6C38-0544-11EA-8F30-E6F095FF2948"
            }
          ],
          "first_name": "Christian",
          "gender": "female",
          "gender_id": 2,
          "has_active_subscription": 0,
          "has_active_tickets": 1,
          "has_ftl_lesson": 0,
          "help_link": "https://webchat.7moor.com/wapchat.html?accessId=36c4aac0-0f32-11e8-be9a-e7749248af45&fromUrl=QQEng&urlTitle=PadApp&otherParams=%7B%22nickName%22%3A%22xiaomi_APP%22%7D&clientId=4E7CE2EE-0545-11EA-9003-B28BC4DCE9DE",
          "id": 51303779,
          "image_file": "https://cn.kuaikuenglish.com/k/cache/images/student/bf/2d/92831c54d9f554ae078d1abddd25384ce926bf2d.176x176.cut.jpg",
          "invalid": null,
          "lang": "zh",
          "last_name": "Christian11111",
          "mobile": "",
          "name": "Christian Christian11111",
          "nickname": "xiaomi",
          "points": 0,
          "require_substitute": null,
          "site_id": 102,
          "site_name": "快酷英语",
          "skip_ftl": 0,
          "skype_id": "live:dingyawei2014",
          "subscription_id": 10200,
          "tel": "18463112377",
          "time_zone": "Asia/Hong_Kong",
          "total_follow": 2,
          "total_ticket_log": "1",
          "type_id": null,
          "uid": "4E7CE2EE-0545-11EA-9003-B28BC4DCE9DE"
        },
        "token": "1a988d63c4220f2c41e8ede6acf3a26278e8b16313145776bd5328b6ba3ba94b2cbea4dd7b015f18"
      }
      ''';

      // 解析JSON
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      
      // 测试StudentData解析
      expect(() => StudentData.fromJson(jsonMap), returnsNormally);
      
      final studentData = StudentData.fromJson(jsonMap);
      
      // 验证顶级字段
      expect(studentData.apiDomain, equals("https://qqeapi.campustop.net/"));
      expect(studentData.domain, equals("https://cn.kuaikuenglish.com/k"));
      expect(studentData.token, equals("1a988d63c4220f2c41e8ede6acf3a26278e8b16313145776bd5328b6ba3ba94b2cbea4dd7b015f18"));
      expect(studentData.hotReserveTime?.length, equals(12));
      expect(studentData.hotReserveTime?.first, equals("06:00"));
      
      // 验证学生信息
      final student = studentData.student;
      expect(student, isNotNull);
      expect(student!.id, equals(51303779));
      expect(student.nickname, equals("xiaomi"));
      expect(student.firstName, equals("Christian"));
      expect(student.lastName, equals("Christian11111"));
      expect(student.email, equals("1552952669@qq.com"));
      expect(student.gender, equals("female"));
      expect(student.genderId, equals(2));
      expect(student.birthday, equals("2023-10-07"));
      
      // 验证课程信息
      expect(student.commonCurriculumIds?.length, equals(2));
      final firstCurriculum = student.commonCurriculumIds?.first;
      expect(firstCurriculum?.id, equals(1000493));
      expect(firstCurriculum?.code, equals("C0183"));
      expect(firstCurriculum?.name, equals("跟剑桥学霸学英语看世界(少儿高级)"));
      
      // 验证家庭成员
      expect(student.family?.length, equals(2));
      final firstFamily = student.family?.first;
      expect(firstFamily?.id, equals(51303779));
      expect(firstFamily?.nickname, equals("xiaomi"));
      expect(firstFamily?.skipFtl, isNull);
      
      print('✅ StudentData JSON解析测试通过');
    });
  });
}
