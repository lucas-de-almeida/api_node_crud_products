import 'package:crud/data/models/product.dart';
import 'package:crud/data/repository/products_repository.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  final productRepo = Get.find<ProductsRepository>();
  String texto = 'meu texto do controller';
  RxList<Product> listProducts = <Product>[].obs;

  @override
  void onInit() {
    if (listProducts.isEmpty) {
      print('carregando lista ');
      //loadDataMock();
      loadData();
    }
    super.onInit();
  }

  // void loadDataMock() async {
  //   print('rodando loadDataMock');
  //   await productRepo.getAllProductsMock().then((value) {
  //     listProducts.assignAll(value);
  //     if (value.length > 0) {
  //       change(value, status: RxStatus.success());
  //     } else {
  //       change(null, status: RxStatus.empty());
  //     }
  //   }, onError: (error) {
  //     change(null, status: RxStatus.error('Houve um erro na requisição.'));
  //   });
  // }

  void loadData() async {
    await productRepo.getAllProducts().then((value) {
      listProducts.assignAll(value);
      if (value.length > 0) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    });
  }

  void deleteProductById(int id) async {
    await productRepo.deleteProductById(id);
  }

  // void deleteProductByIdMock(int id) async {
  //   await productRepo.deleteProductByIdMock(id);
  // }

  void updateProduct({
    required String productName,
    required String productDescription,
    required double preco,
    required int id,
  }) async {
    await productRepo.updateProduct(
      productName,
      productDescription,
      preco,
      id,
    );
  }
}
