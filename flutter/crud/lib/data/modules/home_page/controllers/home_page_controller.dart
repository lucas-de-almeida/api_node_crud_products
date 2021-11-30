import 'package:crud/data/models/product.dart';
import 'package:crud/data/repository/products_repository.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  final productRepo = Get.find<ProductsRepository>();
  String texto = 'meu texto do controller';
  RxList<Product> listProducts = <Product>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

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

  void deleteProductById(int id) async {}
}
