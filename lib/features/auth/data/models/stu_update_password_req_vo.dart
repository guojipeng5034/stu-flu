class StuUpdatePasswordReqVO {
  final String tempToken;
  final String password;

  StuUpdatePasswordReqVO({
    required this.tempToken,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'tempToken': tempToken,
        'password': password,
      };

  factory StuUpdatePasswordReqVO.fromJson(Map<String, dynamic> json) =>
      StuUpdatePasswordReqVO(
        tempToken: json['tempToken'] as String,
        password: json['password'] as String,
      );
}
