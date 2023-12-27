import 'dart:convert';

import 'package:blog_app/modules/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.msg,
    super.data,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'msg': msg, "data": data};
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      msg: map["msg"] as String,
      data: map["data"] ?? map["data"],
    );
  }
  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
