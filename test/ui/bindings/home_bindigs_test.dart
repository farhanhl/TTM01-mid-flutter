import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/home_bindings.dart';

import '../pages/post_detail_page_test.mocks.dart';

void main() {
  final mockPostRepository = MockPostRepositoryImpl();

  setUp(() {
    Get.put<PostRepository>(mockPostRepository);
    when(mockPostRepository.getAll()).thenAnswer(
      (_) async => const Right([
        Post(
          userId: 1,
          id: 1,
          title: 'my post title',
          body: 'my post body',
        ),
      ]),
    );
  });

  test('HomeBindings sets up HomeController correctly', () {
    HomeBindings().dependencies();

    final homeController = Get.find<HomeController>();

    expect(homeController, isA<HomeController>());
    expect(homeController.repo, mockPostRepository);
  });
}
