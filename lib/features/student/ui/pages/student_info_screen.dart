import 'package:cptop/core/index.dart';
import 'package:cptop/features/student/data/models/student.dart';
import 'package:cptop/features/student/ui/providers/student_provider.dart';
import 'package:cptop/shared/models/network/curriculum/curriculum.dart'
    show Curriculum;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 学生信息页面
class StudentInfoScreen extends ConsumerStatefulWidget {
  const StudentInfoScreen({super.key});

  @override
  ConsumerState<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends ConsumerState<StudentInfoScreen> {
  bool _isLoading = true;
  StudentData? _studentData;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchStudentInfo();
  }

  /// 获取学生信息
  Future<void> _fetchStudentInfo() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final studentService = await ref.read(studentServiceProvider.future);
      final response = await studentService.getCurrentStudent();

      Log.w(response);

      setState(() {
        _isLoading = false;
        if (response.isSuccess && response.data != null) {
          _studentData = response.data;
        } else {
          _errorMessage = response.message ?? '获取学生信息失败';
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '获取学生信息出错: ${e.toString()}';
      });
      Log.e('获取学生信息异常', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学生信息'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '错误: $_errorMessage',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchStudentInfo,
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    final student = _studentData?.student;
    if (student == null) {
      return const Center(
        child: Text('没有获取到学生信息'),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStudentHeader(student),
          const Divider(height: 32),
          _buildInfoSection('基本信息', [
            _buildInfoItem('姓名', student.name ?? '未设置'),
            _buildInfoItem('昵称', student.nickname ?? '未设置'),
            _buildInfoItem('性别', student.gender ?? '未设置'),
            _buildInfoItem('生日', student.birthday ?? '未设置'),
            _buildInfoItem('邮箱', student.email ?? '未设置'),
            _buildInfoItem('手机', student.tel ?? '未设置'),
          ]),
          const Divider(height: 32),
          _buildInfoSection('账户信息', [
            _buildInfoItem('用户ID', student.id?.toString() ?? '未设置'),
            _buildInfoItem('UID', student.uid ?? '未设置'),
            _buildInfoItem('站点', student.siteName ?? '未设置'),
            _buildInfoItem('时区', student.timeZone ?? '未设置'),
            _buildInfoItem('语言', student.lang ?? '未设置'),
          ]),
          if (student.family != null && student.family!.isNotEmpty) ...[
            const Divider(height: 32),
            _buildFamilySection(student.family!),
          ],
          if (student.commonCurriculumIds != null &&
              student.commonCurriculumIds!.isNotEmpty) ...[
            const Divider(height: 32),
            _buildCurriculumSection(student.commonCurriculumIds!),
          ],
        ],
      ),
    );
  }

  Widget _buildStudentHeader(Student student) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: student.imageFile != null
              ? NetworkImage(student.imageFile!)
              : null,
          child: student.imageFile == null
              ? const Icon(Icons.person, size: 40)
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name ?? '未知用户',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (student.nickname != null)
                Text(
                  '昵称: ${student.nickname}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    student.hasActiveSubscription == 1
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: student.hasActiveSubscription == 1
                        ? Colors.green
                        : Colors.red,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    student.hasActiveSubscription == 1 ? '已订阅' : '未订阅',
                    style: TextStyle(
                      color: student.hasActiveSubscription == 1
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilySection(List<FamilyMember> family) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '家庭成员',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: family.length,
          itemBuilder: (context, index) {
            final member = family[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: member.imageFile != null &&
                        !member.imageFile!.contains('noimage')
                    ? NetworkImage(member.imageFile!)
                    : null,
                child: member.imageFile == null ||
                        member.imageFile!.contains('noimage')
                    ? const Icon(Icons.person)
                    : null,
              ),
              title: Text(member.nickname ?? '未知成员'),
              subtitle: Text('ID: ${member.id}'),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCurriculumSection(List<Curriculum> curriculums) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '课程',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: curriculums.length,
          itemBuilder: (context, index) {
            final curriculum = curriculums[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (curriculum.image != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              curriculum.image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.book, size: 60),
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                curriculum.name ?? '未知课程',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '课程码: ${curriculum.code ?? "未知"}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              if (curriculum.curriculumStudyPage != null &&
                                  curriculum.curriculumTotalPage != null)
                                Text(
                                  '进度: ${curriculum.curriculumStudyPage}/${curriculum.curriculumTotalPage}',
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (curriculum.description != null &&
                        curriculum.description!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        curriculum.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
