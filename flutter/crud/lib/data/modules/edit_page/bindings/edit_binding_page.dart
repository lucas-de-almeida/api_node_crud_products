import 'package:crud/data/modules/edit_page/controller/edit_controller_page.dart';
import 'package:get/get.dart';

class EditBindingPage implements Bindings {
  @override
  void dependencies() {
    Get.put(EditControllerPage());
  }
}