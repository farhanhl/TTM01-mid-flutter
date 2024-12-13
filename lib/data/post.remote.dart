import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
import 'package:logger/logger.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchAll();
  Future<PostModel> fetchPostById(int id);
}

class PostRemoteDataSourceImpl extends GetConnect
    implements PostRemoteDataSource {
  final Logger logger;

  PostRemoteDataSourceImpl(this.logger) {
    super.baseUrl = 'https://jsonplaceholder.typicode.com';
  }

  @override
  Future<List<PostModel>> fetchAll() async {
    logMessage(logger, 'Fetching posts');
    final response = await get('/posts');
    if (response.status.hasError) {
      logMessageError(logger, 'Error fetching posts: ${response.statusCode}');
      throw ServerException(response.statusText!,
          statusCode: response.statusCode!, details: response.body);
    }

    logMessage(logger, 'Posts fetched successfully');
    return (response.body as List).map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<PostModel> fetchPostById(int postId) async {
    logMessage(logger, 'Fetching post by ID: $postId');
    final response = await get('/posts/$postId');
    if (response.status.hasError) {
      logMessageError(
          logger, 'Error fetching post by ID: ${response.statusCode}');
      throw ServerException(
        response.statusText ?? "",
        statusCode: response.statusCode ?? 0,
        details: response.body,
      );
    }

    logMessage(logger, 'Post Detail fetched successfully');
    return PostModel.fromJson(response.body);
  }
}
