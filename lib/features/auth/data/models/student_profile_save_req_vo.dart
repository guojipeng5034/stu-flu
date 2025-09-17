class StudentProfileSaveReqVO {
  final String detailFirstName;
  final String nickname;
  final int genderId;
  final String birthday;
  final String imageFile;

  StudentProfileSaveReqVO({
    required this.detailFirstName,
    required this.nickname,
    required this.genderId,
    required this.birthday,
    required this.imageFile,
  });

  Map<String, dynamic> toJson() => {
        'detailFirstName': detailFirstName,
        'nickname': nickname,
        'genderId': genderId,
        'birthday': birthday,
        'imageFile': imageFile,
      };
}
