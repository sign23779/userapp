class UserModel {
  final String? phonenumber;

  UserModel({
    required this.phonenumber,
  });
  Map<String, dynamic> toJson() => {
        'phonenumber': phonenumber,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        phonenumber: json['phonenumber'],
      );
}
