import 'dart:convert';

import 'package:blog_app/core/constants/app_generic_const.dart';
import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/modules/auth/data/models/auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'authentication_remote_data_source.dart';

import 'package:http/http.dart' as http;

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final GoogleSignIn googleSignInInstance = GoogleSignIn();

  @override
  Future<AuthModel> googleSignIn() async {
    try {
      final account = await googleSignInInstance.signIn();
      Map<String, dynamic> reqbody = {
        "name": account!.displayName,
        "email": account.email,
        "image": account.photoUrl
      };
      print(reqbody);
      final response = await http.post(
          Uri.parse("${AppGenericConst.hostUrl}/auth"),
          body: jsonEncode(reqbody),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 30), onTimeout: () {
        throw ServerException('Server Response Timeout');
      });
      await googleSignInInstance.disconnect();
      final responseData = jsonDecode(response.body);
      if (response.statusCode >= 400) {
        googleSignInInstance.disconnect();
        throw ServerException(responseData['message']);
      }

      return AuthModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      return AuthModel(msg: "err");
    }
  }
}
