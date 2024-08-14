import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;
  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  void addToCart(CartItem item) {
    var existingItem = _cartItems.firstWhere((i) => i.product.id == item.product.id, orElse: () => CartItem(product: item.product));
    if (existingItem != null) {
      existingItem.quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.removeWhere((i) => i.product.id == item.product.id);
    notifyListeners();
  }
}
