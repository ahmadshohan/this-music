class AlbumsResult {
  String status;
  int errors;
  List<Album> data;

  AlbumsResult({this.status, this.errors, this.data});

  AlbumsResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = new List<Album>();
      json['data'].forEach((v) {
        data.add(new Album.fromJson(v));
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

class Album {
  int id;
  String name;
  int languageId;
  int albumId;
  String createdAt;
  String updatedAt;
  AlbumModel album;

  Album(
      {this.id,
      this.name,
      this.languageId,
      this.albumId,
      this.createdAt,
      this.updatedAt,
      this.album});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    languageId = json['language_id'];
    albumId = json['album_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    album =
        json['album'] != null ? new AlbumModel.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['language_id'] = this.languageId;
    data['album_id'] = this.albumId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    return data;
  }
}

class AlbumModel {
  int id;
  String name;
  String avatar;
  int languageId;
  int artistId;
  String createdAt;
  String updatedAt;

  AlbumModel(
      {this.id,
      this.name,
      this.avatar,
      this.languageId,
      this.artistId,
      this.createdAt,
      this.updatedAt});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    languageId = json['language_id'];
    artistId = json['artist_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['language_id'] = this.languageId;
    data['artist_id'] = this.artistId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
