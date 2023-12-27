import 'dart:convert';

import 'package:blog_app/core/constants/app_generic_const.dart';
import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/modules/blogs/data/data_sources/remote/blog_remote_data_source.dart';
import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  @override
  Future<List<BlogModel>> getAllBlogs() async {
    final response =
        await http.get(Uri.parse("${AppGenericConst.hostUrl}/blogs")).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw ServerException("Server Response Timeout");
      },
    );

    final responseData = jsonDecode(response.body);
    if (response.statusCode >= 400) {
      throw ServerException(responseData['message']);
    }
    List<BlogModel> blogList = [];
    for (var element in responseData) {
      blogList.add(BlogModel.fromMap(element));
    }
    return blogList;
  }
}
