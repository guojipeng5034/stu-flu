import 'package:cptop/features/auth/ui/widgets/account_card.dart';
import 'package:cptop/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:cptop/features/auth/ui/widgets/login_background.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/stu_auth_resp_vo.dart';

class AccountSelectPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<StudentInfoVO>? students;

  const AccountSelectPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.students,
  });

  /// 找到最近登录的账号（loginDate最大的）
  StudentInfoVO? _getLastLoginStudent() {
    if (students == null || students!.isEmpty) return null;

    StudentInfoVO? lastLoginStudent;
    int? maxLoginDate;

    for (final student in students!) {
      // 处理loginDate可能为null的情况
      if (student.loginDate != null) {
        if (maxLoginDate == null || student.loginDate! > maxLoginDate) {
          maxLoginDate = student.loginDate!;
          lastLoginStudent = student;
        }
      }
    }

    return lastLoginStudent;
  }

  @override
  Widget build(BuildContext context) {
    // 检查是否有students数据
    if (students == null || students!.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: const AuthAppBar(title: '', showBack: true),
        body: Stack(
          children: [
            const LoginBackground(),
            const Center(
              child: Text('暂无账号数据'),
            ),
          ],
        ),
      );
    }

    final lastLoginStudent = _getLastLoginStudent();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthAppBar(title: '', showBack: true),
      body: Stack(
        children: [
          const LoginBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBoldText,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.secondaryText),
                  ),
                ),
                const SizedBox(height: 11),
                ...students!.map((account) {
                  // 判断是否为最近登录的账号 - 使用tempToken进行精确匹配
                  final isLastLogin =
                      lastLoginStudent?.tempToken == account.tempToken;

                  // 使用invalidFlag判断账号是否有效
                  final isValid = !account.invalidFlag;

                  return AccountCard(
                    avatar: account.imageFile ??
                        'assets/images/avatar_account_default.png',
                    name: (account.fullName?.isNotEmpty == true)
                        ? account.fullName!
                        : '未设置姓名',
                    age: account.age ?? 0,
                    isLast: students!.last == account,
                    isLastLogin: isLastLogin, // 是否为最近登录
                    isValid: isValid, // 账号是否有效
                    onTap: () {
                      // 只有有效账号才能选择
                      if (isValid) {
                        Navigator.of(context).pop(account.tempToken);
                      }
                    },
                  );
                }),
                const SizedBox(height: 24), // 底部留白，确保最后一个卡片不会贴边
              ],
            ),
          ),
        ],
      ),
    );
  }
}
