class Song {
  String type;
  String album;
  String link;
  int songid;
  String title;
  String author;
  String url;
  String pic;
  Song({
    this.type,
    this.album,
    this.link,
    this.songid,
    this.title,
    this.author,
    this.url,
    this.pic,
  });
  Song.fromJson(Map<String, dynamic> map)
      : type = map["type"],
        album = map["album"],
        link = map["link"],
        songid = map["songid"],
        title = map["title"],
        author = map["author"],
        url = map["url"],
        pic = map["pic"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['album'] = album;
    data['link'] = link;
    data['songid'] = songid;
    data['title'] = title;
    data['author'] = author;
    data['url'] = url;
    data['pic'] = pic;
    return data;
  }
}
