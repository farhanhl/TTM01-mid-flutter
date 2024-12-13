import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/post_detail_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/post_detail_bindings.dart';

import '../pages/post_detail_page_test.mocks.dart';

void main() {
  final mockPostRepository = MockPostRepositoryImpl();

  setUp(() {
    Get.put<PostRepository>(mockPostRepository);
  });

  test('PostDetailBindings sets up PostDetailController correctly', () {
    PostDetailBidings().dependencies();

    final postDetailController = Get.find<PostDetailController>();

    expect(postDetailController, isA<PostDetailController>());
    expect(postDetailController.repo, mockPostRepository);
  });
}
