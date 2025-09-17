class SuggestRespVO {
  final String type; // 1-male, 2-female
  final String nickname;

  SuggestRespVO({required this.type, required this.nickname});

  factory SuggestRespVO.fromJson(Map<String, dynamic> json) {
    return SuggestRespVO(
      type: json['type'] ?? '',
      nickname: json['nickname'] ?? '',
    );
  }
}

class CommonResultListSuggestRespVO {
  final int code;
  final List<SuggestRespVO> data;
  final String msg;

  CommonResultListSuggestRespVO({
    required this.code,
    required this.data,
    required this.msg,
  });

  factory CommonResultListSuggestRespVO.fromJson(Map<String, dynamic> json) {
    return CommonResultListSuggestRespVO(
      code: json['code'] ?? -1,
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => SuggestRespVO.fromJson(e))
          .toList(),
      msg: json['msg'] ?? '',
    );
  }
}
