import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(product.image),
            Text(product.title),
            Text('\$${product.price}'),
          ],
        ),
      ),
    );
  }
}
