import 'package:equatable/equatable.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String? body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  Post toEntity() => Post(userId: userId, id: id, title: title, body: body);

  @override
  List<Object?> get props => [userId, id, title, body];
}
