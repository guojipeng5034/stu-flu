#!/bin/bash
# Flutter构建脚本 - 支持不同环境

if [ -z "$1" ]; then
  echo "请指定环境参数: development, staging 或 production"
  echo "例如: ./build.sh development"
  exit 1
fi

ENV=$1

case $ENV in
  development)
    echo "正在构建开发环境应用..."
    flutter build apk --debug --dart-define=ENV=development
    ;;
  staging)
    echo "正在构建测试环境应用..."
    flutter build apk --profile --dart-define=ENV=staging
    ;;
  production)
    echo "正在构建生产环境应用..."
    flutter build apk --release --dart-define=ENV=production
    ;;
  *)
    echo "无效的环境参数: $ENV"
    echo "有效的环境参数: development, staging 或 production"
    exit 1
    ;;
esac 