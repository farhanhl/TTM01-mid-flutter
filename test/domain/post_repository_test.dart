import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../ui/pages/post_detail_page_test.mocks.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

void main() {
  late MockPostRepositoryImpl mockRepo;

  setUp(() {
    mockRepo = MockPostRepositoryImpl();
  });

  group('PostRepository', () {
    test('should return a list of posts when getAll() is called', () async {
      final posts = [
        const Post(
          userId: 1,
          id: 1,
          title: 'my post title',
          body: 'my post body',
        ),
        const Post(
          userId: 1,
          id: 2,
          title: 'my post title 2',
          body: 'my post body 2',
        ),
      ];
      when(mockRepo.getAll()).thenAnswer(
        (_) async => Right(posts),
      );

      final result = await mockRepo.getAll();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) => expect(r, posts),
      );
    });

    test('should return a specific post when getPostById() is called',
        () async {
      const post = Post(
        userId: 1,
        id: 1,
        title: 'Test Post Title',
        body: 'Test Post Body',
      );
      when(mockRepo.getPostById(1)).thenAnswer(
        (_) async => const Right(post),
      );

      final result = await mockRepo.getPostById(1);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) => expect(r, post),
      );
    });

    test('should return error message when getAll() fails', () async {
      when(mockRepo.getAll()).thenAnswer(
        (_) async => const Left('Error fetching posts'),
      );

      final result = await mockRepo.getAll();

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, 'Error fetching posts'),
        (r) => fail('Expected Left, but got Right'),
      );
    });

    test('should return error message when getPostById() fails', () async {
      when(mockRepo.getPostById(1)).thenAnswer(
        (_) async => const Left('Error fetching post'),
      );

      final result = await mockRepo.getPostById(1);

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, 'Error fetching post'),
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
