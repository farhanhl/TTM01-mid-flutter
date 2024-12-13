import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

void main() {
  group('Post', () {
    test('should create Post instance correctly', () {
      const post = Post(
        userId: 1,
        id: 1,
        title: 'Title',
        body: 'This is the body.',
      );

      expect(post.userId, 1);
      expect(post.id, 1);
      expect(post.title, 'Title');
      expect(post.body, 'This is the body.');
    });

    test('should check equality between two Post instances', () {
      const post1 = Post(
        userId: 1,
        id: 1,
        title: 'Title',
        body: 'This is the body.',
      );
      const post2 = Post(
        userId: 1,
        id: 1,
        title: 'Title',
        body: 'This is the body.',
      );

      expect(post1, post2);
    });

    test('should not be equal to a different Post instance', () {
      const post1 = Post(
        userId: 1,
        id: 1,
        title: 'my post title',
        body: 'my post body',
      );
      const post2 = Post(
        userId: 1,
        id: 2,
        title: 'my post title 2',
        body: 'my post body 2',
      );

      expect(post1, isNot(post2));
    });
  });
}
