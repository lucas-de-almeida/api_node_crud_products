// ignore_for_file: constant_identifier_names

import 'package:crud/data/modules/home_page/bindings/home_page_bindings.dart';
import 'package:crud/data/modules/home_page/views/home_page.dart';
import 'package:crud/data/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomePageBindings(),
    ),
  ];
}
