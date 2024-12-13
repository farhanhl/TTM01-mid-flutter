import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/initial_bindings.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/home_page.dart';
import 'package:ttm01_flutter_dependency_injection/flavors/staging.dart'
    as staging;
import 'package:ttm01_flutter_dependency_injection/flavors/production.dart'
    as production;
import 'package:ttm01_flutter_dependency_injection/ui/pages/post_detail_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String flavor =
        String.fromEnvironment('flavor', defaultValue: "production");

    const String flavorName =
        flavor == "staging" ? staging.flavorName : production.flavorName;

    const String bundleId =
        flavor == "staging" ? staging.bundleId : production.bundleId;

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(
            bundleId: bundleId,
            flavorName: flavorName,
          ),
        ),
      ],
      initialBinding: InitialBindings(),
    );
  }
}
