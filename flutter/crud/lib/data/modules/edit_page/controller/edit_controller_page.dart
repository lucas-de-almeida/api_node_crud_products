import 'package:crud/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditControllerPage extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController textName = TextEditingController();
  TextEditingController textDescription = TextEditingController();
  TextEditingController textQuantity = TextEditingController();

  var product = Get.arguments as Product;

  @override
  void onInit() {
    textQuantity.text = product.preco.toString();
    textName.text = product.productName;
    textDescription.text = product.productDescription;

    super.onInit();
  }
}
