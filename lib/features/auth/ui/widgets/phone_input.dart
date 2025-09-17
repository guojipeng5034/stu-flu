import 'package:cptop/shared/constants/colors.dart'; // 新增
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 新增

import 'country_picker.dart';

class PhoneInput extends StatelessWidget {
  final String countryCode;
  final List<Map<String, String>> countryList;
  final TextEditingController controller;
  final ValueChanged<String> onCountryChanged;
  final String hintText;

  const PhoneInput({
    super.key,
    required this.countryCode,
    required this.countryList,
    required this.controller,
    required this.onCountryChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: const Color(0xFFD6DEE6), width: 0.5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: GestureDetector(
              onTap: () async {
                final result = await showCountryPicker(
                  context,
                  countryCode,
                  countryList,
                );
                if (result != null) {
                  onCountryChanged(result);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    countryCode,
                    style: const TextStyle(
                        fontSize: 15, color: AppColors.primaryBoldText),
                  ),
                  const SizedBox(width: 2),
                  const Icon(Icons.arrow_drop_down,
                      size: 25, color: AppColors.primaryBoldText),
                ],
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                color: AppColors.primaryBoldText, // 输入内容颜色
                fontSize: 15,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(15),
                // 自定义去除空格
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              onChanged: (value) {
                // 粘贴时自动去除空格
                final newValue = value.replaceAll(' ', '');
                if (newValue != value) {
                  final selection = controller.selection;
                  controller.text = newValue;
                  controller.selection = selection.copyWith(
                    baseOffset: newValue.length,
                    extentOffset: newValue.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
