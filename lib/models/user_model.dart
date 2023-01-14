class UserModel {
  late String name;
  late String email;
  late String phone;
  late String image;
  late String coverImage;
  late String bio;
  late String? userId;
  late bool isEmailVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userId,
    required this.image,
    required this.coverImage,
    required this.bio,
    this.isEmailVerified = false,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    userId = json['userId'];
    image = json['image'];
    coverImage = json['coverImage'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userId': userId,
      'image' : image,
      'coverImage' : coverImage,
      'bio' : bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
