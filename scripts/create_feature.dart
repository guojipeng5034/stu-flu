import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    printUsage();
    exit(1);
  }

  final featureName = args[0].toLowerCase().replaceAll(RegExp(r'\s+'), '_');
  final featureNameCamel = _toCamelCase(featureName);
  
  final options = FeatureOptions.fromArgs(args.skip(1).toList());
  
  print('🚀 正在创建功能模块: $featureNameCamel ($featureName)');
  
  final generator = FeatureGenerator(featureName, featureNameCamel, options);
  generator.generate();
  
  print('\n✅ 功能模块 \'$featureNameCamel\' 创建完成!');
  print('📁 位置: lib/features/$featureName');
  
  if (options.withApi || options.withModels) {
    print('\n⚠️  提醒: 请运行以下命令生成代码:');
    print('flutter packages pub run build_runner build');
  }
}

void printUsage() {
  print('使用方法: dart scripts/create_feature.dart [功能名称] [选项]');
  print('');
  print('选项:');
  print('  --api      创建 API 相关文件');
  print('  --models   创建 Model 相关文件');
  print('  --provider 创建 Provider 相关文件');
  print('  --all      创建所有文件');
  print('');
  print('示例:');
  print('  dart scripts/create_feature.dart profile --api --models');
  print('  dart scripts/create_feature.dart user_settings --all');
}

class FeatureOptions {
  final bool withApi;
  final bool withModels;
  final bool withProvider;
  
  const FeatureOptions({
    this.withApi = false,
    this.withModels = false,
    this.withProvider = false,
  });
  
  factory FeatureOptions.fromArgs(List<String> args) {
    final withAll = args.contains('--all');
    return FeatureOptions(
      withApi: withAll || args.contains('--api'),
      withModels: withAll || args.contains('--models'),
      withProvider: withAll || args.contains('--provider'),
    );
  }
}

class FeatureGenerator {
  final String featureName;
  final String featureNameCamel;
  final FeatureOptions options;
  
  late final String basePath;
  
  FeatureGenerator(this.featureName, this.featureNameCamel, this.options) {
    basePath = 'lib/features/$featureName';
  }
  
  void generate() {
    _createDirectories();
    _createIndexFile();
    _createPageFiles();
    _createWidgetFiles();
    
    if (options.withApi) _createApiFiles();
    if (options.withModels) _createModelFiles();
    if (options.withProvider) _createProviderFiles();
  }
  
  void _createDirectories() {
    final directories = [
      basePath,
      '$basePath/ui',
      '$basePath/ui/pages',
      '$basePath/ui/widgets',
    ];
    
    if (options.withApi || options.withModels) {
      directories.add('$basePath/data');
    }
    
    if (options.withApi) {
      directories.add('$basePath/data/api');
    }
    
    if (options.withModels) {
      directories.add('$basePath/data/models');
    }
    
    if (options.withProvider) {
      directories.add('$basePath/ui/providers');
    }
    
    for (final dir in directories) {
      Directory(dir).createSync(recursive: true);
      print('📁 创建目录: $dir');
    }
  }
  
  void _createIndexFile() {
    final exports = <String>[
      "export 'ui/pages/index.dart';",
      "export 'ui/widgets/index.dart';",
    ];
    
    if (options.withApi) exports.add("export 'data/api/index.dart';");
    if (options.withModels) exports.add("export 'data/models/index.dart';");
    if (options.withProvider) exports.add("export 'ui/providers/index.dart';");
    
    final content = '''
// Export all public APIs for $featureNameCamel feature
${exports.join('\n')}
'''.trim();
    
    _writeFile('$basePath/index.dart', content);
  }
  
  void _createPageFiles() {
    final pageContent = '''
import 'package:flutter/material.dart';

class ${featureNameCamel}Page extends StatefulWidget {
  const ${featureNameCamel}Page({super.key});

  @override
  State<${featureNameCamel}Page> createState() => _${featureNameCamel}PageState();
}

class _${featureNameCamel}PageState extends State<${featureNameCamel}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$featureNameCamel'),
      ),
      body: const Center(
        child: Text(
          '$featureNameCamel Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
''';
    
    _writeFile('$basePath/ui/pages/${featureName}_page.dart', pageContent);
    _writeFile('$basePath/ui/pages/index.dart', "export '${featureName}_page.dart';");
  }
  
  void _createWidgetFiles() {
    final content = '''
// Export all widgets for $featureNameCamel feature
// export 'example_widget.dart';
''';
    
    _writeFile('$basePath/ui/widgets/index.dart', content);
  }
  
  void _createApiFiles() {
    final apiContent = '''
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part '${featureName}_api.g.dart';

@RestApi()
abstract class ${featureNameCamel}Api {
  factory ${featureNameCamel}Api(Dio dio, {String baseUrl}) = _${featureNameCamel}Api;

  // TODO: 添加 API 方法
  // @GET('/api/$featureName')
  // Future<List<${featureNameCamel}Model>> get${featureNameCamel}List();
}
''';
    
    _writeFile('$basePath/data/api/${featureName}_api.dart', apiContent);
    _writeFile('$basePath/data/api/index.dart', "export '${featureName}_api.dart';");
  }
  
  void _createModelFiles() {
    final modelContent = '''
import 'package:json_annotation/json_annotation.dart';

part '${featureName}_model.g.dart';

@JsonSerializable()
class ${featureNameCamel}Model {
  final String id;
  final String name;
  
  const ${featureNameCamel}Model({
    required this.id,
    required this.name,
  });

  factory ${featureNameCamel}Model.fromJson(Map<String, dynamic> json) =>
      _\$${featureNameCamel}ModelFromJson(json);

  Map<String, dynamic> toJson() => _\$${featureNameCamel}ModelToJson(this);
}
''';
    
    _writeFile('$basePath/data/models/${featureName}_model.dart', modelContent);
    _writeFile('$basePath/data/models/index.dart', "export '${featureName}_model.dart';");
  }
  
  void _createProviderFiles() {
    final providerContent = '''
import 'package:flutter/foundation.dart';

class ${featureNameCamel}Provider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // TODO: 添加业务逻辑方法
}
''';
    
    _writeFile('$basePath/ui/providers/${featureName}_provider.dart', providerContent);
    _writeFile('$basePath/ui/providers/index.dart', "export '${featureName}_provider.dart';");
  }
  
  void _writeFile(String path, String content) {
    File(path).writeAsStringSync(content);
    print('📄 创建文件: $path');
  }
}

String _toCamelCase(String input) {
  return input
      .split('_')
      .map((word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
      .join('');
}
