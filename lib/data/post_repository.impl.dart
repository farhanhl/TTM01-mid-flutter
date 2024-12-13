import 'package:dartz/dartz.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _remote;

  PostRepositoryImpl({required PostRemoteDataSource remote}) : _remote = remote;

  @override

  /// of Post entities. If any error occurs during the fetch, it returns a
  /// Left with the error message.
  /// Fetches all Posts from the remote data source, and returns them as a list
  Future<Either<String, List<Post>>> getAll() async {
    try {
      final posts = await _remote.fetchAll();
      return Right(posts.map((post) => post.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, Post>> getPostById(int postId) async {
    try {
      final posts = await _remote.fetchPostById(postId);
      return Right(posts.toEntity());
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }
}
