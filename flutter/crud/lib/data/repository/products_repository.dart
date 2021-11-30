import 'package:crud/data/models/product.dart';
import 'package:crud/data/provider/product_provider.dart';
import 'package:get/get.dart';

class ProductsRepository {
  final ProductProvider apiclient = Get.find<ProductProvider>();

  Future<List<Product>> getAllProducts() async {
    List<Product> list = <Product>[];
    var response = await apiclient.getAllProducts();
    if (response != null) {
      response.forEach((e) {
        list.add(Product.fromMap(e));
      });
    }
    return list;
  }

  Future<void> deleteProductById(int id) async {
    var response = await apiclient.deleteProductById(id);
    if (response != null) {
      print(response);
    }
  }
}
