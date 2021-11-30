import 'dart:convert';

class Product {
  int? productId;
  String productName;
  int quantity;
  String productDescription;
  Product({
    this.productId,
    required this.productName,
    required this.quantity,
    required this.productDescription,
  });

  @override
  String toString() {
    return 'Product(productid: $productId, productName: $productName, quantity: $quantity, productDescription: $productDescription)';
  }

  Map<String, dynamic> toMap() {
    return {
      'productid': productId,
      'product_name': productName,
      'quantity': quantity,
      'product_description': productDescription,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productid'] != null ? map['productid'] : null,
      productName: map['product_name'],
      quantity: map['quantity'],
      productDescription: map['product_description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
