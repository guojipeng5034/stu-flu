import 'package:flutter/material.dart';

Future<String?> showCountryPicker(
  BuildContext context,
  String selectedCode,
  List<Map<String, String>> countryList,
) async {
  String? tempSelected = selectedCode;
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 顶部栏
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF222222)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      '选择国家/地区',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, tempSelected),
                      child: const Text(
                        '确定',
                        style: TextStyle(
                          color: Color(0xFF20BAF2),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFD6DEE6)),
              const SizedBox(height: 10),
              // 列表
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: countryList.length,
                    itemBuilder: (context, index) {
                      final item = countryList[index];
                      final isSelected = item['code'] == tempSelected;
                      return InkWell(
                        onTap: () {
                          tempSelected = item['code']!;
                          (context as Element).markNeedsBuild();
                        },
                        child: Container(
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: const Color(0xFFF3F7F9),
                                  borderRadius: BorderRadius.circular(11),
                                )
                              : null,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17.5, vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['name']!,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF222222)
                                      : const Color(0xFFB0B0B0),
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                item['code']!,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF222222)
                                      : const Color(0xFFB0B0B0),
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
