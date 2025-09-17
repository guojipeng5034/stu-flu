class StuTempTokenAuthReqVO {
  final String tempToken;
  final int? socialType;
  final String? socialOpenid;

  StuTempTokenAuthReqVO({
    required this.tempToken,
    this.socialType,
    this.socialOpenid,
  });

  Map<String, dynamic> toJson() => {
        'tempToken': tempToken,
        if (socialType != null) 'socialType': socialType,
        if (socialOpenid != null) 'socialOpenid': socialOpenid,
      };
}
