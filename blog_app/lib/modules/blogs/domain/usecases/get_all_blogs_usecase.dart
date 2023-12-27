import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/blogs/data/models/blog_model.dart';
import 'package:blog_app/modules/blogs/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllBlogsUseCase{
  final BlogRepository blogRepository;

  GetAllBlogsUseCase({required this.blogRepository});

  Future<Either<Failure, List<BlogModel>>> call() async {
    return blogRepository.getAllBlogs();
  }
}
