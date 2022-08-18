import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_app/Src/Pages/auth/controller/auth_controller.dart';
import 'Src/PageRoute/app_pages.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Grocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        // scaffoldBackgroundColor: Colors.white.withAlpha(180),
      ),
      initialRoute: PageRoutes.splashRoute,
      getPages: AppPage.pages,
    );
  }
}
