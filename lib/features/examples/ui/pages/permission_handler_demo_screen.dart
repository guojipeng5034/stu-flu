import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // 导入 permission_handler 包

// 此屏幕用于演示 permission_handler 包的功能，用于请求和检查应用权限
class PermissionHandlerDemoScreen extends StatefulWidget {
  const PermissionHandlerDemoScreen({super.key});

  static const String routeName = '/permissionHandlerDemo'; // 路由名称

  @override
  State<PermissionHandlerDemoScreen> createState() =>
      _PermissionHandlerDemoScreenState();
}

class _PermissionHandlerDemoScreenState
    extends State<PermissionHandlerDemoScreen> {
  // 用于存储权限状态的字符串，初始为 "未知"
  String _cameraPermissionStatus = '未知';
  String _locationPermissionStatus = '未知';
  String _microphonePermissionStatus = '未知';

  @override
  void initState() {
    super.initState();
    // 页面初始化时检查并更新各权限的初始状态
    _checkInitialPermissionStatus(
        Permission.camera, (status) => _cameraPermissionStatus = status);
    _checkInitialPermissionStatus(Permission.locationWhenInUse,
        (status) => _locationPermissionStatus = status);
    _checkInitialPermissionStatus(Permission.microphone,
        (status) => _microphonePermissionStatus = status);
  }

  // 将 PermissionStatus 枚举转换为用户可读的中文描述字符串
  String _permissionStatusToString(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return '已授予'; // 用户已授予权限
      case PermissionStatus.denied:
        return '已拒绝'; // 用户已拒绝权限，但可以再次请求
      case PermissionStatus.permanentlyDenied:
        return '已永久拒绝'; // 用户已永久拒绝权限，无法再次通过应用内请求，需在设置中修改
      case PermissionStatus.restricted:
        return '受限制'; // 例如 iOS 上的家长控制限制了权限
      case PermissionStatus.limited:
        return '有限授予'; // 例如 iOS 上授予了部分照片访问权限
      // PermissionStatus.provisional (仅iOS) 和 PermissionStatus.unknown 通常不直接展示给用户或视为“未知”
      default:
        return '未知'; // 其他未知状态
    }
  }

  // 异步方法：检查特定权限的初始状态并更新UI
  Future<void> _checkInitialPermissionStatus(
      Permission permission, Function(String) updateStateVar) async {
    // permission.status 获取当前权限的状态
    final status = await permission.status;
    if (mounted) {
      // 确保 Widget 仍然在树中
      setState(() {
        updateStateVar(_permissionStatusToString(status));
      });
    }
  }

  // 异步方法：请求相机权限
  Future<void> _requestCameraPermission() async {
    // Permission.camera 代表相机权限
    // .request() 方法会向用户发起权限请求对话框
    final status = await Permission.camera.request();
    if (mounted) {
      setState(() {
        // 更新相机权限状态的UI显示
        _cameraPermissionStatus = _permissionStatusToString(status);
      });
      // 处理用户永久拒绝权限的情况
      _handlePermanentlyDenied(status, '相机');
    }
  }

  // 异步方法：请求多个权限 (位置和麦克风)
  Future<void> _requestMultiplePermissions() async {
    // 可以同时请求多个权限，返回一个 Map，键是 Permission，值是对应的 PermissionStatus
    Map<Permission, PermissionStatus> statuses = await [
      Permission.locationWhenInUse, // “使用时允许”的位置权限
      Permission.microphone, // 麦克风权限
    ].request();

    if (mounted) {
      setState(() {
        // 更新位置权限状态的UI显示
        if (statuses[Permission.locationWhenInUse] != null) {
          _locationPermissionStatus = _permissionStatusToString(
              statuses[Permission.locationWhenInUse]!);
        }
        // 更新麦克风权限状态的UI显示
        if (statuses[Permission.microphone] != null) {
          _microphonePermissionStatus =
              _permissionStatusToString(statuses[Permission.microphone]!);
        }
      });
      // 分别处理每个权限的永久拒绝情况
      if (statuses[Permission.locationWhenInUse] ==
          PermissionStatus.permanentlyDenied) {
        _handlePermanentlyDenied(statuses[Permission.locationWhenInUse]!, '位置');
      }
      if (statuses[Permission.microphone] ==
          PermissionStatus.permanentlyDenied) {
        _handlePermanentlyDenied(statuses[Permission.microphone]!, '麦克风');
      }
    }
  }

  // 处理权限被永久拒绝的情况
  void _handlePermanentlyDenied(
      PermissionStatus status, String permissionName) {
    // 如果权限状态是 permanentlyDenied，提示用户去应用设置中手动开启
    if (status == PermissionStatus.permanentlyDenied) {
      if (mounted) {
        // 确保 Widget 仍然在树中可以显示 SnackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$permissionName权限已被永久拒绝。请在应用设置中手动开启。'),
          action: SnackBarAction(
            label: '打开设置',
            onPressed:
                openAppSettings, // openAppSettings() 是 permission_handler 提供的打开应用设置页面的方法
          ),
        ));
      }
    }
  }

  // 构建显示单个权限状态的行
  Widget _buildPermissionStatusRow(String permissionName, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$permissionName权限状态:', style: const TextStyle(fontSize: 16)),
          Text(status,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('权限处理器 (PermissionHandler) 演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Center(
          // 使内容在水平方向上居中
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 垂直方向上内容居中
            crossAxisAlignment: CrossAxisAlignment.stretch, // 使按钮等宽度充满列宽
            children: <Widget>[
              // 显示相机权限状态
              _buildPermissionStatusRow('相机', _cameraPermissionStatus),
              // 显示位置权限状态
              _buildPermissionStatusRow(
                  '位置 (使用时)', _locationPermissionStatus), // 更明确的标签
              // 显示麦克风权限状态
              _buildPermissionStatusRow('麦克风', _microphonePermissionStatus),
              const SizedBox(height: 24),

              // 请求相机权限按钮
              ElevatedButton(
                onPressed: _requestCameraPermission, // 调用请求相机权限的方法
                child: const Text('请求相机权限'),
              ),
              const SizedBox(height: 12),

              // 请求位置和麦克风权限按钮
              ElevatedButton(
                onPressed: _requestMultiplePermissions, // 调用请求多个权限的方法
                child: const Text('请求位置和麦克风权限'),
              ),
              const SizedBox(height: 12),

              // 打开应用设置按钮
              ElevatedButton(
                onPressed:
                    openAppSettings, //直接调用 permission_handler 提供的 openAppSettings 方法
                child: const Text('打开应用设置'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
