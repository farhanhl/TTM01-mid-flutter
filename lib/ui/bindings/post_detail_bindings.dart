import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/post_detail_controller.dart';

class PostDetailBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController(repo: Get.find<PostRepository>()));
  }
}
