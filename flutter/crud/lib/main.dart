import 'package:crud/data/modules/home_page/bindings/home_page_bindings.dart';
import 'package:crud/data/modules/home_page/views/home_page.dart';
import 'package:crud/data/routes/app_pages.dart';
import 'package:crud/data/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
      home: HomePage(),
      initialBinding: HomePageBindings(),
    );
  }
}
