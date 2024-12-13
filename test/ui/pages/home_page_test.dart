import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/home_page.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/post_detail_page.dart';

import '../../widget_test.mocks.dart';

@GenerateMocks([PostRepositoryImpl])
void main() {
  final MockPostRepositoryImpl mockedRepository = MockPostRepositoryImpl();
  Get.lazyPut(() => HomeController(repo: mockedRepository));
  Get.put<PostRepository>(mockedRepository);

  testWidgets(
    'Should navigate to post detail page when a post is tapped',
    (WidgetTester tester) async {
      when(mockedRepository.getAll()).thenAnswer(
        (_) async => const Right([
          Post(
            id: 1,
            userId: 1,
            title: 'my post title',
            body: 'my post body',
          ),
          Post(
            id: 2,
            userId: 2,
            title: 'my post title 2',
            body: 'my post body 2',
          ),
        ]),
      );

      when(mockedRepository.getPostById(1)).thenAnswer(
        (_) async => const Right(Post(
          id: 1,
          userId: 1,
          title: 'my post title',
          body: 'my post body',
        )),
      );

      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => const HomePage(
                bundleId: 'com.myblog',
                flavorName: 'Production',
              ),
            ),
            GetPage(
              name: '/post-detail-page',
              page: () => const PostDetailPage(),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('my post title'), findsOneWidget);
      expect(find.text('my post title 2'), findsOneWidget);

      await tester.tap(find.text('my post title'));
      await tester.pumpAndSettle();

      expect(find.text('Post Detail Page'), findsOneWidget);
      expect(Get.arguments, 1);
    },
  );
}
