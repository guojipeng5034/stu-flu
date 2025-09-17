# 认证组件使用说明

## AgreementLinks 组件

`AgreementLinks` 组件用于显示用户协议和隐私政策的可点击链接，支持根据不同环境自动获取正确的URL。

### 功能特性

- 自动根据环境配置获取用户协议和隐私政策URL
- 支持点击链接在外部浏览器中打开
- 包含复选框用于用户确认同意
- 支持国际化文本显示

### 使用方法

```dart
import '../widgets/agreement_links.dart';

// 在页面中使用
AgreementLinks(
  checked: _isAgreementChecked,
  onChanged: (value) {
    setState(() {
      _isAgreementChecked = value ?? false;
    });
  },
)
```

### 环境配置

组件会自动从环境配置中读取以下URL：

- **开发环境**: `https://student-dev.52cebu.com`
- **测试环境**: `https://student-staging.52cebu.com`  
- **生产环境**: `https://student.52cebu.com`

URL路径配置在 `assets/env/env.common` 中：
- 用户协议: `/CN/file/userClause.html`
- 隐私政策: `/CN/file/privacyPolicy.html`

### 依赖

- `url_launcher`: 用于打开外部链接
- `flutter/gestures`: 用于处理点击手势
- 环境配置系统 (`lib/env/index.dart`)

### 已集成页面

- 登录页面 (`login_page.dart`)
- 重置密码页面 (`reset_password_page.dart`)

### 国际化支持

组件使用以下国际化键：
- `iHaveReadAndAgree`: "我已阅读并同意"
- `userAgreement`: "《用户协议》"
- `and`: "和"
- `privacyPolicy`: "《隐私政策》"