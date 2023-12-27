// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/modules/blogs/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/blogs/data/data_sources/remote/blog_remote_data_source.dart';
import 'package:blog_app/modules/blogs/data/models/blog_model.dart';


class BlogRepositoryImpl implements BlogRepository {
  BlogRemoteDataSource blogRemoteDataSource;
  BlogRepositoryImpl({
    required this.blogRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BlogModel>>> getAllBlogs() async {
    try {
      final listOfBlogs = await blogRemoteDataSource.getAllBlogs();
      return Right(listOfBlogs);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message!));
    } on NoDataException catch (_) {
      return Left(NoDataFailure());
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
