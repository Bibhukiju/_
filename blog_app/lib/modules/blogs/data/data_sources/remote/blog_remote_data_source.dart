import 'package:blog_app/modules/blogs/data/models/blog_model.dart';

abstract class BlogRemoteDataSource {
  Future<List<BlogModel>> getAllBlogs();
}
