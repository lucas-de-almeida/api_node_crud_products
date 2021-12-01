import 'package:crud/data/models/product.dart';
import 'package:crud/data/provider/product_provider.dart';
import 'package:get/get.dart';

class ProductsRepository {
  final ProductProvider apiclient = Get.find<ProductProvider>();

  // List<Product> listProductMock = [
  //   Product(
  //       productDescription: 'primeiro produto',
  //       productName: 'produto um',
  //       preco: 1,
  //       productId: 1),
  //   Product(
  //       productDescription: 'segundo produto',
  //       productName: 'produto dois',
  //       preco: 2,
  //       productId: 2),
  //   Product(
  //       productDescription: 'terceiro produto',
  //       productName: 'produto tres',
  //       preco: 3,
  //       productId: 3),
  //   Product(
  //       productDescription: 'quarto produto',
  //       productName: 'produto quatro',
  //       preco: 4,
  //       productId: 4),
  //   Product(
  //       productDescription: 'quinto produto',
  //       productName: 'produto cinco',
  //       preco: 5,
  //       productId: 5),
  //   Product(
  //       productDescription: 'sexto produto',
  //       productName: 'produto seis',
  //       preco: 6,
  //       productId: 6),
  //   Product(
  //       productDescription: 'setimo produto',
  //       productName: 'produto sete',
  //       preco: 7,
  //       productId: 7),
  //   Product(
  //       productDescription: 'oitavo produto',
  //       productName: 'produto oito',
  //       preco: 8,
  //       productId: 8),
  // ];

  // Future<List<Product>> getAllProductsMock() async {
  //   await Duration(seconds: 2);
  //   return listProductMock;
  // }

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

  Future<Product> getProductById(int id) async {
    List<Product> list = <Product>[];
    var response = await apiclient.getProductById(id);
    if (response != null) {
      response.forEach((e) {
        list.add(Product.fromMap(e));
      });
    }
    return list.first;
  }

  Future<void> deleteProductById(int id) async {
    var response = await apiclient.deleteProductById(id);
    if (response != null) {
      print(response);
    }
  }

  // Future<void> deleteProductByIdMock(int id) async {
  //   listProductMock.removeWhere((element) => element.productId == id);
  //   await Duration(seconds: 2);
  // }

  Future<void> addProduct(
      {required String productName,
      required String productDescription,
      required double preco,
      required String dataCadastro}) async {
    var response = await apiclient.addProduct(
        productName: productName,
        productDescription: productDescription,
        preco: preco,
        dataCadastro: dataCadastro);
    if (response != null) {
      print(response);
    }
  }

  Future<void> updateProduct(String productName, String productDescription,
      double preco, int id) async {
    var response = await apiclient.updateProduct(
        productName, productDescription, preco, id);
    if (response != null) {
      print(response);
    }
  }
}
