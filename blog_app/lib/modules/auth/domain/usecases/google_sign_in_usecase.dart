import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/modules/auth/data/models/auth_model.dart';
import 'package:blog_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleSignInUseCase {
  AuthRepository authRepository;
  GoogleSignInUseCase({required this.authRepository});
  Future<Either<Failure, AuthModel>> call() {
    return authRepository.googleSignIn();
  }
}
