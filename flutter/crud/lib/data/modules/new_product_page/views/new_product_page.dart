// ignore_for_file: sized_box_for_whitespace

import 'package:crud/data/modules/home_page/controllers/home_page_controller.dart';
import 'package:crud/data/modules/new_product_page/controller/new_controller_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

HomePageController homePageController = Get.find<HomePageController>();

class NewProductPage extends GetView<NewControllerPage> {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          validate();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Novo Produto'),
      ),
      body: Container(
        height: Get.height,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.textName,
                    decoration: InputDecoration(
                      labelText: 'Nome do produto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.amberAccent,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor digite um nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: controller.textDescription,
                    decoration: InputDecoration(
                      labelText: 'Descrição do produto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.amberAccent,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor digite uma descrição';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: controller.textQuantity,
                    decoration: InputDecoration(
                      labelText: 'Preço do produto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.amberAccent,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor insira um preço maior que zero';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validate() async {
    if (controller.formKey.currentState!.validate()) {
      await homePageController.productRepo.addProduct(
        productName: controller.textName.text,
        productDescription: controller.textDescription.text,
        preco: double.tryParse(controller.textQuantity.text)!,
        dataCadastro: DateFormat("dd-MM-yyyy").format(
          DateTime.now(),
        ),
      );

      homePageController.loadData();

      Get.back();
    } else {
      Get.snackbar('Erro', 'Falha ao adicionar produto');
    }
  }
}
