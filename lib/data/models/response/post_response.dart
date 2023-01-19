import 'package:flutter_mvvm_example/domain/entities/post_entity.dart';

class PostResponse extends PostEntity {
  int userId;
  int id;
  String title;
  String body;

  PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(id: id, title: title, body: body);

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}