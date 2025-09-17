import 'package:flutter/material.dart';

/// 通用的类型切换组件（如：验证码登录/密码登录、手机号/邮箱等）
/// [titles]：tab 名称列表
/// [selectedIndex]：当前选中索引
/// [onTypeChanged]：切换回调
class LoginTypeSwitcher extends StatelessWidget {
  final List<String> titles;
  final int selectedIndex;
  final ValueChanged<int> onTypeChanged;

  const LoginTypeSwitcher({
    super.key,
    required this.titles,
    required this.selectedIndex,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    assert(titles.length == 2, '只支持两个tab');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        _buildTab(context, 0),
        Baseline(
          baseline: 24,
          baselineType: TextBaseline.alphabetic,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              '|',
              style: TextStyle(color: Color(0xFFDDDDDD), fontSize: 18),
            ),
          ),
        ),
        _buildTab(context, 1),
      ],
    );
  }

  Widget _buildTab(BuildContext context, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTypeChanged(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            titles[index],
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? const Color(0xFF222222)
                  : const Color(0xFF878E91),
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: isSelected
                ? Image.asset(
                    'assets/images/login_tab_underline.png',
                    key: ValueKey('selected$index'),
                    width: 18,
                    height: 5.5,
                  )
                : SizedBox(
                    key: ValueKey('unselected$index'),
                    width: 18,
                    height: 5.5,
                  ),
          ),
        ],
      ),
    );
  }
}
