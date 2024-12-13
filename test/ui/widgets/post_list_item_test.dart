import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/ui/widgets/post_list_item.dart';

void main() {
  testWidgets('PostListItem displays title and body text correctly',
      (tester) async {
    const post = Post(
      id: 1,
      userId: 1,
      title: 'my post title',
      body: 'my post body',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PostListItem(post: post),
        ),
      ),
    );

    expect(find.text('my post title'), findsOneWidget);
    expect(find.text('my post body'), findsOneWidget);
  });
}
