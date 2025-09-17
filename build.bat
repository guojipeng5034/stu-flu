@echo off
REM Flutter构建脚本 - 支持不同环境

IF "%1"=="" (
  ECHO 请指定环境参数: development, staging 或 production
  ECHO 例如: build.bat development
  EXIT /B 1
)

SET ENV=%1

IF "%ENV%"=="development" (
  ECHO 正在构建开发环境应用...
  flutter build apk --debug --dart-define=ENV=development
  EXIT /B 0
)

IF "%ENV%"=="staging" (
  ECHO 正在构建测试环境应用...
  flutter build apk --profile --dart-define=ENV=staging
  EXIT /B 0
)

IF "%ENV%"=="production" (
  ECHO 正在构建生产环境应用...
  flutter build apk --release --dart-define=ENV=production
  EXIT /B 0
)

ECHO 无效的环境参数: %ENV%
ECHO 有效的环境参数: development, staging 或 production
EXIT /B 1 