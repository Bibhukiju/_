import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRepository {
  Future<Either<Failure, List<BlogModel>>> getAllBlogs();
}
