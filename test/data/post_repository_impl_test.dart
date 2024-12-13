import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

import '../ui/bindings/initial_bindings_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource])
void main() {
  late PostRepositoryImpl postRepository;
  late MockPostRemoteDataSource mockRemote;

  setUp(() {
    mockRemote = MockPostRemoteDataSource();
    postRepository = PostRepositoryImpl(remote: mockRemote);
  });

  group('PostRepositoryImpl', () {
    const post = Post(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    const postModel = PostModel(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    test('should return a list of posts on successful fetch', () async {
      when(mockRemote.fetchAll()).thenAnswer((_) async => [postModel]);
      final result = await postRepository.getAll();
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (posts) {
          expect(posts.length, 1);
          expect(posts[0], post);
        },
      );
    });

    test('should return a Left with error message when fetchAll fails',
        () async {
      when(mockRemote.fetchAll())
          .thenThrow(ServerException('Failed to fetch posts'));
      final result = await postRepository.getAll();
      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, 'Failed to fetch posts');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });

    test('should return a post by id on successful fetch', () async {
      when(mockRemote.fetchPostById(1)).thenAnswer((_) async => postModel);
      final result = await postRepository.getPostById(1);
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (fetchedPost) {
          expect(fetchedPost, post);
        },
      );
    });

    test('should return a Left with error message when getPostById fails',
        () async {
      when(mockRemote.fetchPostById(1))
          .thenThrow(ServerException('Failed to fetch post'));
      final result = await postRepository.getPostById(1);
      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, 'Failed to fetch post');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
