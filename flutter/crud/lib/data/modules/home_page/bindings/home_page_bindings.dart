import 'package:crud/data/modules/home_page/controllers/home_page_controller.dart';
import 'package:crud/data/provider/product_provider.dart';
import 'package:crud/data/repository/products_repository.dart';
import 'package:get/get.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );

    Get.lazyPut<ProductsRepository>(
      () => ProductsRepository(),
    );

    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  }
}
