import 'package:mockito/mockito.dart';
import 'package:get/get_connect.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';
import '../common/logger_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:get/get_connect/connect.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';

import 'post.remote_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource])
@GenerateMocks([GetConnect])
@GenerateNiceMocks([MockSpec<PostRemoteDataSourceImpl>()])
void main() {
  late PostRemoteDataSourceImpl mockRemote;
  late MockLogger mockLogger;
  late MockGetConnect mockGetConnect;
  late MockPostRemoteDataSourceImpl mockDataSource;

  setUp(() {
    mockLogger = MockLogger();
    mockGetConnect = MockGetConnect();
    mockRemote = PostRemoteDataSourceImpl(mockLogger);
    mockDataSource = MockPostRemoteDataSourceImpl();
  });

  test('fetchAll success', () async {
    const mockResponse = Response(
      statusCode: 200,
      body: [
        {
          'userId': 1,
          'id': 1,
          'title': 'my post title',
          'body': 'my post body',
        },
        {
          'userId': 1,
          'id': 2,
          'title': 'my post title 2',
          'body': 'my post body 2',
        },
      ],
    );
    final mockPostData = [
      const PostModel(
        userId: 1,
        id: 1,
        title: 'my post title',
        body: 'my post body',
      )
    ];

    when(mockGetConnect.get('/posts')).thenAnswer((_) async => mockResponse);
    await mockRemote.fetchAll();
    when(mockDataSource.fetchAll()).thenAnswer((_) async => mockPostData);
    final posts = await mockDataSource.fetchAll();
    expect(posts.length, 1);
    verify(mockDataSource.fetchAll()).called(1);
  });

  test('fetchAll failure logs error when fetching posts fails', () async {
    const mockResponse = Response(
      statusCode: 500,
      statusText: 'Internal Server Error',
      body: 'Server Error',
    );

    when(mockGetConnect.get('/posts')).thenThrow((_) async => mockResponse);

    try {
      await mockRemote.fetchAll();
    } catch (e) {
      expect(e, isA<ServerException>());
      expect((e as ServerException).statusCode, 500);
      logMessage(mockLogger, 'Error fetching posts: 500');
      verify(mockLogger.i('Error fetching posts: 500')).called(1);
    }
  });

  test('fetchPostById success', () async {
    const mockResponse = Response(
      statusCode: 200,
      body: {
        'userId': 1,
        'id': 1,
        'title': 'my post title',
        'body': 'my post body',
      },
    );
    const mockPostData = PostModel(
      userId: 1,
      id: 1,
      title: 'my post title',
      body: 'my post body',
    );

    when(mockGetConnect.get('/posts/1')).thenAnswer((_) async => mockResponse);
    await mockRemote.fetchPostById(1);
    when(mockDataSource.fetchPostById(1)).thenAnswer((_) async => mockPostData);
    final posts = await mockDataSource.fetchPostById(1);
    expect(posts.title, "my post title");
    verify(mockDataSource.fetchPostById(1)).called(1);
  });

  test('fetchPostById failure (server error)', () async {
    const mockResponse = Response(
      statusCode: 500,
      statusText: 'Internal Server Error',
      body: 'Server Error',
    );

    when(mockGetConnect.get('/posts/1')).thenThrow((_) async => mockResponse);

    try {
      await mockRemote.fetchPostById(1);
    } catch (e) {
      expect(e, isA<ServerException>());
      expect((e as ServerException).statusCode, 500);
      logMessage(mockLogger, 'Error fetching post by ID: 500');
      verify(mockLogger.i('Error fetching post by ID: 500')).called(1);
    }
  });
}
