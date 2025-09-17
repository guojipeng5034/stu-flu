// 添加缺失的导入
import 'dart:io';

import 'package:cptop/core/di/di.dart'; // 确保DI类导入
import 'package:cptop/core/error/error_handler.dart';
import 'package:cptop/features/auth/data/models/student_profile_save_req_vo.dart';
import 'package:cptop/features/auth/data/services/profile_service.dart';
import 'package:cptop/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:cptop/shared/widgets/app_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// 将StatefulWidget改为ConsumerStatefulWidget
class CompleteProfilePage extends ConsumerStatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  ConsumerState<CompleteProfilePage> createState() =>
      _CompleteProfilePageState();
}

class _CompleteProfilePageState extends ConsumerState<CompleteProfilePage> {
  // 表单数据
  String? selectedGender; // 'boy' or 'girl' or null
  DateTime? selectedBirthday;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController englishNameController = TextEditingController();
  String? selectedEnglishName;
  File? selectedAvatarImage; // 选中的头像图片文件（仅移动端使用）
  XFile? selectedAvatarXFile; // 选中的头像XFile（跨平台）
  String? uploadedAvatarUrl; // 上传后的头像URL
  bool isUploadingAvatar = false; // 头像上传状态
  final ImagePicker _imagePicker = ImagePicker();

  // 完整的推荐英文名列表（从接口获取）
  List<String> allRecommendedNames = [];
  // 当前显示的推荐英文名（每次最多6个）
  List<String> currentRecommendedNames = [];

  @override
  void initState() {
    super.initState();
    // 不再自动获取推荐英文名，等待用户选择性别后再获取
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AuthAppBar(
        title: l10n.completeYourInformation,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 背景图
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background_complete.png',
              height: 320, // 适当加大
              fit: BoxFit.cover,
            ),
          ),
          // 主内容
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 头像选择区域
                          _buildAvatarSection(),
                          const SizedBox(height: 30),

                          // 性别选择
                          _buildGenderSection(),
                          const SizedBox(height: 20),

                          // 宝贝生日
                          _buildBirthdaySection(),
                          const SizedBox(height: 20),

                          // 宝贝姓名
                          _buildNameSection(),
                          const SizedBox(height: 15),

                          // 英文昵称
                          _buildEnglishNameSection(),
                          const SizedBox(height: 15),

                          // 推荐英文名
                          _buildRecommendedNamesSection(),
                          const SizedBox(height: 40),

