import 'package:dio/dio.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:this_music/data/models/result.dart';
import 'package:this_music/data/repository.dart';
import 'package:this_music/profile/edit_profile/data/models/profile.dart';
import 'package:this_music/shared/localization/app_localization.dart';

class ProfileRepository extends Repository {
  String _path;

  ProfileRepository() {
    _path = '${apiUrl}api/';
  }

  Future<Result<dynamic>> update(ProfileModel model) async {
    try {
      final data = model.toJson();
      var formData = FormData.fromMap(data);
      final response = await dio.post('${_path}update',
          data: formData, options: Options(contentType: 'multipart/form-data'));
      if (response.statusCode == 200) {
        final data = response.data;
        return Result(ResultStatus.SUCCESS, data: ProfileModel.fromJson(data));
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

  logout() async {
    try {
      await FacebookLogin().logOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }
  }
}
