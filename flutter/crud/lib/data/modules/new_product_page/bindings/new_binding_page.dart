
import 'package:crud/data/modules/new_product_page/controller/new_controller_page.dart';
import 'package:get/get.dart';

class NewBindingPage implements Bindings {
  @override
  void dependencies() {
    Get.put(NewControllerPage());
  }
}