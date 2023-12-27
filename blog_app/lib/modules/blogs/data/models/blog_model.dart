import 'dart:convert';

import 'package:blog_app/modules/blogs/domain/entity/blog_entity.dart';

class BlogModel extends BlogEntity {
  BlogModel(
      {required super.blogId,
      required super.blogImage,
      required super.content,
      required super.title,
      required super.createdAt,
      required super.updatedAt,
      required super.user});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "blogId": blogId,
      "blogImage": blogImage,
      "content": content,
      "title": title,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
        blogId: map["blog_id"] != null ? map["blog_id"] as String : null,
        blogImage:
            map["blog_image"] != null ? map["blog_image"] as String : null,
        content: map["content"] != null ? map["content"] as String : null,
        title: map["title"] != null ? map["title"] as String : null,
        createdAt: map["createdAt"] != null ? map["createdAt"] as String : null,
        updatedAt: map["updatedAt"] != null ? map["updatedAt"] as String : null,
        user: map["user"] != null ? User.fromJson(map["user"]) : null);
  }

  String toJson() => jsonEncode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
