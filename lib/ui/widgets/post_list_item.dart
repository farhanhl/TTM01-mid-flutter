import 'package:flutter/material.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  // on changed
  final void Function(bool?)? onChanged;

  const PostListItem({
    super.key,
    required this.post,
    this.onChanged,
  });

  // build Post list item that has title, description and completed status
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(
        post.bodyText ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
