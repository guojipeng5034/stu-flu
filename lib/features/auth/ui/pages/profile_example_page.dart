import 'package:flutter/material.dart';

import '../../data/models/index.dart';
import '../../data/repositories/student_profile_repository.dart';

/// 学生资料页面示例
class ProfileExamplePage extends StatefulWidget {
  const ProfileExamplePage({super.key});

  @override
  State<ProfileExamplePage> createState() => _ProfileExamplePageState();
}

class _ProfileExamplePageState extends State<ProfileExamplePage> {
  final StudentProfileRepository _repository = StudentProfileRepositoryImpl();
  StudentProfileRespVO? _profile;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _repository.getProfile();
      if (response.isSuccess) {
        setState(() {
          _profile = response.profile;
        });
      } else {
        _showError(response.errorMessage);
      }
    } catch (e) {
      _showError('加载失败: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学生资料'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _profile == null
              ? const Center(child: Text('暂无数据'))
              : _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    final profile = _profile!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 基本信息
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('基本信息', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  _buildInfoRow('用户账号', profile.loginId),
                  _buildInfoRow('昵称', profile.nickname),
                  _buildInfoRow('全名', profile.fullName),
                  _buildInfoRow('邮箱', profile.email),
                  _buildInfoRow('手机号', profile.mobile),
                  _buildInfoRow('性别', profile.genderId?.toString()),
                  _buildInfoRow('生日', profile.birthday),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 详细信息
          if (profile.detail != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('详细信息', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    _buildInfoRow('名字', profile.detail!.firstName),
                    _buildInfoRow('中间名', profile.detail!.middleName),
                    _buildInfoRow('姓氏', profile.detail!.lastName),
                    _buildInfoRow('组合名字', profile.detail!.fullName),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 16),

          // 社交账号
          if (profile.socialUsers?.isNotEmpty == true)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('社交账号', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    ...profile.socialUsers!.map((social) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Text('类型: ${social.type}'),
                              const SizedBox(width: 16),
                              Expanded(child: Text('OpenID: ${social.openid}')),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 16),

          // 状态信息
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('状态信息', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  _buildInfoRow('是否有密码', profile.hasPasswdFlag?.toString()),
                  _buildInfoRow('是否家庭主账号', profile.parentFlag?.toString()),
                  _buildInfoRow('是否需要完善资料', profile.isNeedFill?.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value ?? '未设置'),
          ),
        ],
      ),
    );
  }
}