                          // 进入按钮
                          // _buildEnterButton(), // 移除直接调用，改为绝对定位
                        ],
                      ),
                    ),
                  ),
                  // 进入按钮
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: _buildEnterButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 头像选择区域
  Widget _buildAvatarSection() {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: isUploadingAvatar ? null : _showAvatarOptions,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      offset: const Offset(0, 0.5),
                      blurRadius: 16,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Stack(
                    children: [
                      _buildAvatarImage(),
                      if (isUploadingAvatar)
                        Container(
                          width: 90,
                          height: 90,
                          color: Colors.black.withValues(alpha: 0.3),
                          child: const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: isUploadingAvatar ? null : _showAvatarOptions,
                child: Container(
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withValues(alpha: 0.08),
                        offset: const Offset(0, 1),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: isUploadingAvatar
                        ? AppColors.disabled
                        : AppColors.primary,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 性别选择区域
  Widget _buildGenderSection() {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: _buildGenderButton(
            'boy',
            l10n.male,
            'assets/images/emoji_boy.png',
            selectedGender == 'boy',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildGenderButton(
            'girl',
            l10n.female,
            'assets/images/emoji_girl.png',
            selectedGender == 'girl',
          ),
        ),
      ],
    );
  }

  Widget _buildGenderButton(
      String gender, String label, String emojiAsset, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
          selectedEnglishName = null;
          englishNameController.clear();
        });
        _fetchRecommendedNames();
      },
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFF3F7F9),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(emojiAsset, width: 22, height: 22),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 生日选择区域
  Widget _buildBirthdaySection() {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F7F9),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedBirthday != null
                    ? '${selectedBirthday!.year}-${selectedBirthday!.month.toString().padLeft(2, '0')}-${selectedBirthday!.day.toString().padLeft(2, '0')}'
                    : l10n.dateOfBirth,
                style: TextStyle(
                  fontSize: 16,
                  color: selectedBirthday != null
                      ? AppColors.primaryText
                      : AppColors.disabled,
                ),
              ),
            ),
            Image.asset('assets/images/arrow_solid_down.png',
                width: 18, height: 18, color: const Color(0xFFBDBDBD)),
          ],
        ),
      ),
    );
  }

  // 姓名输入区域
  Widget _buildNameSection() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7F9),
        borderRadius: BorderRadius.circular(26),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: nameController,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r' ')),
          LengthLimitingTextInputFormatter(50),
        ],
        onChanged: (value) {
          // 移除空格处理，因为已经在inputFormatters中处理了
          setState(() {});
        },
        style: const TextStyle(fontSize: 16, color: AppColors.primaryText),
        decoration: InputDecoration(
          hintText: l10n.fullName,
          hintStyle: const TextStyle(color: AppColors.disabled, fontSize: 16),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          counterText: '',
        ),
      ),
    );
  }

  // 英文昵称输入区域
  Widget _buildEnglishNameSection() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7F9),
        borderRadius: BorderRadius.circular(26),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: englishNameController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          LengthLimitingTextInputFormatter(50),
        ],
        onChanged: (value) {
          // 移除空格处理，因为已经在inputFormatters中处理了
          setState(() {});
        },
        style: const TextStyle(fontSize: 16, color: AppColors.primaryText),
        decoration: InputDecoration(
          hintText: l10n.englishNickname,
          hintStyle: const TextStyle(color: AppColors.disabled, fontSize: 16),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          counterText: '',
        ),
      ),
    );
  }

  // 推荐英文名区域
  Widget _buildRecommendedNamesSection() {
    final l10n = AppLocalizations.of(context)!;
    // 如果没有选择性别，不显示整个区域
    if (selectedGender == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.recommendedEnglishName,
              style: TextStyle(
                color: Color(0xFF9A9A9A),
                fontSize: 12,
                height: 17.5 / 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            GestureDetector(
              onTap: _shuffleRecommendedNames,
              child: Row(
                children: [
                  Image.asset('assets/images/icon_refresh.png',
                      width: 12, height: 12, color: Color(0xFF666666)),
                  const SizedBox(width: 4),
                  Text(
                    l10n.refresh,
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 12,
                      height: 17.5 / 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 7.5,
          runSpacing: 10,
          children: currentRecommendedNames.map((name) {
            final isSelected = selectedEnglishName == name;
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedEnglishName = null;
                    englishNameController.clear(); // 取消选中时清空输入框
                  } else {
                    selectedEnglishName = name;
                    englishNameController.text = name; // 选中时填入
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                constraints: const BoxConstraints(minHeight: 29),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // 更圆润的胶囊形状
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Color(0xFFD6DEE6),
                  ),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.primaryNormalText,
                    fontWeight: FontWeight.normal,
                    height: 29 / 13,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // 进入按钮
  Widget _buildEnterButton() {
    final l10n = AppLocalizations.of(context)!;
    final isFormValid = selectedGender != null &&
        selectedBirthday != null &&
        nameController.text.isNotEmpty &&
        englishNameController.text.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      height: 49,
      child: ElevatedButton(
        onPressed: isFormValid ? _onEnterPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return const Color(0xFFA0D8EF);
              }
              return AppColors.primary;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return const Color(0xFFE0E0E0);
              }
              return Colors.white;
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.5),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Text(
          l10n.enter,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // 显示头像选择选项
  void _showAvatarOptions() {
    if (isUploadingAvatar) return; // 上传中时不允许选择

    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final actionTextStyle = TextStyle(
      fontSize: 17,
      color: isDark ? Colors.white : AppColors.primaryBoldText,
    );

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImageFromGallery();
            },
            child: Text(l10n.uploadFromAlbum, style: actionTextStyle),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImageFromCamera();
            },
            child: Text(l10n.takePhoto, style: actionTextStyle),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          isDefaultAction: true,
          child: Text(l10n.cancel, style: actionTextStyle),
        ),
      ),
    );
  }

  // 显示日期选择器
  void _showDatePicker() {
    final l10n = AppLocalizations.of(context)!;
    DateTime tempDate = selectedBirthday ??
        DateTime.now().subtract(const Duration(days: 365 * 6));

    int selectedYear = tempDate.year;
    int selectedMonth = tempDate.month;
    int selectedDay = tempDate.day;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            // 生成年份列表（当前年份往前18年）
            final currentYear = DateTime.now().year;
            final years = List.generate(18, (index) => currentYear - index);

            // 生成月份列表
            final months = List.generate(12, (index) => index + 1);

            // 根据选中的年月生成日期列表
            final daysInMonth =
                DateTime(selectedYear, selectedMonth + 1, 0).day;
            final days = List.generate(daysInMonth, (index) => index + 1);

            // 确保选中的日期不超过当月最大天数
            if (selectedDay > daysInMonth) {
              selectedDay = daysInMonth;
            }

            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 顶部栏
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.close,
                                color: AppColors.primary, size: 24),
                          ),
                          const Spacer(),
                          Text(
                            l10n.selectBirthday,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBoldText),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBirthday = DateTime(
                                    selectedYear, selectedMonth, selectedDay);
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              l10n.confirm,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFD6DEE6)),
                    // 自定义三列滚轮选择器
                    SizedBox(
                      height: 220,
                      child: Stack(
                        children: [
                          // 选中项背景
                          Positioned(
                            top: 88,
                            left: 0,
                            right: 0,
                            height: 44,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F7F9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          // 三列选择器
                          Row(
                            children: [
                              // 年份选择器
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: Container(), // 禁用默认选中背景
                                  scrollController: FixedExtentScrollController(
                                    initialItem: years.indexOf(selectedYear),
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      selectedYear = years[index];
                                      // 重新计算天数
                                      final newDaysInMonth = DateTime(
                                              selectedYear,
                                              selectedMonth + 1,
                                              0)
                                          .day;
                                      if (selectedDay > newDaysInMonth) {
                                        selectedDay = newDaysInMonth;
                                      }
                                    });
                                  },
                                  children: years
                                      .map((year) => Center(
                                            child: Text(
                                              '$year',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              // 月份选择器
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: Container(), // 禁用默认选中背景
                                  scrollController: FixedExtentScrollController(
                                    initialItem: selectedMonth - 1,
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      selectedMonth = months[index];
                                      // 重新计算天数
                                      final newDaysInMonth = DateTime(
                                              selectedYear,
                                              selectedMonth + 1,
                                              0)
                                          .day;
                                      if (selectedDay > newDaysInMonth) {
                                        selectedDay = newDaysInMonth;
                                      }
                                    });
                                  },
                                  children: months
                                      .map((month) => Center(
                                            child: Text(
                                              month.toString().padLeft(2, '0'),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              // 日期选择器
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: Container(), // 禁用默认选中背景
                                  scrollController: FixedExtentScrollController(
                                    initialItem: selectedDay - 1,
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      selectedDay = days[index];
                                    });
                                  },
                                  children: days
                                      .map((day) => Center(
                                            child: Text(
                                              day.toString().padLeft(2, '0'),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFF333333),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // 性别ID映射
  int get genderId => selectedGender == 'boy' ? 1 : 2;

  // 从接口获取推荐英文名（性别选择时调用）
  Future<void> _fetchRecommendedNames() async {
    if (selectedGender == null) return;
    try {
      final dio = await ref.read(DI.dioProvider.future);
      final profileService = ProfileService(dio);
      final genderId = selectedGender == 'boy' ? 1 : 2;
      final names =
          await profileService.fetchRecommendedNicknames(genderId: genderId);
      setState(() {
        allRecommendedNames = names.cast<String>(); // 存储完整列表并转换类型
        _updateCurrentRecommendedNames(); // 随机选择6个显示
        selectedEnglishName = null;
      });
    } catch (e) {
      AppToast.show(context, e.toString());
    }
  }

  // 本地随机选择推荐英文名（换一换时调用）
  void _shuffleRecommendedNames() {
    if (allRecommendedNames.isEmpty) return;
    setState(() {
      _updateCurrentRecommendedNames();
      selectedEnglishName = null; // 清空当前选中的英文名
      englishNameController.clear(); // 清空输入框
    });
  }

  // 从完整列表中随机选择6个名字进行显示
  void _updateCurrentRecommendedNames() {
    if (allRecommendedNames.isEmpty) {
      currentRecommendedNames = [];
      return;
    }

    if (allRecommendedNames.length <= 6) {
      // 如果总数不超过6个，显示全部并随机排序
      currentRecommendedNames = List<String>.from(allRecommendedNames)
        ..shuffle();
    } else {
      // 如果总数超过6个，随机选择6个
      final shuffled = List<String>.from(allRecommendedNames)..shuffle();
      currentRecommendedNames = shuffled.take(6).toList();
    }
  }

  void _onEnterPressed() async {
    final l10n = AppLocalizations.of(context)!;
    // 校验
    if (selectedGender == null) {
      AppToast.show(context, l10n.pleaseSelectYourGender);
      return;
    }
    if (selectedBirthday == null) {
      AppToast.show(context, l10n.pleaseSelectYourBirthday);
      return;
    }
    if (nameController.text.isEmpty) {
      AppToast.show(context, l10n.pleaseEnterYourName);
      return;
    }
    if (englishNameController.text.isEmpty) {
      AppToast.show(context, l10n.pleaseEnterYourEnglishName);
      return;
    }
    if (!RegExp(r'^[a-zA-Z]{1,50}').hasMatch(englishNameController.text)) {
      AppToast.show(context, '英文昵称仅可输入英文字母，且长度不超过50位');
      return;
    }

    // 打印本地token和所有本地存储
    // final prefs = await SharedPreferences.getInstance();
    // print(
    //     '所有本地存储: ${prefs.getKeys().map((k) => '$k: ${prefs.get(k)}').join(', ')}');
    // final storage = StorageService(prefs);
    // final authStorage = AuthStorageService(storage);
    // print('当前本地 access_token: ${authStorage.getToken()}');

    try {
      final req = StudentProfileSaveReqVO(
        detailFirstName: nameController.text,
        nickname: englishNameController.text,
        genderId: genderId,
        birthday: DateFormat('yyyy-MM-dd').format(selectedBirthday!),
        imageFile: uploadedAvatarUrl ?? "",
      );
      final dio = await ref.read(DI.dioProvider.future);
      final profileService = ProfileService(dio);
      final result = await profileService.updateProfile(req);

      if (result['code'] == 0) {
        AppToast.show(context, '信息更新成功');
        await Future.delayed(const Duration(milliseconds: 100));
        context.go('/home');
      } else {
        AppToast.show(context, result['msg'] ?? '信息更新失败');
      }
    } on DioException catch (e) {
      final failure = ErrorHandler.handleAnyError(e);
      AppToast.show(context, failure.message);
    } catch (e) {
      final failure = ErrorHandler.handleAnyError(e);
      AppToast.show(context, failure.message);
    }
  }

  // 从相册选择图片
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        await _uploadAvatarFromXFile(image);
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, '选择图片失败: $e');
      }
    }
  }

  // 拍照选择图片
  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        await _uploadAvatarFromXFile(image);
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, '拍照失败: $e');
      }
    }
  }

  // 构建头像图片显示
  Widget _buildAvatarImage() {
    if (selectedAvatarXFile != null) {
      if (kIsWeb) {
        // Web平台使用Image.network或FutureBuilder显示
        return FutureBuilder<Uint8List>(
          future: selectedAvatarXFile!.readAsBytes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.memory(
                snapshot.data!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              );
            } else {
              return Image.asset(
                "assets/images/avatar_account_default.png",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              );
            }
          },
        );
      } else {
        // 移动端使用Image.file
        return Image.file(
          selectedAvatarImage!,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        );
      }
    } else {
      return Image.asset(
        "assets/images/avatar_account_default.png",
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      );
    }
  }

  // 从XFile上传头像
  Future<void> _uploadAvatarFromXFile(XFile xFile) async {
    setState(() {
      selectedAvatarXFile = xFile;
      // 在移动端可以创建File对象用于显示
      if (!kIsWeb) {
        selectedAvatarImage = File(xFile.path);
      }
      isUploadingAvatar = true;
    });

    try {
      final dio = await ref.read(DI.dioProvider.future);
      final profileService = ProfileService(dio);

      // 生成文件名
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final extension = xFile.name.split('.').last;
      final fileName = 'avatar_$timestamp.$extension';

      final avatarUrl =
          await profileService.uploadFile(xFile, fileName: fileName);

      setState(() {
        uploadedAvatarUrl = avatarUrl;
        isUploadingAvatar = false;
      });

      if (mounted) {
        AppToast.show(context, '头像上传成功');
      }
    } catch (e) {
      setState(() {
        selectedAvatarImage = null;
        selectedAvatarXFile = null;
        isUploadingAvatar = false;
      });

      if (mounted) {
        AppToast.show(context, '头像上传失败: $e');
      }
    }
  }
}
