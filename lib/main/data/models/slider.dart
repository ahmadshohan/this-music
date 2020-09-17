class SliderResult {
  String status;
  int errors;
  List<Slider> data;

  SliderResult({this.status, this.errors, this.data});

  SliderResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = new List<Slider>();
      json['data'].forEach((v) {
        data.add(new Slider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  dynamic id;
  String name;
  dynamic subName;
  dynamic subSummary;
  dynamic summary;
  dynamic summary1;
  dynamic subSummary2;
  int languageId;
  int hpContentsId;
  dynamic createdAt;
  dynamic updatedAt;
  SliderModel contents;

  Slider(
      {this.id,
      this.name,
      this.subName,
      this.subSummary,
      this.summary,
      this.summary1,
      this.subSummary2,
      this.languageId,
      this.hpContentsId,
      this.createdAt,
      this.updatedAt,
      this.contents});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    subSummary = json['sub_summary'];
    summary = json['summary'];
    summary1 = json['summary1'];
    subSummary2 = json['sub_summary2'];
    languageId = json['language_id'];
    hpContentsId = json['hp_contents_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contents = json['contents'] != null
        ? new SliderModel.fromJson(json['contents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_name'] = this.subName;
    data['sub_summary'] = this.subSummary;
    data['summary'] = this.summary;
    data['summary1'] = this.summary1;
    data['sub_summary2'] = this.subSummary2;
    data['language_id'] = this.languageId;
    data['hp_contents_id'] = this.hpContentsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.contents != null) {
      data['contents'] = this.contents.toJson();
    }
    return data;
  }
}

class SliderModel {
  dynamic id;
  String name;
  dynamic subName;
  dynamic summary;
  dynamic subSummary;
  dynamic summary1;
  dynamic subSummary2;
  dynamic video;
  String link;
  String avatar1;
  String avatar2;
  String avatar3;
  String avatar4;
  String type;
  int userId;
  int languageId;
  String createdAt;
  String updatedAt;

  SliderModel(
      {this.id,
      this.name,
      this.subName,
      this.summary,
      this.subSummary,
      this.summary1,
      this.subSummary2,
      this.video,
      this.link,
      this.avatar1,
      this.avatar2,
      this.avatar3,
      this.avatar4,
      this.type,
      this.userId,
      this.languageId,
      this.createdAt,
      this.updatedAt});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    summary = json['summary'];
    subSummary = json['sub_summary'];
    summary1 = json['summary1'];
    subSummary2 = json['sub_summary2'];
    video = json['video'];
    link = json['link'];
    avatar1 = json['avatar1'];
    avatar2 = json['avatar2'];
    avatar3 = json['avatar3'];
    avatar4 = json['avatar4'];
    type = json['type'];
    userId = json['user_id'];
    languageId = json['language_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_name'] = this.subName;
    data['summary'] = this.summary;
    data['sub_summary'] = this.subSummary;
    data['summary1'] = this.summary1;
    data['sub_summary2'] = this.subSummary2;
    data['video'] = this.video;
    data['link'] = this.link;
    data['avatar1'] = this.avatar1;
    data['avatar2'] = this.avatar2;
    data['avatar3'] = this.avatar3;
    data['avatar4'] = this.avatar4;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['language_id'] = this.languageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
