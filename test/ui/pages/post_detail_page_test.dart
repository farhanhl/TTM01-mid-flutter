import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/post_detail_page.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/post_detail_controller.dart';

import '../../widget_test.mocks.dart';

@GenerateMocks([PostRepositoryImpl])
void main() {
  final MockPostRepositoryImpl mockedRepository = MockPostRepositoryImpl();
  Get.lazyPut(() => PostDetailController(repo: mockedRepository));
  Get.put<PostRepository>(mockedRepository);

  testWidgets(
    'Should render post details when fetched successfully',
    (WidgetTester tester) async {
      when(mockedRepository.getPostById(1)).thenAnswer(
        (_) async => const Right(
          Post(
            id: 1,
            userId: 1,
            title: 'my post title',
            body: 'my post body',
          ),
        ),
      );

      await tester.pumpWidget(
        const GetMaterialApp(
          home: PostDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('userId : 1'), findsOneWidget);
      expect(find.text('id : 1'), findsOneWidget);
      expect(find.text('title : my post title'), findsOneWidget);
      expect(find.text('body : my post body'), findsOneWidget);
    },
  );
}
