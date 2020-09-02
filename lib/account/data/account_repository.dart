import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/data/repository.dart';
import 'package:this_music/shared/constant/social_media.dart';
import 'package:this_music/shared/localization/app_localization.dart';

import 'models/login.dart';
import 'models/register.dart';

class AccountRepository extends Repository {
  String _path;

  AccountRepository() {
    _path = '${apiUrl}auth/';
  }

  Future<Result<dynamic>> login(LoginModel model) async {
    try {
      final response = await dio.post('${_path}login',
          data: FormData.fromMap(model.toJson()));
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS, data: LoginResult.fromJson(data));
      } else
        return getError(response);
    } catch (e) {
      print(e);
      if (e is DioError)
        return getError(e.response);
      else
        return Result(ResultStatus.FAIL,
            errorMessage: AppLocalization.someError);
    }
  }

  Future<Result<dynamic>> register(RegisterModel model) async {
    try {
      final data = model.toJson();
      var formData = FormData.fromMap(data);

      final response = await dio.post('${_path}register',
          data: formData, options: Options(contentType: 'multipart/form-data'));
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS, data: LoginResult.fromJson(data));
      } else
        return getError(response);
    } catch (e) {
      print(e);
      if (e is DioError)
        return getError(e.response);
      else
        return Result(ResultStatus.FAIL,
            errorMessage: AppLocalization.someError);
    }
  }

  Future<Result<dynamic>> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        return _socialMediaLogin(result.email, result.displayName,
            SocialMedia.googlePrefix, SocialMedia.googlePassword);
      }
      return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
    } catch (error) {
      print(error);
      return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
    }
  }

  Future<Result<dynamic>> facebookSignIn() async {
    try {
      final result = await FacebookLogin().logIn(['email']);
      if (result.status == FacebookLoginStatus.loggedIn) {
        final response = await dio.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');
        final profile = jsonDecode(response.data);
        return _socialMediaLogin(profile['email'], profile['name'],
            SocialMedia.facebookPrefix, SocialMedia.facebookPassword);
      }
      return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
    } catch (error) {
      print(error);
      return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
    }
  }

  logout() async {
    try {
      await FacebookLogin().logOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<Result<dynamic>> _socialMediaLogin(
      String email, String name, String prefix, String password) async {
    //try login
    final loginModel = LoginModel();
    loginModel.email = prefix + email;
    loginModel.password = password;
    final loginResult = await login(loginModel);
    if (loginResult.state == ResultStatus.SUCCESS)
      return Result(ResultStatus.SUCCESS, data: loginResult.data);

    //try register
    final registerModel = RegisterModel();
    registerModel.email = prefix + email;
    registerModel.userName = name;
    registerModel.password = password;
    final registerResult = await register(registerModel);
    if (registerResult.state == ResultStatus.SUCCESS)
      return Result(ResultStatus.SUCCESS, data: registerResult.data);

    return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
  }
}
