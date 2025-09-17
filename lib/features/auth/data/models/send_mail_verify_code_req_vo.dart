class SendMailVerifyCodeReqVO {
  final String? language;
  final String email;
  final int scene;

  SendMailVerifyCodeReqVO({
    this.language,
    required this.email,
    required this.scene,
  });

  Map<String, dynamic> toJson() => {
        if (language != null) 'language': language,
        'email': email,
        'scene': scene,
      };
}
