class ProfileModel {
  final String username;

  final String profilepic;
  final String phonenum;
  final String email;

  ProfileModel(
      {required this.username,
      required this.email,
      required this.profilepic,
      required this.phonenum});
  Map<String, dynamic> toJson() => {
        'phonenumber': phonenum,
        'username': username,
        'email': email,
        'profilepic': profilepic
      };

  static ProfileModel fromJson(Map<String, dynamic> json) => ProfileModel(
        phonenum: json['phonenumber'],
        username: json['username'],
        email: json['email'],
        profilepic: json['profilepic'],
      );
}
