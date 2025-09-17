import 'package:cptop/shared/constants/colors.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String avatar;
  final String name;
  final int age;
  final bool isLast;
  final bool isLastLogin;
  final bool isValid;
  final VoidCallback onTap;

  const AccountCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.age,
    this.isLast = false,
    this.isLastLogin = false,
    this.isValid = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: isLast ? 0 : 12,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: isValid ? onTap : null,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isValid ? Colors.white : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isValid ? const Color(0xFFE0E0E0) : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // 头像
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: isValid ? null : Colors.grey[300],
                    backgroundImage: AssetImage(avatar),
                  ),
                  const SizedBox(width: 12),
                  // 账号信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isValid
                                ? AppColors.primaryBoldText
                                : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Age $age',
                          style: TextStyle(
                            fontSize: 14,
                            color: isValid
                                ? AppColors.secondaryText
                                : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 右侧内容
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isValid)
                        Text(
                          l10n.accountCanceled,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      if (isValid)
                        Image.asset(
                          'assets/images/arrow_solid_right.png',
                          width: 15,
                          height: 15,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // "上次"标签绝对定位
          if (isLastLogin)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 39,
                height: 18,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEED0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Text(
                  l10n.recentlyUsed,
                  style: TextStyle(
                    color: Color(0xFFFF952E),
                    fontSize: 12,
                    height: 17.5 / 12, // 行高
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
