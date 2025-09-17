import 'telephone_code.dart';

/// 电话区号工具扩展方法
extension TelephoneCodeBeanExtensions on TelephoneCodeBean {
  /// 获取完整的显示文本
  String get displayText => '+${code ?? ''} ${name ?? ''}';

  /// 获取带国家的显示文本
  String get fullDisplayText => '+${code ?? ''} ${name ?? ''} (${country ?? ''})';

  /// 获取格式化的区号
  String get formattedCode => '+${code ?? ''}';

  /// 获取简短显示文本（只有区号和国家）
  String get shortDisplayText => '+${code ?? ''} ${country ?? ''}';

  /// 检查是否为中国区号
  bool get isChina => code == '86';

  /// 检查是否为美国区号
  bool get isUSA => code == '1';

  /// 检查是否为日本区号
  bool get isJapan => code == '81';

  /// 检查是否为韩国区号
  bool get isKorea => code == '82';

  /// 检查是否为香港区号
  bool get isHongKong => code == '852';

  /// 检查是否为澳门区号
  bool get isMacao => code == '853';

  /// 检查是否为台湾区号
  bool get isTaiwan => code == '886';

  /// 检查是否为新加坡区号
  bool get isSingapore => code == '65';

  /// 检查是否为马来西亚区号
  bool get isMalaysia => code == '60';

  /// 检查是否为泰国区号
  bool get isThailand => code == '66';

  /// 检查是否为越南区号
  bool get isVietnam => code == '84';

  /// 检查是否为菲律宾区号
  bool get isPhilippines => code == '63';

  /// 检查是否为印度尼西亚区号
  bool get isIndonesia => code == '62';

  /// 检查是否为印度区号
  bool get isIndia => code == '91';

  /// 检查是否为英国区号
  bool get isUK => code == '44';

  /// 检查是否为德国区号
  bool get isGermany => code == '49';

  /// 检查是否为法国区号
  bool get isFrance => code == '33';

  /// 检查是否为意大利区号
  bool get isItaly => code == '39';

  /// 检查是否为西班牙区号
  bool get isSpain => code == '34';

  /// 检查是否为俄罗斯区号
  bool get isRussia => code == '7';

  /// 检查是否为巴西区号
  bool get isBrazil => code == '55';

  /// 检查是否为澳大利亚区号
  bool get isAustralia => code == '61';

  /// 检查是否为加拿大区号（与美国共用）
  bool get isCanada => code == '1';

  /// 检查是否为常用区号
  bool get isCommonCode {
    final commonCodes = [
      '1',   // 美国/加拿大
      '86',  // 中国
      '81',  // 日本
      '82',  // 韩国
      '65',  // 新加坡
      '60',  // 马来西亚
      '66',  // 泰国
      '84',  // 越南
      '63',  // 菲律宾
      '852', // 香港
      '853', // 澳门
      '886', // 台湾
      '44',  // 英国
      '33',  // 法国
      '49',  // 德国
    ];
    return commonCodes.contains(code);
  }

  /// 获取区域分类
  String get region {
    if (isChina || isHongKong || isMacao || isTaiwan) {
      return 'Greater China';
    } else if (isJapan || isKorea) {
      return 'Northeast Asia';
    } else if (isSingapore || isMalaysia || isThailand || isVietnam || 
               isPhilippines || isIndonesia) {
      return 'Southeast Asia';
    } else if (isIndia) {
      return 'South Asia';
    } else if (isUSA || isCanada) {
      return 'North America';
    } else if (isUK || isFrance || isGermany || isItaly || isSpain) {
      return 'Europe';
    } else if (isBrazil) {
      return 'South America';
    } else if (isAustralia) {
      return 'Oceania';
    } else if (isRussia) {
      return 'Eurasia';
    } else {
      return 'Other';
    }
  }

  /// 检查是否为亚洲区号
  bool get isAsian {
    return region.contains('Asia') || region == 'Greater China';
  }

  /// 检查是否为欧洲区号
  bool get isEuropean {
    return region == 'Europe';
  }

  /// 检查是否为美洲区号
  bool get isAmerican {
    return region.contains('America');
  }
}
