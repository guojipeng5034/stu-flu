class StuForgetPasswordReqVO {
  final String? telCode;
  final String? mobile;
  final String? email;
  final String code;

  StuForgetPasswordReqVO({
    this.telCode,
    this.mobile,
    this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        if (telCode != null) 'telCode': telCode,
        if (mobile != null) 'mobile': mobile,
        if (email != null) 'email': email,
        'code': code,
      };
}
