import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductProvider extends GetConnect {
  getAllProducts() async {
    var response = await get('http://192.168.100.10:3000/api/products');
    if (response.hasError) {
      Get.snackbar('erro', 'erro ao fazer busca de produtos');
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(title: "Error", content: Text("${response.body}}"));
    }
  }

  deleteProductById(int id) async {
    var response = await delete('http://192.168.100.10:3000/api/products/$id');
    if (response.hasError) {
      Get.snackbar('erro', 'erro ao fazer busca de produtos');
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(title: "Error", content: Text("${response.body}}"));
    }
  }
}
