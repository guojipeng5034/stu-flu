/// 邮箱验证器
/// 提供邮箱格式验证功能
library;

class EmailValidator {
  EmailValidator._();

  /// 基础邮箱格式验证
  static bool isValid(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  /// 严格的邮箱格式验证
  static bool isValidStrict(String email) {
    if (!isValid(email)) return false;

    // 检查长度限制
    if (email.length > 254) return false;

    final parts = email.split('@');
    if (parts.length != 2) return false;

    final localPart = parts[0];
    final domainPart = parts[1];

    // 本地部分长度检查
    if (localPart.length > 64) return false;

    // 域名部分长度检查
    if (domainPart.length > 253) return false;

    // 检查连续的点
    if (email.contains('..')) return false;

    // 检查开头和结尾的点
    if (localPart.startsWith('.') || localPart.endsWith('.')) return false;

    return true;
  }

  /// 验证企业邮箱
  static bool isBusinessEmail(String email) {
    if (!isValid(email)) return false;

    final domain = email.split('@')[1].toLowerCase();

    // 常见的免费邮箱域名
    final freeEmailDomains = {
      'gmail.com',
      'yahoo.com',
      'hotmail.com',
      'outlook.com',
      '163.com',
      '126.com',
      'qq.com',
      'sina.com',
      'sohu.com',
    };

    return !freeEmailDomains.contains(domain);
  }

  /// 获取邮箱域名
  static String? getDomain(String email) {
    if (!isValid(email)) return null;
    return email.split('@')[1];
  }

  /// 获取邮箱用户名
  static String? getUsername(String email) {
    if (!isValid(email)) return null;
    return email.split('@')[0];
  }

  /// 验证邮箱并返回错误信息
  static String? validateWithMessage(String email) {
    if (email.isEmpty) {
      return '邮箱不能为空';
    }

    if (email.length > 254) {
      return '邮箱长度不能超过254个字符';
    }

    if (!email.contains('@')) {
      return '邮箱格式不正确，缺少@符号';
    }

    final parts = email.split('@');
    if (parts.length != 2) {
      return '邮箱格式不正确';
    }

    final localPart = parts[0];
    final domainPart = parts[1];

    if (localPart.isEmpty) {
      return '邮箱用户名不能为空';
    }

    if (domainPart.isEmpty) {
      return '邮箱域名不能为空';
    }

    if (localPart.length > 64) {
      return '邮箱用户名长度不能超过64个字符';
    }

    if (domainPart.length > 253) {
      return '邮箱域名长度不能超过253个字符';
    }

    if (email.contains('..')) {
      return '邮箱不能包含连续的点号';
    }

    if (localPart.startsWith('.') || localPart.endsWith('.')) {
      return '邮箱用户名不能以点号开头或结尾';
    }

    if (!isValid(email)) {
      return '邮箱格式不正确';
    }

    return null; // 验证通过
  }
}
