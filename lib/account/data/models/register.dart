class RegisterModel {
  String fullName = '';
  String email = '';
  String password = '';
  String userName = '';
  String genderType = '';
  String phoneNumber = '';
  String dateBirth = '';

  RegisterModel();

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    userName = json['userName'];
    genderType = json['type'];
    phoneNumber = json['phoneNumber'];
    dateBirth = json['dateBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['userName'] = this.userName;
    data['type'] = this.genderType;
    data['phoneNumber'] = this.phoneNumber;
    data['dateBirth'] = this.dateBirth;
    return data;
  }
}
