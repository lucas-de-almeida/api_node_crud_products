// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

class Product {
  int? productId;
  String productName;
  double preco;
  String productDescription;
  String dataCadastro;
  Product({
    this.productId,
    required this.productName,
    required this.preco,
    required this.productDescription,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {
      'productid': productId,
      'product_name': productName,
      'preco': preco,
      'product_description': productDescription,
      'data_cadastro': dataCadastro
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        productId: map['productid'] != null ? map['productid'] : null,
        productName: map['product_name'],
        preco: double.parse(map['preco'].toString()),
        productDescription: map['product_description'],
        dataCadastro: map['data_cadastro']);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(productid: $productId, product_name: $productName, preco: $preco, product_description: $productDescription, data_cadastro: $dataCadastro)';
  }
}
