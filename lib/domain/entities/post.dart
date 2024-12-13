import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String? body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // remove all new lines
  String? get bodyText => body?.replaceAll('\n', ' ');

  @override
  List<Object?> get props => [userId, id, title, body];
}
