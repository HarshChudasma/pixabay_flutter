import 'dart:convert';

List<GetImagepixabayModel> getImagepixabayModelFromJson(String str) => List<GetImagepixabayModel>.from(json.decode(str).map((x) => GetImagepixabayModel.fromJson(x)));

String getImagepixabayModelToJson(List<GetImagepixabayModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetImagepixabayModel {
  int id;
  String pageUrl;
  String type;
  String tags;
  String previewUrl;
  int previewWidth;
  int previewHeight;
  String webformatUrl;
  int webformatWidth;
  int webformatHeight;
  String largeImageUrl;
  int imageWidth;
  int imageHeight;
  int imageSize;
  int views;
  int downloads;
  int collections;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  GetImagepixabayModel({
    this.id = 0,
    this.pageUrl = '',
    this.type = '',
    this.tags = '',
    this.previewUrl = '',
    this.previewWidth = 0,
    this.previewHeight = 0,
    this.webformatUrl = '',
    this.webformatWidth = 0,
    this.webformatHeight = 0,
    this.largeImageUrl = '',
    this.imageWidth = 0,
    this.imageHeight = 0,
    this.imageSize = 0,
    this.views = 0,
    this.downloads = 0,
    this.collections = 0,
    this.likes = 0,
    this.comments = 0,
    this.userId = 0,
    this.user = '',
    this.userImageUrl = '',
  });

  factory GetImagepixabayModel.fromJson(Map<String, dynamic> json) => GetImagepixabayModel(
    id: json["id"] ?? 0,
    pageUrl: json["pageURL"] ?? '',
    type: json["type"] ?? '',
    tags: json["tags"] ?? '',
    previewUrl: json["previewURL"] ?? '',
    previewWidth: json["previewWidth"] ?? 0,
    previewHeight: json["previewHeight"] ?? 0,
    webformatUrl: json["webformatURL"] ?? '',
    webformatWidth: json["webformatWidth"] ?? 0,
    webformatHeight: json["webformatHeight"] ?? 0,
    largeImageUrl: json["largeImageURL"] ?? '',
    imageWidth: json["imageWidth"] ?? 0,
    imageHeight: json["imageHeight"] ?? 0,
    imageSize: json["imageSize"] ?? 0,
    views: json["views"] ?? 0,
    downloads: json["downloads"] ?? 0,
    collections: json["collections"] ?? 0,
    likes: json["likes"] ?? 0,
    comments: json["comments"] ?? 0,
    userId: json["user_id"] ?? 0,
    user: json["user"] ?? '',
    userImageUrl: json["userImageURL"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pageURL": pageUrl,
    "type": type,
    "tags": tags,
    "previewURL": previewUrl,
    "previewWidth": previewWidth,
    "previewHeight": previewHeight,
    "webformatURL": webformatUrl,
    "webformatWidth": webformatWidth,
    "webformatHeight": webformatHeight,
    "largeImageURL": largeImageUrl,
    "imageWidth": imageWidth,
    "imageHeight": imageHeight,
    "imageSize": imageSize,
    "views": views,
    "downloads": downloads,
    "collections": collections,
    "likes": likes,
    "comments": comments,
    "user_id": userId,
    "user": user,
    "userImageURL": userImageUrl,
  };
}
