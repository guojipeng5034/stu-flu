class SendSmsVerifyCodeReqVO {
  final String telCode;
  final String mobile;
  final int scene;

  SendSmsVerifyCodeReqVO({
    required this.telCode,
    required this.mobile,
    required this.scene
  });

  Map<String, dynamic> toJson() => {
        'telCode': telCode,
        'mobile': mobile,
        'scene': scene
      };
}
