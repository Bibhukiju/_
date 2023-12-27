class BlogEntity {
  String? blogId;
  String? title;
  String? content;
  String? blogImage;
  String? createdAt;
  String? updatedAt;
  User? user;

  BlogEntity(
      {this.blogId,
      this.user,
      this.title,
      this.content,
      this.blogImage,
      this.createdAt,
      this.updatedAt});
}

class User {
  String? id;
  String? name;
  String? email;
  String? imageAddress;

  User({this.id, this.name, this.email, this.imageAddress});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    imageAddress = json['image_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image_address'] = imageAddress;
    return data;
  }
}
