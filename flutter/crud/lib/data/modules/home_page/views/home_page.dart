// ignore_for_file: sized_box_for_whitespace

import 'package:crud/data/models/product.dart';
import 'package:crud/data/modules/home_page/controllers/home_page_controller.dart';
import 'package:crud/data/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.NEW);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: controller.obx(
          (list) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: controller.listProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              Product product = list[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        backgroundColor: Colors.white,
                        title: product.productName,
                        titleStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        content: Column(
                          children: [
                            Text('Preço: R\$ ${product.preco}'),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 10, top: 10),
                              child: Text(
                                product.productDescription,
                                textAlign: TextAlign.center,
                                maxLines: 999,
                                softWrap: true,
                              ),
                            ),
                            Text(
                              'Data cadastro: ${product.dataCadastro}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        cancel: IconButton(
                          icon: const Icon(Icons.delete_outline_rounded),
                          onPressed: () {
                            controller.deleteProductById(product.productId!);
                            controller.loadData();

                            Get.back();
                          },
                        ),
                        confirm: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            Get.toNamed(Routes.EDIT, arguments: product);
                          },
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(product.productName),
                    decoration: BoxDecoration(
                        color: const Color(0xffdfdeff),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              );
            },
          ),
          //  ListView.builder(
          //   key: key,
          //   itemCount: controller.listProducts.length,
          //   itemBuilder: (context, index) {
          //     Product product = list[index];

          // return InkWell(
          //   onTap: () {
          //     Get.defaultDialog(
          //         backgroundColor: Colors.white,
          //         title: product.productName,
          //         content: Column(
          //           children: [
          //             Text('Quantidade ${product.quantity}'),
          //             Text(product.productDescription),
          //           ],
          //         ),
          //         cancel: IconButton(
          //           icon: const Icon(Icons.delete_outline_rounded),
          //           onPressed: () {
          //             controller.deleteProductByIdMock(product.productId!);
          //             controller.loadDataMock();
          //             Get.back();
          //           },
          //         ),
          //         confirm: IconButton(
          //           icon: const Icon(Icons.edit_outlined),
          //           onPressed: () {
          //             Get.toNamed(Routes.EDIT, arguments: product);
          //           },
          //         ));
          //     print('clicou no ${product.productId}');
          //   },
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: const Color(0xffdfdeff),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           margin: const EdgeInsets.symmetric(
          //               vertical: 10, horizontal: 10),
          //           padding: const EdgeInsets.all(20),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text('${controller.listProducts.length}'),
          //                   Text(
          //                     product.productName,
          //                     style: const TextStyle(
          //                         fontSize: 20,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.w700),
          //                   ),
          //                   Text(
          //                     product.productDescription,
          //                     style: const TextStyle(
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.w700),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        ),
      ),
    );
  }
}
