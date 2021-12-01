import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewControllerPage extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController textName = TextEditingController();
  TextEditingController textDescription = TextEditingController();
  TextEditingController textQuantity = TextEditingController();
}
