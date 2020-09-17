class User {
  dynamic id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int role;
  dynamic avatar;
  String createdAt;
  String updatedAt;
  dynamic gender;
  dynamic username;
  dynamic typeLogin;
  dynamic otherId;
  String phone;
  dynamic gun;
  dynamic ay;
  dynamic yil;
  dynamic token;
  int active;
  dynamic country;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.role,
      this.avatar,
      this.createdAt,
      this.updatedAt,
      this.gender,
      this.username,
      this.typeLogin,
      this.otherId,
      this.phone,
      this.gun,
      this.ay,
      this.yil,
      this.token,
      this.active,
      this.country});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gender = json['gender'];
    username = json['username'];
    typeLogin = json['type_login'];
    otherId = json['other_id'];
    phone = json['phone'];
    gun = json['gun'];
    ay = json['ay'];
    yil = json['yil'];
    token = json['token'];
    active = json['active'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['avatar'] = this.avatar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['type_login'] = this.typeLogin;
    data['other_id'] = this.otherId;
    data['phone'] = this.phone;
    data['gun'] = this.gun;
    data['ay'] = this.ay;
    data['yil'] = this.yil;
    data['token'] = this.token;
    data['active'] = this.active;
    data['country'] = this.country;
    return data;
  }
}

class Response {
  String token;

  Response({this.token});

  Response.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
