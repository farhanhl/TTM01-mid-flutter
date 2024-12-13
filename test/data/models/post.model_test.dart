import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';

import 'post.model_test.mocks.dart';

@GenerateMocks([PostModel])
void main() {
  group('PostModel Tests', () {
    late MockPostModel mockPostModel;

    setUp(() {
      mockPostModel = MockPostModel();
    });

    const postModel = PostModel(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    const postModel2 = PostModel(
      userId: 1,
      id: 2,
      title: 'my post title 2',
      body: 'my post body 2',
    );

    test('should create PostModel from JSON correctly', () {
      final json = {
        'userId': 1,
        'id': 101,
        'title': 'my post title',
        'body': 'my post body',
      };

      when(mockPostModel.userId).thenReturn(1);
      when(mockPostModel.id).thenReturn(101);
      when(mockPostModel.title).thenReturn('my post title');
      when(mockPostModel.body).thenReturn('my post body');

      final result = PostModel.fromJson(json);

      expect(result.userId, equals(mockPostModel.userId));
      expect(result.id, equals(mockPostModel.id));
      expect(result.title, equals(mockPostModel.title));
      expect(result.body, equals(mockPostModel.body));
    });

    test('should convert PostModel to JSON correctly', () {
      const postModel = PostModel(
        userId: 1,
        id: 1,
        title: 'my post title',
        body: 'my post body',
      );

      final jsonResult = postModel.toJson();

      expect(jsonResult, {
        'userId': 1,
        'id': 1,
        'title': 'my post title',
        'body': 'my post body',
      });
    });

    test('should convert PostModel to Post entity correctly', () {
      const postModel = PostModel(
        userId: 1,
        id: 1,
        title: 'my post title',
        body: 'my post body',
      );

      final postEntity = postModel.toEntity();

      expect(postEntity.userId, postModel.userId);
      expect(postEntity.id, postModel.id);
      expect(postEntity.title, postModel.title);
      expect(postEntity.body, postModel.body);
    });

    test('should have the correct props', () {
      expect(
          postModel.props,
          equals([
            postModel.userId,
            postModel.id,
            postModel.title,
            postModel.body
          ]));
    });

    test('should be equal when props are the same', () {
      expect(postModel, equals(postModel));
    });

    test('should not be equal when props are different', () {
      expect(postModel, isNot(equals(postModel2)));
    });
  });
}
