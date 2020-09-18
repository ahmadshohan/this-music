import 'package:this_music/data/models/user.dart';
import 'package:this_music/shared/constant/social_media.dart';

class LoginModel {
  String email = '';
  String password = '';
  String type = SocialMedia.normalEmailType;

  LoginModel();

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    return data;
  }
}

class LoginResult {
  User user;
  Response response;

  LoginResult({this.user, this.response});

  LoginResult.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}
