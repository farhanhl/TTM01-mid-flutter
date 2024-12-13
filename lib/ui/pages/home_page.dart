import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/post_detail_page.dart';
import 'package:ttm01_flutter_dependency_injection/ui/widgets/post_list_item.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final String bundleId;
  final String flavorName;

  const HomePage({super.key, required this.bundleId, required this.flavorName});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(repo: Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          flavorName == "Production"
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Flavor Name: $flavorName',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Bundle ID: $bundleId',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Get.to(
                    const PostDetailPage(),
                    arguments: controller.posts[index].id,
                  ),
                  child: PostListItem(post: controller.posts[index]),
                ),
                itemCount: controller.posts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
