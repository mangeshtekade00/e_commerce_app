import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(item.product.title),
                  trailing: Text('\$${item.product.price} x ${item.quantity}'),
                );
              },
            ),
          ),
          Text('Total: \$${cartProvider.totalPrice}'),
          ElevatedButton(
            onPressed: () {
              // Navigate to checkout screen
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
