import 'package:cptop/shared/constants/colors.dart'; // 新增
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool visible;
  final ValueChanged<bool> onVisibilityChanged;
  final List<TextInputFormatter>? inputFormatters;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.visible,
    required this.onVisibilityChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD6DEE6), width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: !visible,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 14.5),
                  child: IconButton(
                    icon: Image.asset(
                      visible
                          ? 'assets/images/login_password_show.png'
                          : 'assets/images/login_password_hidden.png',
                      width: 17,
                      height: 17,
                    ),
                    onPressed: () => onVisibilityChanged(!visible),
                    splashRadius: 20,
                  ),
                ),
              ),
              style: const TextStyle(
                color: AppColors.primaryBoldText,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
