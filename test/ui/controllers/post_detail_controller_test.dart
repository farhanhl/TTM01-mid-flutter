import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/post_detail_controller.dart';

import '../../widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()])
void main() {
  late PostDetailController controller;
  late MockPostRepositoryImpl mockRepo;

  setUp(() {
    mockRepo = MockPostRepositoryImpl();
    controller = PostDetailController(repo: mockRepo);

    when(mockRepo.getPostById(1)).thenAnswer(
      (_) async => const Right(
        Post(
          userId: 1,
          id: 1,
          title: 'my post title',
          body: 'my post body',
        ),
      ),
    );
    Get.put(controller);
  });

  tearDown(() {
    Get.reset();
  });

  test('Fetch Data On Init', () async {
    when(mockRepo.getPostById(1)).thenAnswer(
      (_) async => const Right(
        Post(
          userId: 1,
          id: 1,
          title: 'my post title',
          body: 'my post body',
        ),
      ),
    );

    expect(controller.isLoading.value, false);
    await controller.fetctPostById(1);
    expect(controller.isLoading.value, false);
    expect(controller.post.value, isNotNull);
  });

  test('Fetch Post By Id Success', () async {
    const post = Post(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    await controller.fetctPostById(1);
    expect(controller.post.value, equals(post));
  });
}
