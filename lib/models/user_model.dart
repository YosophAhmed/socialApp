class UserModel {
  String? userId;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String coverImage;
  late String bio;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.coverImage,
    required this.bio,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    coverImage = json['coverImage'];
    bio = json['bio'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'image' : image,
      'coverImage' : coverImage,
      'bio' : bio,
    };
  }
}
