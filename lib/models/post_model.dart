class PostModel {
  String? userId;
  late String name;
  late String profileImage;
  late String dateTime;
  late String postText;
  late String postImage;

  PostModel({
    required this.userId,
    required this.name,
    required this.profileImage,
    required this.dateTime,
    required this.postText,
    required this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    profileImage = json['profileImage'];
    dateTime = json['dateTime'];
    postText = json['postText'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'profileImage': profileImage,
      'dateTime': dateTime,
      'postText': postText,
      'postImage': postImage,
    };
  }
}
