import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';

class PostDetailController extends GetxController {
  final PostRepository repo;
  final post = Rxn<Post>();
  final isLoading = false.obs;

  PostDetailController({required this.repo});

  @override
  void onInit() {
    super.onInit();
    fetctPostById(Get.arguments ?? 1);
  }

  Future<void> fetctPostById(int postId) async {
    isLoading.value = true;
    final result = await repo.getPostById(postId);
    result.fold((l) => Get.snackbar('Error', l), (r) => post.value = r);
    isLoading.value = false;
  }
}
