import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/auth/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> googleSignIn();
}
