class SongResult {
  String status;
  int errors;
  List<Song> data;

  SongResult({this.status, this.errors, this.data});

  SongResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = new List<Song>();
      json['data'].forEach((v) {
        data.add(new Song.fromJson(v));
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

class Song {
  int id;
  String name;
  int languageId;
  int songsId;
  String createdAt;
  String updatedAt;
  SongModel songs;

  Song(
      {this.id,
      this.name,
      this.languageId,
      this.songsId,
      this.createdAt,
      this.updatedAt,
      this.songs});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    languageId = json['language_id'];
    songsId = json['songs_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    songs =
        json['songs'] != null ? new SongModel.fromJson(json['songs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['language_id'] = this.languageId;
    data['songs_id'] = this.songsId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.songs != null) {
      data['songs'] = this.songs.toJson();
    }
    return data;
  }
}

class SongModel {
  int id;
  String name;
  String avatar;
  String file;
  int languageId;
  int albumId;
  int categoryId;
  String createdAt;
  String updatedAt;

  SongModel(
      {this.id,
      this.name,
      this.avatar,
      this.file,
      this.languageId,
      this.albumId,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  SongModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    file = json['file'];
    languageId = json['language_id'];
    albumId = json['album_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['file'] = this.file;
    data['language_id'] = this.languageId;
    data['album_id'] = this.albumId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
