import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<String, List<Post>>> getAll();
  Future<Either<String, Post>> getPostById(int postId);
}
