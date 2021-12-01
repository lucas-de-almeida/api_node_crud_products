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

  getProductById(int id) async {
    var response = await get('http://192.168.100.10:3000/api/products/$id');
    if (response.hasError) {
      Get.snackbar('erro', 'erro ao fazer busca do produto id: $id');
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(title: "Error", content: Text("${response.body}}"));
    }
  }

  addProduct(
      {required String productName,
      required String productDescription,
      required double preco,
      required String dataCadastro}) async {
    var response = await post('http://192.168.100.10:3000/api/products/', {
      'product_name': productName,
      'product_description': productDescription,
      'preco': preco,
      'data_cadastro': dataCadastro
    });
    if (response.hasError) {
      Get.defaultDialog(
          title: "Error Catch", content: Text("${response.statusText}"));
    }

    if (response.statusCode == 201) {
      return response.body;
    } else {
      Get.snackbar('Erro', 'Falha ao cadastrar produto');
      return null;
    }
  }

  updateProduct(String productName, String productDescription, double preco,
      String dataCadastro, int id) async {
    var response = await put('http://192.168.100.10:3000/api/products/$id', {
      'product_name': productName,
      'product_description': productDescription,
      'preco': preco,
      'productid': id,
      'data_cadastro': dataCadastro
    });
    if (response.hasError) {
      Get.defaultDialog(
          title: "Error Catch", content: Text("${response.statusText}"));
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.snackbar('Erro', 'Falha ao cadastrar produto');
      return null;
    }
  }
}
