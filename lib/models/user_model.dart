class UserModel {
  late String name;
  late String email;
  late String phone;
  late String userId;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    userId = json['userId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userId': userId,
    };
  }
}
