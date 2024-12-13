import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/post_detail_controller.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PostDetailController(repo: Get.find()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail Page'),
      ),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "userId : ${controller.post.value?.userId ?? ''}",
                ),
                Text(
                  "id : ${controller.post.value?.id ?? ''}",
                ),
                Text(
                  "title : ${controller.post.value?.title ?? ''}",
                ),
                Text(
                  "body : ${controller.post.value?.body ?? ''}",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
