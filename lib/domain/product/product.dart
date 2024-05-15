import 'package:grocery/domain/product/product_id.dart';

class Product {
  final ProductId id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
