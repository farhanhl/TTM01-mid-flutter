import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';

class HomeController extends GetxController {
  final PostRepository repo;
  final posts = <Post>[].obs;
  final isLoading = false.obs;

  HomeController({required this.repo});

  @override
  void onInit() {
    super.onInit();

    // fetch Posts on init
    fetchPosts();
  }

  /// Fetches the list of Posts from the repository and updates the [Posts]
  /// observable list with the result. If the fetch fails, it shows a snackbar
  /// with the error message.
  Future<void> fetchPosts() async {
    isLoading.value = true;
    final result = await repo.getAll();
    result.fold((l) => Get.snackbar('Error', l), (r) => posts.value = r);
    isLoading.value = false;
  }
}
