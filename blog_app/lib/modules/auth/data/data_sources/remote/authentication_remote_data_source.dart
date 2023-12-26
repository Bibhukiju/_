import 'package:blog_app/modules/auth/data/models/auth_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthModel> googleSignIn();
}
