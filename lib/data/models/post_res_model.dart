import 'dart:convert';

import '../../domein/entities/post_entity.dart';

List<PostResModel> postModelFromJson(String str) =>
    List<PostResModel>.from(json.decode(str).map((x) => PostResModel.fromJson(x)));

String postModelToJson(List<PostResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostResModel extends PostEntity {
  PostResModel({super.userId, super.id, super.title, super.body});

  factory PostResModel.fromJson(Map<String, dynamic> json) => PostResModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}