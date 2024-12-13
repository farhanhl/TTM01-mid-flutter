import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/initial_bindings.dart';

@GenerateMocks([PostRemoteDataSource, PostRepository])
void main() {
  test('InitialBindings sets up dependenciescorrectly', () {
    InitialBindings().dependencies();

    final postRemoteDataSource = Get.find<PostRemoteDataSource>();
    expect(postRemoteDataSource, isA<PostRemoteDataSource>());

    final postRepository = Get.find<PostRepository>();
    expect(postRepository, isA<PostRepository>());
  });
}
