import 'information.dart';

/// Information类的扩展方法
extension InformationX on Information {
  /// 获取内容（处理HTML标志）
  String getContent() {
    if (contentHtmlFlag == 't') {
      // 在Flutter中，我们可能需要使用flutter_html包来处理HTML内容
      // 这里先返回原始内容，实际使用时可以进一步处理
      return content;
    }
    return content;
  }

  /// 检查内容是否为HTML格式
  bool get isHtmlContent => contentHtmlFlag == 't';

  /// 获取链接列表（优先使用links，如果为空则使用linksJson）
  List<InformationLink> getLinksData() {
    if (links.isNotEmpty) return links;
    return linksJson;
  }

  /// 获取发布时间
  String getPostedTime() => postedTime;

  /// 获取链接日期（与发布时间相同）
  String getLinksDate() => postedTime;

  /// 检查是否有链接
  bool get hasLinks => getLinksData().isNotEmpty;

  /// 检查是否有有效内容
  bool get hasValidContent => content.isNotEmpty;

  /// 检查是否有标题
  bool get hasTitle => title.isNotEmpty;

  /// 获取第一个链接
  InformationLink? get firstLink {
    final linksList = getLinksData();
    return linksList.isNotEmpty ? linksList.first : null;
  }

  /// 获取链接数量
  int get linkCount => getLinksData().length;
}

/// InformationLink类的扩展方法
extension InformationLinkX on InformationLink {
  /// 获取标题（如果标题为空则使用URL）
  String getTitle() {
    if (title.trim().isEmpty) {
      return url;
    }
    return title;
  }

  /// 检查是否有有效URL
  bool get hasValidUrl => url.isNotEmpty;

  /// 检查是否为外部链接
  bool get isExternalLink => url.startsWith('http://') || url.startsWith('https://');

  /// 检查是否有目标
  bool get hasTarget => target.isNotEmpty;

  /// 检查是否在新窗口打开
  bool get opensInNewWindow => target == '_blank';
}
