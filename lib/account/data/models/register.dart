class RegisterModel {
  String fullName = '';
  String email = '';
  String password = '';
  String userName = '';
  String genderType = '';
  String phoneNumber = '';
  String dateBirth = '';
  dynamic avatar = '';

  RegisterModel();

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullName = json['name'];
    userName = json['username'];
    genderType = json['gender'];
    phoneNumber = json['phone'];
    dateBirth = json['date_of_birth'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.fullName;
    data['username'] = this.userName;
    data['gender'] = this.genderType;
    data['phone'] = this.phoneNumber;
    data['date_of_birth'] = this.dateBirth;
    data['avatar'] = this.avatar;
    return data;
  }
}
