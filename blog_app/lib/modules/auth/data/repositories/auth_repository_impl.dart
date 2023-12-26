// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/core/error/exception.dart';
import 'package:dartz/dartz.dart';

import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/auth/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:blog_app/modules/auth/data/models/auth_model.dart';
import 'package:blog_app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthenticationRemoteDataSource authenticationRemoteDataSource;
  AuthRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });
  @override
  Future<Either<Failure, AuthModel>> googleSignIn() async {
    try {
      final account = await authenticationRemoteDataSource.googleSignIn();
      return Right(account);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
