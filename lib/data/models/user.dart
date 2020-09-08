class User {
  int userId;
  String userName;
  dynamic specialization;
  bool availability;
  dynamic dateOfBirth;
  dynamic image;
  dynamic city;
  dynamic country;
  List<dynamic> languages;

  User({
    this.userId,
    this.userName,
    this.specialization,
    this.availability,
    this.dateOfBirth,
    this.image,
    this.city,
    this.country,
    this.languages,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    specialization = json['specialization'];
    availability = json['availability'];
    dateOfBirth = json['dateOfBirth'];
    image = json['image'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['specialization'] = this.specialization;
    data['availability'] = this.availability;
    data['dateOfBirth'] = this.dateOfBirth;
    data['image'] = this.image;
    data['city'] = this.city;
    data['country'] = this.country;

    return data;
  }
}
