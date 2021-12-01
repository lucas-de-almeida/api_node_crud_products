import 'package:crud/data/modules/edit_page/controller/edit_controller_page.dart';
import 'package:crud/data/modules/home_page/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomePageController homePageController = Get.find<HomePageController>();

class EditPage extends GetView<EditControllerPage> {
  const EditPage({Key? key}) : super(key: key);

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
        title: const Text('Atualizar Produto'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Id do produto selecionado: ${controller.product.productId}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
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
    );
  }

  void validate() async {
    if (controller.formKey.currentState!.validate()) {
      controller.product.productName = controller.textName.text;
      controller.product.productDescription = controller.textDescription.text;
      controller.product.preco = double.tryParse(controller.textQuantity.text)!;

      await homePageController.updateProduct(
          productName: controller.textName.text,
          productDescription: controller.textDescription.text,
          preco: double.tryParse(controller.textQuantity.text)!,
          id: (controller.product.productId!),
          dataCadastro: controller.product.dataCadastro);
      homePageController.loadData();

      Get.back();
      Get.back();
    } else {
      Get.snackbar('Erro', 'Falha ao atualizar produto');
    }
  }
}
