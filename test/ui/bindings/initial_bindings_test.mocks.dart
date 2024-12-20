// Mocks generated by Mockito 5.4.4 from annotations
// in ttm01_flutter_dependency_injection/test/ui/bindings/initial_bindings_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart'
    as _i2;
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart'
    as _i4;
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart'
    as _i7;
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePostModel_0 extends _i1.SmartFake implements _i2.PostModel {
  _FakePostModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PostRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRemoteDataSource extends _i1.Mock
    implements _i4.PostRemoteDataSource {
  MockPostRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.PostModel>> fetchAll() => (super.noSuchMethod(
        Invocation.method(
          #fetchAll,
          [],
        ),
        returnValue: _i5.Future<List<_i2.PostModel>>.value(<_i2.PostModel>[]),
      ) as _i5.Future<List<_i2.PostModel>>);

  @override
  _i5.Future<_i2.PostModel> fetchPostById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchPostById,
          [id],
        ),
        returnValue: _i5.Future<_i2.PostModel>.value(_FakePostModel_0(
          this,
          Invocation.method(
            #fetchPostById,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.PostModel>);
}

/// A class which mocks [PostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRepository extends _i1.Mock implements _i6.PostRepository {
  MockPostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<String, List<_i7.Post>>> getAll() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<String, List<_i7.Post>>>.value(
            _FakeEither_1<String, List<_i7.Post>>(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<String, List<_i7.Post>>>);

  @override
  _i5.Future<_i3.Either<String, _i7.Post>> getPostById(int? postId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPostById,
          [postId],
        ),
        returnValue: _i5.Future<_i3.Either<String, _i7.Post>>.value(
            _FakeEither_1<String, _i7.Post>(
          this,
          Invocation.method(
            #getPostById,
            [postId],
          ),
        )),
      ) as _i5.Future<_i3.Either<String, _i7.Post>>);
}
