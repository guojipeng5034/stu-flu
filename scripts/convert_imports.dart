import 'dart:io';
import 'dart:convert';

/// 将项目中的相对路径导入转换为包路径导入
/// 用法: dart scripts/convert_imports.dart
void main() async {
  final packageName = 'flutter_application_2';
  final rootDir = Directory('lib');

  print('开始转换相对路径导入为包路径导入...');

  // 递归处理所有Dart文件
  await processDirectory(rootDir, packageName);

  print('转换完成！');
}

/// 递归处理目录中的所有Dart文件
Future<void> processDirectory(Directory directory, String packageName) async {
  final entities = directory.listSync();

  for (final entity in entities) {
    if (entity is File && entity.path.endsWith('.dart')) {
      await processFile(entity, packageName);
    } else if (entity is Directory) {
      await processDirectory(entity, packageName);
    }
  }
}

/// 处理单个Dart文件
Future<void> processFile(File file, String packageName) async {
  try {
    final content = await file.readAsString();
    final lines = LineSplitter.split(content).toList();
    bool modified = false;

    // 相对路径导入的正则表达式
    final relativeImportRegex = RegExp(r"import\s+'\.\.?/.*\.dart';");

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (relativeImportRegex.hasMatch(line)) {
        // 提取相对路径
        final match = RegExp(r"import\s+'(\.\.?/.*)';").firstMatch(line);
        if (match != null) {
          final relativePath = match.group(1)!;

          // 计算绝对路径
          final filePath = file.path.replaceAll('\\', '/');
          final absolutePath = resolveRelativePath(filePath, relativePath);

          // 仅处理项目内的导入
          if (absolutePath.startsWith('lib/')) {
            final packagePath = absolutePath.replaceFirst('lib/', '');
            final newImport = "import 'package:$packageName/$packagePath';";
            lines[i] = line.replaceFirst(relativeImportRegex, newImport);
            modified = true;
            print('${file.path}: $line -> ${lines[i]}');
          }
        }
      }
    }

    if (modified) {
      await file.writeAsString(lines.join('\n'));
    }
  } catch (e) {
    print('处理文件 ${file.path} 时出错: $e');
  }
}

/// 解析相对路径为绝对路径
String resolveRelativePath(String filePath, String relativePath) {
  final fileDir = filePath.substring(0, filePath.lastIndexOf('/'));
  final parts = fileDir.split('/');
  final relativeParts = relativePath.split('/');

  for (final part in relativeParts) {
    if (part == '..') {
      if (parts.isNotEmpty) {
        parts.removeLast();
      }
    } else if (part == '.') {
      // 不做任何操作
    } else {
      parts.add(part);
    }
  }

  return parts.join('/');
}
