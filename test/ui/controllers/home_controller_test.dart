import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';

import '../../widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()])
void main() {
  late HomeController controller;
  late MockPostRepositoryImpl mockRepo;

  setUp(() {
    mockRepo = MockPostRepositoryImpl();
    controller = HomeController(repo: mockRepo);

    when(mockRepo.getAll()).thenAnswer(
      (_) async => const Right([
        Post(
          userId: 1,
          id: 1,
          title: 'my post title',
          body: 'my post body',
        ),
      ]),
    );
    Get.put(controller);
  });

  tearDown(() {
    Get.reset();
  });

  test('Fetch Posts On Init', () async {
    expect(controller.isLoading.value, false);
    await controller.fetchPosts();
    expect(controller.isLoading.value, false);
    expect(controller.posts.isNotEmpty, true);
  });

  test('Fetch Posts Success', () async {
    const post = Post(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    await controller.fetchPosts();
    expect(controller.posts.first, equals(post));
  });
}
